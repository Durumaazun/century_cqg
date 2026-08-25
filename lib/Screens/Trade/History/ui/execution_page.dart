import 'package:century_cqg/Screens/Trade/Execution/model/execution_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:century_cqg/Helper/nerve_base.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';
import 'package:century_cqg/Screens/Trade/History/service/execution_service.dart';

class ExecutionPage extends StatelessWidget {
  const ExecutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = context.watch<ExecutionService>();
    final isDarkMode = NerveBase().isDarkMode;
    final titleColor = isDarkMode ? Colors.white : const Color(0xFF444444);
    final mutedColor =
        isDarkMode ? const Color(0xFF8F9793) : const Color(0xFF7A817D);
    final dividerColor =
        isDarkMode ? const Color(0xFF2A302D) : const Color(0xFFE8ECEA);
    final positiveColor = const Color(0xFF00A879);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Row(
            children: [
              Text(
                'Execution',
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
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            itemCount: service.executions.length,
            separatorBuilder:
                (_, __) => Container(height: 1, color: dividerColor),
            itemBuilder: (context, index) {
              final item = service.executions[index];
              final showDate =
                  index == 0 ||
                  item.dateLabel != service.executions[index - 1].dateLabel;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showDate) ...[
                    if (index != 0) const SizedBox(height: 16),
                    Text(
                      item.dateLabel,
                      style: NerveStyles.tradeDetailsSectionTitleStyle(
                        titleColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  _executionRow(item, titleColor, mutedColor, positiveColor),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _executionRow(
    ExecutionItem item,
    Color titleColor,
    Color mutedColor,
    Color positiveColor,
  ) {
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
                style: NerveStyles.tradePositionSymbolStyle(titleColor),
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
                child: _metric('B/S', item.side, mutedColor, positiveColor),
              ),
              Expanded(
                child: _metric('Units', item.units, mutedColor, titleColor),
              ),
              Expanded(
                child: _metric('Amount', item.amount, mutedColor, titleColor),
              ),
              Expanded(
                child: _metric(
                  'Profit',
                  item.profit,
                  mutedColor,
                  positiveColor,
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
        const SizedBox(height: 5),
        Text(
          value,
          style: NerveStyles.tradeDetailsOrderBuyValueStyle(valueColor),
        ),
      ],
    );
  }
}
