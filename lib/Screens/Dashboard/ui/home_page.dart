import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:century_cqg/Helper/nerve_colors.dart';
import 'package:century_cqg/Screens/Dashboard/service/dasboard_service.dart';
import 'package:century_cqg/Screens/Watchlist/service/watchlist_service.dart';
import 'package:century_cqg/Screens/Account/ui/account_page.dart';
import 'package:century_cqg/Screens/Dashboard/ui/dashboad_bodyView.dart';
import 'package:century_cqg/Screens/Dashboard/ui/dashboard_appbar.dart';
import 'package:century_cqg/Screens/Watchlist/ui/watchlist_page.dart';
import 'package:century_cqg/Screens/Watchlist/ui/create_watchlist_page.dart';
import 'package:century_cqg/Helper/nerve_base.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  int _selectedIndex = 0;

  final List<String> _tabNames = [
    'Home',
    'Watchlists',
    'Account',
    'Trades',
    'Scalper',
  ];

  Widget _buildPageContent(bool isDarkMode) {
    if (_selectedIndex == 0) {
      return DashboardBodyView();
    } else if (_selectedIndex == 1) {
      return WatchlistPage();
    } else if (_selectedIndex == 2) {
      return AccountPage();
    } else {
      return Center(
        child: Text(
          _tabNames[_selectedIndex],
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<DashboardService>();
    final watchlistService = context.watch<WatchlistService>();

    NerveBase().getScreenSize(NerveBase().screenWidth, false);
    final isDarkMode = NerveBase().isDarkMode;
    final watchlistTabs = watchlistService.watchedLists;
    final selectedWatchlistTabIndex = watchlistService.selectedTabIndex;

    final bgColor =
        isDarkMode ? const Color(0xFF0D110F) : const Color(0xFFF6F6F6);

    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: bgColor,
        appBar:
            _selectedIndex == 0
                ? const DashboardAppbar()
                : _selectedIndex == 1
                ? const CommonAppbar(title: 'Watched list')
                : _selectedIndex == 2
                ? const CommonAppbar(title: 'Accounts')
                : null,
        body: SafeArea(
          child: Container(
            width: NerveBase().screenWidth,
            color: bgColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_selectedIndex == 1)
                  Container(
                    width: double.infinity,
                    color:
                        isDarkMode
                            ? const Color(0xFF0D110F)
                            : NerveColors.solidWhiteColor,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                watchlistTabs.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    context
                                        .read<WatchlistService>()
                                        .setSelectedTabIndex(index);
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 8,
                                        ),
                                        child: Text(
                                          watchlistTabs[index],
                                          style:
                                              selectedWatchlistTabIndex == index
                                                  ? NerveStyles.black_medium_14_400(
                                                    isDarkMode,
                                                  )
                                                  : NerveStyles.grey_medium_14(
                                                    isDarkMode,
                                                  ),
                                        ),
                                      ),
                                      if (selectedWatchlistTabIndex == index)
                                        Container(
                                          height: 3,
                                          width: 78,
                                          color: NerveColors.selectedNavColor,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            final watchlistProvider =
                                context.read<WatchlistService>();
                            final createdName = await Navigator.of(
                              context,
                            ).push<String>(
                              MaterialPageRoute(
                                builder: (_) => const CreateWatchlistPage(),
                              ),
                            );

                            if (createdName != null) {
                              watchlistProvider.selectWatchlistByName(
                                createdName,
                              );
                            }
                          },
                          icon: Icon(
                            Icons.add,
                            size: 24,
                            color: NerveStyles.iconColor(isDarkMode),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (_selectedIndex == 1)
                  Container(
                    height: 1,
                    color:
                        isDarkMode ? const Color(0xFF282D2A) : Colors.grey[300],
                  ),
                Container(
                  height: 8,
                  color: isDarkMode ? const Color(0xFF010302) : bgColor,
                ),
                Expanded(
                  child:
                      _selectedIndex == 0
                          ? SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 8,
                                  color:
                                      isDarkMode
                                          ? const Color(0xFF010302)
                                          : bgColor,
                                ),
                                DashboardBodyView(),
                              ],
                            ),
                          )
                          : _selectedIndex == 1
                          ? Column(
                            children: [
                              const Expanded(child: WatchlistPage()),
                              Container(
                                height: 8,
                                color:
                                    isDarkMode
                                        ? const Color(0xFF010302)
                                        : bgColor,
                              ),
                            ],
                          )
                          : _buildPageContent(isDarkMode),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color:
                    NerveBase().isDarkMode
                        ? const Color(0xFF282D2A)
                        : Colors.grey[300]!,
                width: 1,
              ),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            backgroundColor:
                NerveBase().isDarkMode ? const Color(0xFF0D110F) : Colors.white,
            selectedItemColor: NerveColors.selectedNavColor,

            unselectedItemColor:
                NerveBase().isDarkMode ? Colors.grey[600] : Colors.grey[400],
            elevation: 0,
            enableFeedback: false,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'lib/Resources/Images/x home icon.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 0
                        ? NerveColors.selectedNavColor
                        : (NerveBase().isDarkMode
                            ? Colors.grey[600]!
                            : Colors.grey[400]!),
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'lib/Resources/Images/x Watchlist Icon.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 1
                        ? NerveColors.selectedNavColor
                        : (NerveBase().isDarkMode
                            ? Colors.grey[600]!
                            : Colors.grey[400]!),
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Watchlists',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'lib/Resources/Images/Group 876.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 2
                        ? NerveColors.selectedNavColor
                        : (NerveBase().isDarkMode
                            ? Colors.grey[600]!
                            : Colors.grey[400]!),
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Account',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'lib/Resources/Images/x trades icon.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 3
                        ? NerveColors.selectedNavColor
                        : (NerveBase().isDarkMode
                            ? Colors.grey[600]!
                            : Colors.grey[400]!),
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Trades',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'lib/Resources/Images/Group 877.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 4
                        ? NerveColors.selectedNavColor
                        : (NerveBase().isDarkMode
                            ? Colors.grey[600]!
                            : Colors.grey[400]!),
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Scalper',
              ),
            ],
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
