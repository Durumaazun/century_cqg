import 'package:flutter/material.dart';

import 'package:century_cqg/Helper/nerve_base.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';
import 'package:century_cqg/Screens/Trade/ui/orders/modify_order.dart';
import 'package:century_cqg/Screens/Trade/ui/orders/order_cancel_page.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = NerveBase().isDarkMode;

    final bgColor = isDarkMode ? const Color(0xFF0D110F) : Colors.white;
    final borderColor =
        isDarkMode ? const Color(0xFF2A302D) : const Color(0xFFE8ECEA);
    final titleColor = isDarkMode ? Colors.white : const Color(0xFF2A2A2A);
    final mutedColor =
        isDarkMode ? const Color(0xFF8F9793) : const Color(0xFF7A817D);
    final positiveColor = const Color(0xFF00C389);

    const orders = <_OrderItem>[
      _OrderItem(
        symbol: 'AAPL',
        iconText: 'A',
        iconBg: Color(0xFF111111),
        type: 'Limit',
        tag1: '',
        tag2: '',
      ),
      _OrderItem(
        symbol: 'TSLA',
        iconText: 'T',
        iconBg: Color(0xFFE82127),
        type: 'Limit',
        tag1: '',
        tag2: '',
      ),
      _OrderItem(
        symbol: 'TSLA 4500',
        iconText: 'T',
        iconBg: Color(0xFFE82127),
        type: 'Limit',
        tag1: 'Call',
        tag2: '30 Jun',
      ),
      _OrderItem(
        symbol: 'TSLA 4500',
        iconText: 'N',
        iconBg: Color(0xFF6BAF2A),
        type: 'Limit',
        tag1: 'Put',
        tag2: '30 Jun',
      ),
    ];

    return Container(
      color: bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Text(
                  'Orders',
                  style: NerveStyles.tradeDetailsSectionTitleStyle(titleColor),
                ),
                const Spacer(),
                Icon(Icons.sort, size: 18, color: mutedColor),
                const SizedBox(width: 10),
                Icon(Icons.filter_alt_outlined, size: 18, color: mutedColor),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ModifyOrderPage(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '#54548592',
                              style: NerveStyles.tradeDetailsOrderDateStyle(
                                mutedColor,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF8E1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'In Progress',
                                style:
                                    NerveStyles.tradeDetailsStatusBadgeStyle(),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '2:56 GST',
                              style: NerveStyles.tradeDetailsOrderDateStyle(
                                mutedColor,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                _showCancelOrderBottomSheet(
                                  context,
                                  isDarkMode,
                                );
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFF0F2),
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.close,
                                  size: 10,
                                  color: Color(0xFFFF8D99),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: order.iconBg,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                order.iconText,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              order.symbol,
                              style: NerveStyles.tradePositionSymbolStyle(
                                titleColor,
                              ),
                            ),
                            if (order.tag1.isNotEmpty) ...[
                              const SizedBox(width: 8),
                              _pill(
                                order.tag1,
                                const Color(0xFFD7ECFF),
                                const Color(0xFF3E6DA9),
                              ),
                            ],
                            if (order.tag2.isNotEmpty) ...[
                              const SizedBox(width: 6),
                              _pill(
                                order.tag2,
                                const Color(0xFFFFDDE2),
                                const Color(0xFFB04D5A),
                              ),
                            ],
                            const Spacer(),
                            Text(
                              '+3.76%',
                              style: NerveStyles.tradeDetailsOrderPnlStyle(
                                positiveColor,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '\$577.87',
                              style: NerveStyles.tradePositionSymbolStyle(
                                titleColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _metric(
                                'B/S',
                                'Buy',
                                mutedColor,
                                positiveColor,
                              ),
                            ),
                            Expanded(
                              child: _metric(
                                'Type',
                                order.type,
                                mutedColor,
                                titleColor,
                              ),
                            ),
                            Expanded(
                              child: _metric(
                                'Units',
                                '200',
                                mutedColor,
                                titleColor,
                              ),
                            ),
                            Expanded(
                              child: _metric(
                                'Price',
                                '164.68',
                                mutedColor,
                                titleColor,
                              ),
                            ),
                            Expanded(
                              child: _metric(
                                'Stop Loss',
                                '158.00',
                                mutedColor,
                                const Color(0xFFFF5A5A),
                              ),
                            ),
                            Expanded(
                              child: _metric(
                                'Take Profit',
                                '172.00',
                                mutedColor,
                                positiveColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(height: 1, color: borderColor),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _metric(
    String label,
    String value,
    Color labelColor,
    Color valueColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: NerveStyles.tradePositionMetricLabelStyle(labelColor),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: NerveStyles.tradeDetailsOrderBuyValueStyle(valueColor),
        ),
      ],
    );
  }

  Widget _pill(String text, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: fg,
        ),
      ),
    );
  }

  void _showCancelOrderBottomSheet(BuildContext context, bool isDarkMode) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) {
        final sheetColor = isDarkMode ? const Color(0xFF1E2120) : Colors.white;
        final titleColor = isDarkMode ? Colors.white : const Color(0xFF3B3F44);
        final bodyColor =
            isDarkMode ? const Color(0xFFB2B8B4) : const Color(0xFF4D545A);
        final backBorderColor =
            isDarkMode ? const Color(0xFF69706C) : const Color(0xFF9FA6AC);

        return SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
            decoration: BoxDecoration(
              color: sheetColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 34,
                    height: 4,
                    decoration: BoxDecoration(
                      color:
                          isDarkMode
                              ? const Color(0xFF5A5F5C)
                              : const Color(0xFF55585B),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Cancel Order',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: titleColor,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Are you sure you want to cancel this order?',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: bodyColor,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(bottomSheetContext).pop();
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(46),
                          side: BorderSide(color: backBorderColor),
                          foregroundColor: bodyColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(bottomSheetContext).pop();
                          showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) {
                              return const OrderCancelPage(
                                symbol: 'AAPL',
                                units: '22',
                                amount: '\$164.68',
                                orderType: 'Time Trigger',
                                gtcDate: '07/06/2026',
                                stopLoss: '\$163.3',
                                transactionId: 'UT#6406356',
                                orderId: '#84060356',
                                orderSide: 'Sell',
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(46),
                          backgroundColor: const Color(0xFFF2C400),
                          foregroundColor: const Color(0xFF1F1F1F),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Yes, Cancel',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _OrderItem {
  final String symbol;
  final String iconText;
  final Color iconBg;
  final String type;
  final String tag1;
  final String tag2;

  const _OrderItem({
    required this.symbol,
    required this.iconText,
    required this.iconBg,
    required this.type,
    required this.tag1,
    required this.tag2,
  });
}
