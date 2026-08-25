import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:century_cqg/Helper/nerve_base.dart';
import 'package:century_cqg/Helper/nerve_colors.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';
import 'package:century_cqg/Screens/Trade/Holdings/ui/holding_page.dart';
import 'package:century_cqg/Screens/Trade/History/ui/history_main_page.dart';
import 'package:century_cqg/Screens/Trade/service/trade_page_service.dart';
import 'package:century_cqg/Screens/Trade/ui/positions/position_symbol_details.dart';
import 'package:century_cqg/Screens/Trade/ui/orders/order_details.dart';
import 'package:century_cqg/Screens/Trade/service/trade_service.dart';

class TradePage extends StatefulWidget {
  final int initialTabIndex;

  const TradePage({super.key, this.initialTabIndex = 0});

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  bool _didInitTabIndex = false;

  @override
  Widget build(BuildContext context) {
    return Consumer2<TradeService, TradePageService>(
      builder: (context, tradeService, tradePageService, _) {
        if (!_didInitTabIndex) {
          _didInitTabIndex = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) {
              return;
            }
            context.read<TradePageService>().setSelectedTabIndex(
              widget.initialTabIndex,
            );
          });
        }

        final isDarkMode = NerveBase().isDarkMode;
        final cardColor = isDarkMode ? const Color(0xFF1E2120) : Colors.white;
        final borderColor =
            isDarkMode ? const Color(0xFF282D2A) : const Color(0xFFE7EAE8);
        final titleColor = isDarkMode ? Colors.white : const Color(0xFF2A2A2A);
        final subtitleColor =
            isDarkMode ? const Color(0xFFA8AEAB) : const Color(0xFF6E7471);
        final dividerColor =
            isDarkMode ? const Color(0xFF2A302D) : const Color(0xFFE8ECEA);
        final contentBg = isDarkMode ? const Color(0xFF0D110F) : Colors.white;
        final positiveColor = const Color(0xFF00C389);

        final summary = tradeService.summary;
        final selectedTabIndex = tradePageService.selectedTabIndex;
        final tabs = tradePageService.tabs;
        final positions = tradePageService.positions;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: contentBg,
                border: Border(
                  bottom: BorderSide(color: borderColor, width: 1),
                ),
              ),
              child: Row(
                children: List.generate(tabs.length, (index) {
                  final isSelected = selectedTabIndex == index;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        tradePageService.setSelectedTabIndex(index);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              tabs[index],
                              style: NerveStyles.tradeTabLabelStyle(
                                isSelected ? titleColor : subtitleColor,
                              ),
                            ),
                          ),
                          Container(
                            height: 4,
                            width: 72,
                            color:
                                isSelected
                                    ? NerveColors.selectedNavColor
                                    : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            if (selectedTabIndex == 0)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    color: cardColor,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Total P&L',
                                      style: NerveStyles.tradePnlLabelStyle(
                                        subtitleColor,
                                      ),
                                    ),
                                    Text(
                                      summary.totalPnL,
                                      style: NerveStyles.tradePnlAmountStyle(
                                        positiveColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Day P&L  ',
                                      style: NerveStyles.tradePnlLabelStyle(
                                        subtitleColor,
                                      ),
                                    ),
                                    Text(
                                      '+\$3,215',
                                      style: NerveStyles.tradePnlAmountStyle(
                                        positiveColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Net Positions',
                              style: NerveStyles.tradeNetPositionTitleStyle(
                                titleColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ...List.generate(positions.length, (index) {
                            final item = positions[index];
                            return Dismissible(
                              key: ValueKey('${item.symbol}-$index'),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF6B2525),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20),
                                child: const Icon(
                                  Icons.delete_outline,
                                  color: Color(0xFFFF4A4A),
                                  size: 22,
                                ),
                              ),
                              onDismissed: (_) {
                                tradePageService.removePositionAt(index);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: contentBg,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 32,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: item.badgeColor,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            item.badge,
                                            style:
                                                NerveStyles.tradePositionAvatarTextStyle(),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.symbol,
                                                style:
                                                    NerveStyles.tradePositionSymbolStyle(
                                                      titleColor,
                                                    ),
                                              ),
                                              const SizedBox(height: 3),
                                              Text(
                                                item.avgPrice,
                                                style:
                                                    NerveStyles.tradePositionPriceStyle(
                                                      titleColor,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (
                                                      _,
                                                    ) => PositionSymbolDetailsPage(
                                                      symbol: item.symbol,
                                                      avgPrice: item.avgPrice,
                                                      side: item.side,
                                                      netUnits: item.netUnits,
                                                      averageAmount:
                                                          item.averageAmount,
                                                      netPnL: item.netPnL,
                                                      badge: item.badge,
                                                      badgeColor:
                                                          item.badgeColor,
                                                    ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 42,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 14,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    isDarkMode
                                                        ? const Color(
                                                          0xFF3A433F,
                                                        )
                                                        : const Color(
                                                          0xFFDCE2DE,
                                                        ),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'All Positions',
                                                  style:
                                                      NerveStyles.tradePositionPillTextStyle(
                                                        subtitleColor,
                                                      ),
                                                ),
                                                const SizedBox(width: 8),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 7,
                                                        vertical: 2,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    color: const Color(
                                                      0xFFF2C400,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                  child: Text(
                                                    '16',
                                                    style:
                                                        NerveStyles.tradePositionBadgeCountStyle(
                                                          const Color(
                                                            0xFF222222,
                                                          ),
                                                        ),
                                                  ),
                                                ),
                                                const SizedBox(width: 6),
                                                Icon(
                                                  Icons.chevron_right,
                                                  color: subtitleColor,
                                                  size: 18,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: _positionMetric(
                                            'B/S',
                                            item.side,
                                            subtitleColor,
                                            positiveColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: _positionMetric(
                                            'Net Units',
                                            item.netUnits,
                                            subtitleColor,
                                            titleColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: _positionMetric(
                                            'Avg. Price',
                                            item.averageAmount,
                                            subtitleColor,
                                            titleColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: _positionMetric(
                                            'Net P&L',
                                            item.netPnL,
                                            subtitleColor,
                                            positiveColor,
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (index != positions.length - 1)
                                      Container(
                                        margin: const EdgeInsets.only(top: 14),
                                        height: 1,
                                        color: dividerColor,
                                      ),
                                  ],
                                ),
                              ),
                            );
                          }),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            else if (selectedTabIndex == 1)
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: OrderDetailsPage(),
                ),
              )
            else if (selectedTabIndex == 2)
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: HoldingPage(),
                ),
              )
            else if (selectedTabIndex == 3)
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: HistoryPage(),
                ),
              )
            else
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Text(
                    '${tabs[selectedTabIndex]} screen coming soon',
                    style: NerveStyles.tradePlaceholderStyle(subtitleColor),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _positionMetric(
    String label,
    String value,
    Color labelColor,
    Color valueColor, {
    TextAlign textAlign = TextAlign.start,
  }) {
    return Column(
      crossAxisAlignment:
          textAlign == TextAlign.end
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: textAlign,
          style: NerveStyles.tradePositionMetricLabelStyle(labelColor),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          textAlign: textAlign,
          style: NerveStyles.tradePositionMetricValueStyle(valueColor),
        ),
      ],
    );
  }
}
