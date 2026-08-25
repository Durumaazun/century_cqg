import 'package:flutter/material.dart';

import 'package:century_cqg/Helper/nerve_base.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';
import 'package:century_cqg/Screens/Trade/ui/positions/position_symbol_details.dart';

class NetPosClosedPage extends StatelessWidget {
  const NetPosClosedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = NerveBase().isDarkMode;
    final pageBg =
        isDarkMode ? const Color(0xFF0D110F) : const Color(0xFFF7F9F8);
    final cardColor = isDarkMode ? const Color(0xFF0F1412) : Colors.white;
    final borderColor =
        isDarkMode ? const Color(0xFF252A28) : const Color(0xFFE1E6E3);
    final dividerColor =
        isDarkMode ? const Color(0xFF222826) : const Color(0xFFE8ECEA);
    final titleColor = isDarkMode ? Colors.white : const Color(0xFF212826);
    final mutedColor =
        isDarkMode ? const Color(0xFF808985) : const Color(0xFF727A76);
    final positiveColor = const Color(0xFF00C389);
    final negativeColor = const Color(0xFFDB3D52);

    final closedPositions = const <_ClosedPositionItem>[
      _ClosedPositionItem(
        symbol: 'AAPL',
        closeDate: '23 May 2026',
        closePrice: '577.87',
        side: 'Buy',
        qty: '2',
        pnl: '+130.00',
        badge: 'A',
        badgeColor: Color(0xFF8E8E93),
      ),
      _ClosedPositionItem(
        symbol: 'TSLA',
        closeDate: '22 May 2026',
        closePrice: '127.45',
        side: 'Sell',
        qty: '2',
        pnl: '-79.20',
        badge: 'T',
        badgeColor: Color(0xFFE82127),
      ),
      _ClosedPositionItem(
        symbol: 'NVDA',
        closeDate: '21 May 2026',
        closePrice: '974.30',
        side: 'Buy',
        qty: '2',
        pnl: '+210.55',
        badge: 'N',
        badgeColor: Color(0xFF4E2B2B),
      ),
    ];

    return Scaffold(
      backgroundColor: pageBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cardColor,
        surfaceTintColor: pageBg,
        titleSpacing: 0,
        title: Text(
          'Net Positions Closed',
          style: NerveStyles.tradeDetailsHeaderSymbolStyle(titleColor),
        ),
        iconTheme: IconThemeData(color: titleColor),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: NerveStyles.tradeDetailsCardDecoration(
                  cardColor,
                  borderColor,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Closed Positions',
                          style: NerveStyles.tradeDetailsSectionTitleStyle(
                            titleColor,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${closedPositions.length} items',
                          style: NerveStyles.tradeDetailsOrderDateStyle(
                            mutedColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _summaryMetric(
                            'Closed P&L',
                            '+321.35',
                            positiveColor,
                            mutedColor,
                          ),
                        ),
                        Expanded(
                          child: _summaryMetric(
                            'Win Rate',
                            '66%',
                            titleColor,
                            mutedColor,
                          ),
                        ),
                        Expanded(
                          child: _summaryMetric(
                            'Avg. Hold',
                            '4.2d',
                            titleColor,
                            mutedColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
                decoration: NerveStyles.tradeDetailsCardDecoration(
                  cardColor,
                  borderColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recently Closed',
                      style: NerveStyles.tradeDetailsSectionTitleStyle(
                        titleColor,
                      ),
                    ),
                    const SizedBox(height: 18),
                    ...List.generate(closedPositions.length, (index) {
                      final item = closedPositions[index];
                      return _ClosedPositionRow(
                        item: item,
                        cardColor: cardColor,
                        borderColor: borderColor,
                        dividerColor: dividerColor,
                        titleColor: titleColor,
                        mutedColor: mutedColor,
                        positiveColor: positiveColor,
                        negativeColor: negativeColor,
                        showDivider: index != closedPositions.length - 1,
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _ClosedPositionsBottomSheetTrigger(
        isDarkMode: isDarkMode,
      ),
    );
  }

  Widget _summaryMetric(
    String label,
    String value,
    Color valueColor,
    Color labelColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: NerveStyles.tradePositionMetricLabelStyle(labelColor),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: NerveStyles.tradeDetailsOrderMetricValueStyle(valueColor),
        ),
      ],
    );
  }
}

class _ClosedPositionsBottomSheetTrigger extends StatelessWidget {
  final bool isDarkMode;

  const _ClosedPositionsBottomSheetTrigger({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final borderColor =
        isDarkMode ? const Color(0xFF252A28) : const Color(0xFFE1E6E3);
    final bgColor = isDarkMode ? const Color(0xFF0F1412) : Colors.white;

    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border(top: BorderSide(color: borderColor)),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => const _ClosedPositionsBottomSheet(),
              );
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: const Color(0xFFF2C400),
              foregroundColor: const Color(0xFF1F1F1F),
            ),
            child: const Text('Close All'),
          ),
        ),
      ),
    );
  }
}

