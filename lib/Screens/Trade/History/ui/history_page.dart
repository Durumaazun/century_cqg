import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:century_cqg/Helper/nerve_styles.dart';
import 'package:century_cqg/Screens/Trade/History/model/history_model.dart';
import 'package:century_cqg/Screens/Trade/History/service/history_service.dart';

class HistoryList extends StatelessWidget {
  final Color mutedColor;
  final Color textColor;

  const HistoryList({required this.mutedColor, required this.textColor});

  @override
  Widget build(BuildContext context) {
    final history = context.watch<HistoryService>().history;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Row(
            children: [
              Text(
                'History',
                style: NerveStyles.tradeDetailsSectionTitleStyle(textColor),
              ),
              const Spacer(),
              Icon(Icons.sort, size: 18, color: mutedColor),
              const SizedBox(width: 10),
              Icon(Icons.filter_alt_outlined, size: 18, color: mutedColor),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            itemCount: history.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = history[index];
              final showDate =
                  index == 0 || item.dateLabel != history[index - 1].dateLabel;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showDate) ...[
                    if (index != 0) const SizedBox(height: 16),
                    Text(
                      item.dateLabel,
                      style: NerveStyles.tradeDetailsSectionTitleStyle(
                        textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  _historyRow(item, textColor, mutedColor),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _historyRow(HistoryItem item, Color textColor, Color mutedColor) {
    const sellColor = Color(0xFFE53935);
    const takeProfitColor = Color(0xFF00A879);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 12),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: item.iconColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                alignment: Alignment.center,
                child: Text(
                  item.iconText,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                item.symbol,
                style: NerveStyles.tradePositionSymbolStyle(textColor),
              ),
              const Spacer(),
              Text(
                item.orderId,
                style: NerveStyles.tradeDetailsOrderDateStyle(mutedColor),
              ),
              const SizedBox(width: 8),
              Icon(Icons.access_time, size: 13, color: mutedColor),
              const SizedBox(width: 4),
              Text(
                item.orderTime,
                style: NerveStyles.tradeDetailsOrderDateStyle(mutedColor),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _metric(
                  'Type',
                  '${item.side} ${item.status}',
                  sellColor,
                  mutedColor,
                ),
              ),
              Expanded(
                child: _metric('Units', item.units, textColor, mutedColor),
              ),
              Expanded(
                child: _metric('Price', item.price, textColor, mutedColor),
              ),
              Expanded(
                child: _slTpMetric(
                  item,
                  sellColor,
                  takeProfitColor,
                  mutedColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _metric(
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
        const SizedBox(height: 5),
        Text(
          value,
          style: NerveStyles.tradeDetailsOrderBuyValueStyle(valueColor),
        ),
      ],
    );
  }

  Widget _slTpMetric(
    HistoryItem item,
    Color stopLossColor,
    Color takeProfitColor,
    Color labelColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SL / TP',
          style: NerveStyles.tradePositionMetricLabelStyle(labelColor),
        ),
        const SizedBox(height: 5),
        RichText(
          text: TextSpan(
            style: NerveStyles.tradeDetailsOrderBuyValueStyle(stopLossColor),
            children: [
              TextSpan(text: '${item.stopLoss} / '),
              TextSpan(
                text: item.takeProfit,
                style: NerveStyles.tradeDetailsOrderBuyValueStyle(
                  takeProfitColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
