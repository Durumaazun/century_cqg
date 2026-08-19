// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'nerve_colors.dart';

class NerveStyles {
  static const double appBarHeight = 50;
  static const EdgeInsetsGeometry iconPadding = EdgeInsets.all(6.0);
  static const Color filterChipBackground = Color(0xFFF1F3F2);
  static const Color filterChipSelectedBackground = Color(0xFFFFC400);

  static TextStyle filterTitleStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font20,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle filterSectionLabelStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font12,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static BoxDecoration filterChipDecoration({bool selected = false}) {
    return BoxDecoration(
      color: selected ? filterChipSelectedBackground : filterChipBackground,
      borderRadius: BorderRadius.circular(7),
    );
  }

  static TextStyle filterChipTextStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font12,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static Color appBarBackground(bool isDarkMode) {
    return NerveColors.appBarBackground(isDarkMode);
  }

  static Color titleColor(bool isDarkMode) {
    return NerveColors.titleColor(isDarkMode);
  }

  static Color iconColor(bool isDarkMode) {
    return NerveColors.iconColor(isDarkMode);
  }

  static Color iconBackground(bool isDarkMode) {
    return NerveColors.iconBackground(isDarkMode);
  }

  static Color rowBorderColor(bool isDarkMode) {
    return isDarkMode ? const Color(0xFF282D2A) : const Color(0xFFECECEC);
  }

  static TextStyle titleTextStyle(bool isDarkMode) {
    return black_medium_16(isDarkMode).copyWith(color: titleColor(isDarkMode));
  }

  static TextStyle tradeTabLabelStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font16,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle tradePnlLabelStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font9,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle tradePnlAmountStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font12,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle tradeNetPositionTitleStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font16,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle tradePositionSymbolStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font14,
      fontWeight: FontWeight.w500,
      height: 16 / 14,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle tradePositionPriceStyle(Color color) {
    return tradePositionSymbolStyle(color);
  }