class _ClosedPositionsBottomSheet extends StatelessWidget {
  const _ClosedPositionsBottomSheet();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = NerveBase().isDarkMode;
    final bgColor = isDarkMode ? const Color(0xFF111614) : Colors.white;
    final borderColor =
        isDarkMode ? const Color(0xFF2B302D) : const Color(0xFFD3D8D5);
    final titleColor = isDarkMode ? Colors.white : const Color(0xFF2A2A2A);
    final mutedColor =
        isDarkMode ? const Color(0xFF8A918D) : const Color(0xFF737A76);
    final lineColor =
        isDarkMode ? const Color(0xFF2B302D) : const Color(0xFFE8ECEA);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Material(
            color: bgColor,
            child: Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: borderColor)),
              ),
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 38,
                      height: 4,
                      decoration: BoxDecoration(
                        color: lineColor,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Are you sure you want to CLOSE ALL positions of AAPL?',
                    style: NerveStyles.tradeDetailsSectionTitleStyle(
                      titleColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...List.generate(4, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: index == 3 ? 0 : 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            margin: const EdgeInsets.only(top: 18),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2C400),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(
                              Icons.check,
                              size: 12,
                              color: Color(0xFF1F1F1F),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Units',
                                        style:
                                            NerveStyles.tradeDetailsOrderDateStyle(
                                              mutedColor,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'B/S',
                                        textAlign: TextAlign.center,
                                        style:
                                            NerveStyles.tradeDetailsOrderDateStyle(
                                              mutedColor,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Units',
                                        textAlign: TextAlign.center,
                                        style:
                                            NerveStyles.tradeDetailsOrderDateStyle(
                                              mutedColor,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'P&L',
                                        textAlign: TextAlign.end,
                                        style:
                                            NerveStyles.tradeDetailsOrderDateStyle(
                                              mutedColor,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '#54548592',
                                        style:
                                            NerveStyles.tradeDetailsHeaderSymbolStyle(
                                              titleColor,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Buy',
                                        textAlign: TextAlign.center,
                                        style:
                                            NerveStyles.tradeDetailsOrderPnlStyle(
                                              const Color(0xFF00C389),
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '2',
                                        textAlign: TextAlign.center,
                                        style:
                                            NerveStyles.tradeDetailsHeaderSymbolStyle(
                                              titleColor,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '+\$130.00',
                                        textAlign: TextAlign.end,
                                        style:
                                            NerveStyles.tradeDetailsOrderPnlStyle(
                                              const Color(0xFF00C389),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            side: BorderSide(color: borderColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            foregroundColor: titleColor,
                          ),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (_) => const PositionSymbolDetailsPage(
                                      symbol: 'AAPL',
                                      avgPrice: '577.87',
                                      side: 'Buy',
                                      netUnits: '2',
                                      averageAmount: '66,000.66',
                                      netPnL: '+\$130.00',
                                      badge: 'A',
                                      badgeColor: Color(0xFF8E8E93),
                                    ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            backgroundColor: const Color(0xFFF2C400),
                            foregroundColor: const Color(0xFF1F1F1F),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Close 4 Positions'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ClosedPositionRow extends StatelessWidget {
  final _ClosedPositionItem item;
  final Color cardColor;
  final Color borderColor;
  final Color dividerColor;
  final Color titleColor;
  final Color mutedColor;
  final Color positiveColor;
  final Color negativeColor;
  final bool showDivider;

  const _ClosedPositionRow({
    required this.item,
    required this.cardColor,
    required this.borderColor,
    required this.dividerColor,
    required this.titleColor,
    required this.mutedColor,
    required this.positiveColor,
    required this.negativeColor,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = item.pnl.startsWith('+');

    return Container(
      padding: const EdgeInsets.only(bottom: 12, right: 16, top: 8),
      decoration: NerveStyles.tradeDetailsCardDecoration(
        cardColor,
        borderColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(color: item.badgeColor),
                alignment: Alignment.center,
                child: Text(
                  item.badge,
                  style: NerveStyles.tradePositionAvatarTextStyle(),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.symbol,
                      style: NerveStyles.tradeDetailsHeaderSymbolStyle(
                        titleColor,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item.closeDate,
                      style: NerveStyles.tradeDetailsOrderDateStyle(mutedColor),
                    ),
                  ],
                ),
              ),
              Text(
                item.pnl,
                style: NerveStyles.tradeDetailsOrderPnlStyle(
                  isPositive ? positiveColor : negativeColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _metric('B/S', item.side, mutedColor, titleColor),
              ),
              Expanded(child: _metric('Qty', item.qty, mutedColor, titleColor)),
              Expanded(
                child: _metric(
                  'Close Price',
                  item.closePrice,
                  mutedColor,
                  titleColor,
                ),
              ),
            ],
          ),
          if (showDivider) ...[
            Container(
              margin: const EdgeInsets.only(top: 14),
              height: 1,
              color: dividerColor,
            ),
          ],
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
        const SizedBox(height: 8),
        Text(
          value,
          style: NerveStyles.tradePositionMetricValueStyle(valueColor),
        ),
      ],
    );
  }
}

class _ClosedPositionItem {
  final String symbol;
  final String closeDate;
  final String closePrice;
  final String side;
  final String qty;
  final String pnl;
  final String badge;
  final Color badgeColor;

  const _ClosedPositionItem({
    required this.symbol,
    required this.closeDate,
    required this.closePrice,
    required this.side,
    required this.qty,
    required this.pnl,
    required this.badge,
    required this.badgeColor,
  });
}
