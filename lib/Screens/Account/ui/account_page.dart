import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';
import 'package:century_cqg/Helper/nerve_colors.dart';
import 'package:century_cqg/Screens/Account/service/account_service.dart';
import 'package:century_cqg/Screens/Account/accnts_tabs/ui/analysis_tab.dart';
import 'package:century_cqg/Screens/Account/accnts_tabs/ui/overview_tab.dart';
import 'package:century_cqg/Screens/Account/accnts_tabs/ui/settings_tab.dart';
import 'package:century_cqg/Helper/nerve_base.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  final List<String> _tabs = const ['Overview', 'Analysis', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountService>(
      builder: (context, accountProvider, _) {
        final isDarkMode = NerveBase().isDarkMode;
        final bgColor =
            isDarkMode ? const Color(0xFF0D110F) : const Color(0xFFF6F6F6);
        final selectedTabIndex = accountProvider.selectedTabIndex;
        final appBarBackground =
            isDarkMode ? const Color(0xFF0D110F) : NerveColors.solidWhiteColor;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tab Navigation
              Container(
                color: appBarBackground,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: List.generate(
                    _tabs.length,
                    (index) => GestureDetector(
                      onTap: () {
                        accountProvider.setSelectedTabIndex(index);
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
                              _tabs[index],
                              style:
                                  selectedTabIndex == index
                                      ? NerveStyles.black_medium_14_400(
                                        isDarkMode,
                                      )
                                      : NerveStyles.grey_medium_14(isDarkMode),
                            ),
                          ),
                          if (selectedTabIndex == index)
                            Container(
                              height: 3,
                              width: 70,
                              color: NerveColors.selectedNavColor,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 1,
                color: isDarkMode ? const Color(0xFF282D2A) : Colors.grey[300],
              ),
              Container(
                height: 8,
                color: isDarkMode ? const Color(0xFF010302) : bgColor,
              ),
              // Tab Content
              Container(
                color: bgColor,
                padding:
                    ((selectedTabIndex == 0) || (selectedTabIndex == 1))
                        ? EdgeInsets.zero
                        : const EdgeInsets.all(16),
                child: _buildTabContent(selectedTabIndex),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabContent(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return const OverviewTab();
      case 1:
        return const AnalysisTab();
      case 2:
        return const SettingsTab();
      default:
        return Container();
    }
  }
}
