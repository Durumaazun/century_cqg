import 'package:flutter/material.dart';

class NerveColors {
  static const Color transparentColor = Colors.transparent;
  static const Color whiteColor = Colors.white;
  static const Color solidWhiteColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color blackColor = Colors.black;
  static const Color containerBorderColor = Color(0xFFF2F2F2);
  static const Color loginBorderColor = Color(0xFFECECEC);
  static const Color loginTextfieldBorderColor = Color(0xFFE5E5E5);
  static const Color loginProceedButtonBGColor = Color(0xFF3380D9);
  static const Color loginProceedButtonShadowColor = Color.fromRGBO(
    0,
    0,
    0,
    0.16,
  );
  static const Color orangeColor = Color(0xFFF58634);
  static const Color blueColor = Color(0xFF3380D9);
  static const Color softGreenBackgroundColor = Color.fromRGBO(
    46,
    189,
    133,
    0.1,
  );
  static const Color selectedNavColor = Color(0xFFF2C400);
  static const Color trendingBadgeBG = Color(0xFFF2C400);
  static const Color trendingBadgeText = Color(0xFF444444);
  static const Color searchTextfieldBorderColor = Color(0x1A000000);
  static const Color chartbgGreenLigth = Color(0x0D22C55E);
  static const Color chartbgGreenDark = Color(0xFF2A3A32);

  // Activity Feed Badge Colors
  static const Color activityCompleteBadgeColor = Color(0xFF1ABC9C);
  static const Color activityCompleteBadgeBG = Color(0xFFE8F8F5);
  static const Color activityAlertBadgeColor = Color(0xFFF39C12);
  static const Color activityAlertBadgeBG = Color(0xFFFEF5E7);
  static const Color activitySystemBadgeColor = Color(0xFF95A5A6);
  static const Color activitySystemBadgeBG = Color(0xFFF4F6F7);

  static const Color loginHintTextColor = Color.fromRGBO(68, 68, 68, 0.5);
  static const Color loginHintTextColor2 = Color.fromARGB(120, 51, 51, 51);
  static const Color loginTextColor = Color(0xFF444444);
  static const Color loginProceedButtonTextColor = Color(0xFF444444);
  static const Color dataTableBorderColor = Color(0xFFB2B2B2);
  static const Color dataTableHeadingBGColor = Color.fromRGBO(
    242,
    242,
    242,
    1.0,
  );
  static const Color dataTableTextfieldBGColor = Color.fromRGBO(
    248,
    248,
    248,
    1.0,
  );
  static const Color dataTableTextfieldBorderColor = Color.fromRGBO(
    233,
    233,
    233,
    1.0,
  );
  static const Color goBackBorderColor = Color(0xFF1592E6);
  static const Color goBackBGColor = Color(0xFFF6F6F6);
  static const Color goBackTextColor = Color(0xFFF58634);
  static const Color dashboardUserNameShadowColor = Color.fromRGBO(
    0,
    0,
    0,
    0.11,
  );
  static const Color dashboardMenuShadowColor = Color.fromRGBO(
    7,
    148,
    255,
    0.12,
  );
  static const Color disableTableColumnBGColor = Color(0xFFF6F6F6);

  static const Color dividerColor = Color(0xFFA1A1A1);
  static const Color buyColor = Color(0xFF00CC33);
  static const Color sellColor = Color(0xFFFF0000);
  static const Color borderColor = Color(0x7CAFAFAF);
  static const Color watchlistText = Color(0xFF707070);
  static const Color marketText = Color(0xFF333333);
  static const Color searchSymbolPlaceHolderColor = Color(0xFF707070);

  static const Color lightAppBarBackground = Colors.white;
  static const Color darkAppBarBackground = Color(0xFF0D110F);
  static const Color lightProjectBackground = Color(0xFFF6F6F6);
  static const Color darkProjectBackground = Color(0xFF0D110F);
  static const Color lightTitleColor = Colors.black87;
  static const Color darkTitleColor = Colors.white;
  static const Color lightIconColor = Colors.black54;
  static const Color darkIconColor = Colors.white70;
  static const Color lightIconBackground = Colors.black12;
  static const Color darkIconBackground = Colors.white12;

  static Color appBarBackground(bool isDarkMode) {
    return isDarkMode ? darkAppBarBackground : lightAppBarBackground;
  }

  static Color titleColor(bool isDarkMode) {
    return isDarkMode ? darkTitleColor : lightTitleColor;
  }

  static Color iconColor(bool isDarkMode) {
    return isDarkMode ? darkIconColor : lightIconColor;
  }

  static Color iconBackground(bool isDarkMode) {
    return isDarkMode ? darkIconBackground : lightIconBackground;
  }

  static Color projectBackgroundColor(bool isDarkMode) {
    return isDarkMode ? darkProjectBackground : lightProjectBackground;
  }

  static Color scaffoldBackgroundColor(bool isDarkMode) {
    return projectBackgroundColor(isDarkMode);
  }

  static Color primaryColor(bool isDarkMode) {
    return isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
  }

  static Color textColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : const Color(0xFF444444);
  }

  static Color secondaryTextColor(bool isDarkMode) {
    return isDarkMode ? Colors.white70 : const Color(0xFF707070);
  }
}