  static TextStyle tradePositionPillTextStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font12,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle tradePositionBadgeCountStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font10,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle tradePositionMetricLabelStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font10,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle tradePositionMetricValueStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font12,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle tradePositionAvatarTextStyle() {
    return const TextStyle(
      fontFamily: 'Inter',
      fontSize: _font14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
  }

  static TextStyle tradePlaceholderStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font14,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle tradeDetailsAppBarTitleStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font18,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle tradeDetailsHeaderSymbolStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font14,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle tradeDetailsCloseAllButtonStyle() {
    return const TextStyle(
      fontFamily: 'Inter',
      fontSize: _font14,
      fontWeight: FontWeight.w500,
      height: 16 / 14,
      letterSpacing: 0,
    );
  }

  static TextStyle tradeDetailsSectionTitleStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font16,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle tradeDetailsOrderIdStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font12,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle tradeDetailsOrderPnlStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font12,
      fontWeight: FontWeight.w600,
      height: 1,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle tradeDetailsOrderDateStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font12,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle tradeDetailsStatusBadgeStyle() {
    return const TextStyle(
      fontFamily: 'Inter',
      fontSize: _font11,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
      color: Color(0xFFA68D21),
    );
  }

  static TextStyle tradeDetailsOrderMetricLabelStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font13,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle tradeDetailsOrderMetricValueStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font24,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
      color: color,
    );
  }

  static TextStyle tradeDetailsOrderBuyValueStyle(Color color) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: _font12,
      fontWeight: FontWeight.w500,
      height: 1,
      letterSpacing: 0,
      color: color,
    );
  }

  static BoxDecoration tradeDetailsCardDecoration(
    Color background,
    Color borderColor,
  ) {
    return BoxDecoration(color: background);
  }

  static BoxDecoration tradeDetailsStatusBadgeDecoration() {
    return BoxDecoration(
      color: const Color(0xFFFFF8E1),
      // borderRadius: BorderRadius.circular(12),
    );
  }

  static const BoxDecoration tradeDetailsCloseIconDecoration = BoxDecoration(
    color: Color(0xFFFEF2F3),
    shape: BoxShape.circle,
  );

  static const _fontFamilyCenturyGothic = 'CenturyGothic';

  static const _fontFamilySegoeUI = 'SegoeUI';

  static const _fontFamilyLato = 'Lato';

  static const _fontFamilyRoboto = 'Roboto';

  static const _font9 = 9.0;

  static const _font10 = 10.0;

  static const _font11 = 11.0;

  static const _font12 = 12.0;

  static const _font13 = 13.0;

  static const _font14 = 14.0;

  static const _font15 = 15.0;

  static const _font16 = 16.0;

  static const _font17 = 17.0;

  static const _font18 = 18.0;

  static const _font19 = 19.0;

  static const _font20 = 20.0;

  static const _font21 = 21.0;

  static const _font22 = 22.0;

  static const _font23 = 23.0;

  static const _font24 = 24.0;

  static const _font28 = 28.0;

  static const _font25 = 25.0;

  static const _font30 = 30.0;

  static TextStyle _themedStyle(
    bool isDarkMode,
    TextStyle baseStyle, {
    required Color lightColor,
    Color? darkColor,
  }) {
    return baseStyle.copyWith(
      color: isDarkMode ? (darkColor ?? lightColor) : lightColor,
    );
  }

  static TextStyle _textStyle(bool isDarkMode, TextStyle baseStyle) {
    return _themedStyle(
      isDarkMode,
      baseStyle,
      lightColor: NerveColors.textColor(false),
      darkColor: NerveColors.textColor(true),
    );
  }

  static TextStyle _secondaryTextStyle(bool isDarkMode, TextStyle baseStyle) {
    return _themedStyle(
      isDarkMode,
      baseStyle,
      lightColor: NerveColors.secondaryTextColor(false),
      darkColor: NerveColors.secondaryTextColor(true),
    );
  }

  static TextStyle _whiteTextStyle(bool isDarkMode, TextStyle baseStyle) {
    return _themedStyle(
      isDarkMode,
      baseStyle,
      lightColor: Colors.white,
      darkColor: Colors.white,
    );
  }

  static TextStyle _blueTextStyle(bool isDarkMode, TextStyle baseStyle) {
    return _themedStyle(
      isDarkMode,
      baseStyle,
      lightColor: const Color(0xFF0062FF),
      darkColor: const Color(0xFFA8D5FF),
    );
  }

  static TextStyle _redTextStyle(bool isDarkMode, TextStyle baseStyle) {
    return _themedStyle(
      isDarkMode,
      baseStyle,
      lightColor: const Color(0xFFF9330A),
      darkColor: const Color(0xFFFF8A65),
    );
  }

  static TextStyle _greenTextStyle(bool isDarkMode, TextStyle baseStyle) {
    return _themedStyle(
      isDarkMode,
      baseStyle,
      lightColor: const Color(0xFF36AA49),
      darkColor: const Color(0xFF7AD98B),
    );
  }

  static TextStyle _warningTextStyle(bool isDarkMode, TextStyle baseStyle) {
    return _themedStyle(
      isDarkMode,
      baseStyle,
      lightColor: const Color(0xFFFFA561),
      darkColor: const Color(0xFFFFC78A),
    );
  }

  static TextStyle normal_12(bool isDarkMode) {
    return _secondaryTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font12,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle black_normal_11(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font11,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle blue_grey_normal_15(bool isDarkMode) {
    return _secondaryTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font15,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle blue_grey_bold_14(bool isDarkMode) {
    return _secondaryTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle grey_bold_12(bool isDarkMode) {
    return _secondaryTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font13,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle grey_bold_14(bool isDarkMode) {
    return _secondaryTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle grey_medium_12(bool isDarkMode) {
    return _secondaryTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font12,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static TextStyle grey_medium_13(bool isDarkMode) {
    return _secondaryTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font13,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle grey_medium_14(bool isDarkMode) {
    return _secondaryTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle light_grey_medium_14(bool isDarkMode) {
    return _secondaryTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle light_grey_medium_16(bool isDarkMode) {
    return _secondaryTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle black_bold_18(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle black_bold_24(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle black_bold_25(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle black_medium_18(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle black_medium_14_400(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static TextStyle black_medium_14_500(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle black_medium_16(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.w500,
        height: 21 / 16,
        letterSpacing: 0.0,
      ),
    );
  }

  static TextStyle black_medium_12(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font12,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle black_medium_12_400(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font12,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static TextStyle blue_medium_12(bool isDarkMode) {
    return _blueTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font12,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle blue_medium_14(bool isDarkMode) {
    return _blueTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle blue_medium_16(bool isDarkMode) {
    return _blueTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle white_medium_14(bool isDarkMode) {
    return _whiteTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle white_medium_16(bool isDarkMode) {
    return _whiteTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle white_medium_12(bool isDarkMode) {
    return _whiteTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font12,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle red_medium_14(bool isDarkMode) {
    return _redTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle dark_yellow_medium_14(bool isDarkMode) {
    return _warningTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle dark_yellow_medium_16(bool isDarkMode) {
    return _warningTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle yellow_medium_14(bool isDarkMode) {
    return _warningTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle yellow_medium_16(bool isDarkMode) {
    return _warningTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle red_medium_12(bool isDarkMode) {
    return _redTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font12,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle red_medium_16(bool isDarkMode) {
    return _redTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle green_medium_14(bool isDarkMode) {
    return _greenTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static TextStyle green_medium_12_400(bool isDarkMode) {
    return _greenTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font12,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static TextStyle green_medium_12_600(bool isDarkMode) {
    return _greenTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static TextStyle green_medium_16(bool isDarkMode) {
    return _greenTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle black_regular_12(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font12,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle black_regular_14(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle black_regular_16(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle black_regular_18(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font18,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle black_bold_14(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle black_bold_14_2(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle black_bold_16(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle black_bold_12(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle normal_18(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font18,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle white_bold_18(bool isDarkMode) {
    return _whiteTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle white_bold_14(bool isDarkMode) {
    return _whiteTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle white_bold_12(bool isDarkMode) {
    return _whiteTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle bold_18(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle blue_bold_16(bool isDarkMode) {
    return _blueTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle blue_bold_18(bool isDarkMode) {
    return _blueTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle blue_bold_14(bool isDarkMode) {
    return _blueTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle blue_bold_12(bool isDarkMode) {
    return _blueTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font12,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle red_bold_14(bool isDarkMode) {
    return _redTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle blue_bold_20(bool isDarkMode) {
    return _blueTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle green_bold_18(bool isDarkMode) {
    return _greenTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle green_bold_14(bool isDarkMode) {
    return _greenTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle red_bold_18(bool isDarkMode) {
    return _redTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle red_normal_16(bool isDarkMode) {
    return _redTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle red_regular_16(bool isDarkMode) {
    return _redTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle red_bold_16(bool isDarkMode) {
    return _redTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle normal_16(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle normal_14(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle blue_16(bool isDarkMode) {
    return _blueTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle bold_14(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle bold_16(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle regular_14(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font14,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle grey_bold_16(bool isDarkMode) {
    return _secondaryTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle grey_normal_16(bool isDarkMode) {
    return _secondaryTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle grey_bold_18(bool isDarkMode) {
    return _secondaryTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle grey_medium_18(bool isDarkMode) {
    return _secondaryTextStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle black_bold_22(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle login_title_2(bool isDarkMode) {
    return _textStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font18,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle login_title_welcome(bool isDarkMode) {
    return _themedStyle(
      isDarkMode,
      const TextStyle(
        fontFamily: _fontFamilyRoboto,
        fontSize: _font20,
        fontWeight: FontWeight.bold,
      ),
      lightColor: const Color(0xFFF58634),
      darkColor: const Color(0xFFFFA75C),
    );
  }

  static black_regular_14_400(bool isDarkMode) {}
}
