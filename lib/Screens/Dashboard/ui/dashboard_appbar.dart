import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:century_cqg/Screens/Dashboard/service/dasboard_service.dart';
import 'package:century_cqg/Helper/nerve_base.dart';
import '../../../Helper/nerve_styles.dart';
import '../../Search/ui/search_page.dart';

class DashboardAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(NerveStyles.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardService>(
      builder: (context, service, _) {
        final isDarkMode = NerveBase().isDarkMode;
        final titleColor = NerveStyles.titleColor(isDarkMode);
        final iconColor = NerveStyles.iconColor(isDarkMode);
        final appBarBackground = NerveStyles.appBarBackground(isDarkMode);

        return AppBar(
          toolbarHeight: NerveStyles.appBarHeight,
          automaticallyImplyLeading: false,
          backgroundColor: appBarBackground,
          elevation: 0,
          titleSpacing: 16,
          shape: Border(
            bottom: BorderSide(
              color: NerveStyles.rowBorderColor(isDarkMode),
              width: 1,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: SvgPicture.asset(
              'lib/Resources/Images/Logo.svg',
              width: 101,
              height: 22,
              fit: BoxFit.contain,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      // nTangle - Navigate to SearchPage when search icon is tapped
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SearchPage(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: NerveStyles.iconPadding,
                      child: Icon(Icons.search, size: 18, color: iconColor),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: NerveStyles.iconPadding,
                      child: Icon(
                        Icons.notifications,
                        size: 18,
                        color: iconColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Switch.adaptive(
                    value: isDarkMode,
                    activeColor: titleColor,
                    onChanged: (value) {
                      service.setDarkMode(value);
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onSearchTap;

  const CommonAppbar({super.key, required this.title, this.onSearchTap});

  @override
  Size get preferredSize => const Size.fromHeight(NerveStyles.appBarHeight);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = NerveBase().isDarkMode;
    return AppBar(
      toolbarHeight: NerveStyles.appBarHeight,
      automaticallyImplyLeading: false,
      backgroundColor: NerveStyles.appBarBackground(isDarkMode),
      elevation: 0,
      titleSpacing: 16,
      shape: Border(
        bottom: BorderSide(
          color: NerveStyles.rowBorderColor(isDarkMode),
          width: 1,
        ),
      ),
      title: Text(title, style: NerveStyles.titleTextStyle(isDarkMode)),
      centerTitle: false,
      actions: [
        InkWell(
          onTap: onSearchTap ?? () {},
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: NerveStyles.iconPadding,
            child: Icon(
              Icons.search,
              size: 22,
              color: NerveStyles.iconColor(isDarkMode),
            ),
          ),
        ),
        SizedBox(),
      ],
    );
  }
}
