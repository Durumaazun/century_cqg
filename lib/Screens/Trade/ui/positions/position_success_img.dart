import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:century_cqg/Helper/nerve_base.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';

class NetPosClsSuccesPage extends StatelessWidget {
  final String symbol;
  final String unitsSold;
  final String unitsBought;

  const NetPosClsSuccesPage({
    super.key,
    required this.symbol,
    this.unitsSold = '2.00',
    this.unitsBought = '0.00',
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = NerveBase().isDarkMode;
    final sheetHeight = MediaQuery.of(context).size.height * 0.60;
    final bgColor = isDarkMode ? const Color(0xFF111614) : Colors.white;
    final borderColor =
        isDarkMode ? const Color(0xFF2B302D) : const Color(0xFFE6E9E7);
    final titleColor = isDarkMode ? Colors.white : const Color(0xFF4B4F54);
    final mutedColor =
        isDarkMode ? const Color(0xFF8A918D) : const Color(0xFF8A9199);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Material(
            color: bgColor,
            child: SizedBox(
              height: sheetHeight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 38,
                      height: 4,
                      decoration: BoxDecoration(
                        color: borderColor,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                    const SizedBox(height: 22),
                    SvgPicture.asset(
                      'lib/Resources/Images/position_success_img.svg',
                      width: 72,
                      height: 72,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Position Closed Successfully',
                      style: NerveStyles.tradeDetailsSectionTitleStyle(
                        titleColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Your order has been executed',
                      style: NerveStyles.tradeDetailsOrderDateStyle(mutedColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color:
                            isDarkMode
                                ? const Color(0xFF171D1A)
                                : const Color(0xFFF9FAFB),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 29),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Column(
                        children: [
                          _infoRow('PRODUCT', symbol, mutedColor, titleColor),
                          _divider(borderColor),
                          _infoRow(
                            'UNITS SOLD',
                            unitsSold,
                            mutedColor,
                            titleColor,
                          ),
                          _divider(borderColor),
                          _infoRow(
                            'UNITS BOUGHT',
                            unitsBought,
                            mutedColor,
                            titleColor,
                          ),
                          _divider(borderColor),
                          _infoRow(
                            'NET POSITION',
                            'Closed',
                            mutedColor,
                            const Color(0xFFDB3D52),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '23 Sep 2022   •   3:26 PM GST',
                      style: NerveStyles.tradeDetailsOrderDateStyle(mutedColor),
                    ),

                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xFFF2C400),
                          foregroundColor: const Color(0xFF1F1F1F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Done'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(
    String label,
    String value,
    Color labelColor,
    Color valueColor,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: NerveStyles.tradeDetailsOrderDateStyle(labelColor),
            ),
          ),
          Text(
            value,
            style: NerveStyles.tradeDetailsHeaderSymbolStyle(valueColor),
          ),
        ],
      ),
    );
  }

  Widget _divider(Color color) {
    return Container(height: 1, color: color);
  }
}
