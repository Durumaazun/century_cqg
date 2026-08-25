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
import 'package:century_cqg/Screens/Trade/ui/positions/trade_page.dart';
import 'package:century_cqg/Helper/nerve_base.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  final List<String> _tabNames = [
    'Home',
    'Watchlists',
    'Account',
    'Trades',
    'Scalper',
  ];

  Widget _buildPageContent(bool isDarkMode, int selectedIndex) {
    if (selectedIndex == 0) {
      return DashboardBodyView();
    } else if (selectedIndex == 1) {
      return WatchlistPage();
    } else if (selectedIndex == 2) {
      return AccountPage();
    } else if (selectedIndex == 3) {
      return const TradePage();
    } else {
      return Center(
        child: Text(
          _tabNames[selectedIndex],
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
    final dashboardService = context.watch<DashboardService>();
    final watchlistService = context.watch<WatchlistService>();
    final selectedIndex = dashboardService.selectedHomeTabIndex;

    NerveBase().getScreenSize(NerveBase().screenWidth, false);
    final isDarkMode = NerveBase().isDarkMode;
    final watchlistTabs = watchlistService.watchedLists;
    final selectedWatchlistTabIndex = watchlistService.selectedTabIndex;

    final bgColor = NerveColors.projectBackgroundColor(isDarkMode);

    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: bgColor,
        appBar:
            selectedIndex == 0
                ? const DashboardAppbar()
                : selectedIndex == 1
                ? const CommonAppbar(title: 'Watched list')
                : selectedIndex == 2
                ? const CommonAppbar(title: 'Accounts')
                : selectedIndex == 3
                ? const CommonAppbar(title: 'Trades')
                : null,
        body: SafeArea(
          top: false,
          child: Container(
            width: NerveBase().screenWidth,
            color: bgColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (selectedIndex == 1)
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
                if (selectedIndex == 1)
                  Container(
                    height: 1,
                    color:
                        isDarkMode ? const Color(0xFF282D2A) : Colors.grey[300],
                  ),
                if (selectedIndex != 2 && selectedIndex != 3)
                  Container(height: 8, color: bgColor),
                Expanded(
                  child:
                      selectedIndex == 0
                          ? SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(height: 2, color: bgColor),
                                DashboardBodyView(),
                              ],
                            ),
                          )
                          : selectedIndex == 1
                          ? Column(
                            children: [
                              const Expanded(child: WatchlistPage()),
                              Container(height: 8, color: bgColor),
                            ],
                          )
                          : _buildPageContent(isDarkMode, selectedIndex),
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
            currentIndex: selectedIndex,
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
                    selectedIndex == 0
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
                    selectedIndex == 1
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
                    selectedIndex == 2
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
                    selectedIndex == 3
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
                    selectedIndex == 4
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
              context.read<DashboardService>().setSelectedHomeTabIndex(index);
            },
          ),
        ),
      ),
    );
  }
}
