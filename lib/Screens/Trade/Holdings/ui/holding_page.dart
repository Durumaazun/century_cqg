import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:century_cqg/Helper/nerve_base.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';
import 'package:century_cqg/Screens/Trade/Holdings/service/holding_service.dart';

class HoldingPage extends StatelessWidget {
  const HoldingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = context.watch<HoldingService>();
    final isDarkMode = NerveBase().isDarkMode;
    final bgColor = isDarkMode ? const Color(0xFF0D110F) : Colors.white;
    final titleColor = isDarkMode ? Colors.white : const Color(0xFF2A2A2A);
    final mutedColor =
        isDarkMode ? const Color(0xFF8F9793) : const Color(0xFF7A817D);
    final lineColor =
        isDarkMode ? const Color(0xFF2A302D) : const Color(0xFFE8ECEA);
    final positiveColor = const Color(0xFF00C389);

    return Container(
      color: bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Holdings',
                  style: NerveStyles.tradeDetailsSectionTitleStyle(titleColor),
                ),
                Wrap(
                  children: [
                    InkWell(
                      onTap: () => _showSortingBottomSheet(context, isDarkMode),
                      child: Icon(Icons.sort, size: 18, color: mutedColor),
                    ),
                    SizedBox(width: 16),
                    InkWell(
                      onTap: () => _showFilterBottomSheet(context, isDarkMode),
                      child: Icon(
                        Icons.filter_alt_outlined,
                        size: 18,
                        color: mutedColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: service.holdings.length,
              separatorBuilder:
                  (_, __) => Container(height: 1, color: lineColor),
              itemBuilder: (context, index) {
                final item = service.holdings[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

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
                            style: NerveStyles.tradePositionSymbolStyle(
                              titleColor,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            item.orderId,
                            style: NerveStyles.tradeDetailsOrderDateStyle(
                              mutedColor,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: const Color(0xFFB9C2CE),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item.orderTime,
                            style: NerveStyles.tradeDetailsOrderDateStyle(
                              mutedColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _metric('B/S', item.side, mutedColor, positiveColor),
                          _metric('Units', item.units, mutedColor, titleColor),
                          _metric(
                            'Amount',
                            item.amount,
                            mutedColor,
                            titleColor,
                          ),
                          _metric(
                            'Profit',
                            item.profit,
                            mutedColor,
                            positiveColor,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ],
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
    Color valueColor, {
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    TextAlign textAlign = TextAlign.start,
  }) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          label,
          textAlign: textAlign,
          style: NerveStyles.tradePositionMetricLabelStyle(labelColor),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          textAlign: textAlign,
          style: NerveStyles.tradeDetailsOrderBuyValueStyle(valueColor),
        ),
      ],
    );
  }

  void _showSortingBottomSheet(BuildContext context, bool isDarkMode) {
    final sheetColor = isDarkMode ? const Color(0xFF1E2120) : Colors.white;
    final titleColor = isDarkMode ? Colors.white : const Color(0xFF4D4F51);
    final optionColor =
        isDarkMode ? const Color(0xFFD0D5D2) : const Color(0xFF55585B);
    final dividerColor =
        isDarkMode ? const Color(0xFF303633) : const Color(0xFFE8E8E8);

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.fromLTRB(13, 8, 13, 18),
            decoration: BoxDecoration(
              color: sheetColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 32,
                    height: 4,
                    decoration: BoxDecoration(
                      color:
                          isDarkMode
                              ? const Color(0xFF69706C)
                              : const Color(0xFF55585B),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                Text(
                  'Sorting Options',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: titleColor,
                  ),
                ),
                _sortingOption(
                  sheetContext,
                  'By Product Name',
                  optionColor,
                  dividerColor,
                ),
                _sortingOption(
                  sheetContext,
                  'By Product Category',
                  optionColor,
                  dividerColor,
                ),
                _sortingOption(
                  sheetContext,
                  'By Date',
                  optionColor,
                  dividerColor,
                ),
                _sortingOption(
                  sheetContext,
                  'By Profit',
                  optionColor,
                  dividerColor,
                  selected: true,
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _sortingOption(
    BuildContext context,
    String label,
    Color textColor,
    Color dividerColor, {
    bool selected = false,
  }) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: dividerColor)),
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  color: textColor,
                ),
              ),
            ),
            if (selected) ...[
              Icon(
                Icons.arrow_upward,
                size: 16,
                color: const Color(0xFF9B9FA3),
              ),
              Icon(
                Icons.arrow_downward,
                size: 16,
                color: const Color(0xFFFFC400),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context, bool isDarkMode) {
    final sheetColor = isDarkMode ? const Color(0xFF1E2120) : Colors.white;
    final titleColor = isDarkMode ? Colors.white : const Color(0xFF4D4F51);
    final labelColor =
        isDarkMode ? const Color(0xFF9AA19D) : const Color(0xFF858585);
    final chipColor =
        isDarkMode ? const Color(0xFF292F2C) : NerveStyles.filterChipBackground;
    final chipTextColor =
        isDarkMode ? const Color(0xFFD0D5D2) : const Color(0xFF55585B);
    const selectedColor = NerveStyles.filterChipSelectedBackground;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        var selectedTime = 'Today';
        var selectedSymbol = 'AAPL';
        var selectedType = 'Index';

        return StatefulBuilder(
          builder: (stateContext, setModalState) {
            return SafeArea(
              top: false,
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height * .78,
                ),
                padding: const EdgeInsets.fromLTRB(26, 8, 18, 22),
                decoration: BoxDecoration(
                  color: sheetColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 24,
                          height: 4,
                          decoration: BoxDecoration(
                            color:
                                isDarkMode
                                    ? const Color(0xFF69706C)
                                    : const Color(0xFF55585B),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      const SizedBox(height: 27),
                      Text(
                        'Filters',
                        style: NerveStyles.filterTitleStyle(titleColor),
                      ),
                      const SizedBox(height: 25),
                      _filterSectionLabel('TIME', labelColor),
                      const SizedBox(height: 11),
                      _filterChips(
                        stateContext,
                        [
                          'Today',
                          'Week',
                          'Month',
                          '6 Months',
                          'Year',
                          'Custom',
                        ],
                        selectedTime,
                        chipColor,
                        chipTextColor,
                        selectedColor,
                        (value) => setModalState(() => selectedTime = value),
                      ),
                      const SizedBox(height: 23),
                      _filterSectionLabel('SYMBOL NAME', labelColor),
                      const SizedBox(height: 11),
                      _filterChips(
                        stateContext,
                        [
                          'BTC',
                          'USD',
                          'LTC',
                          'AAPL',
                          'NIFTY',
                          'Gold',
                          'FTX',
                          'Custom',
                        ],
                        selectedSymbol,
                        chipColor,
                        chipTextColor,
                        selectedColor,
                        (value) => setModalState(() => selectedSymbol = value),
                      ),
                      const SizedBox(height: 23),
                      _filterSectionLabel('SYMBOL TYPE', labelColor),
                      const SizedBox(height: 11),
                      _filterChips(
                        stateContext,
                        [
                          'Index',
                          'Shares',
                          'Treasuries',
                          'Commodity',
                          'Crypto',
                          'Bonds',
                        ],
                        selectedType,
                        chipColor,
                        chipTextColor,
                        selectedColor,
                        (value) => setModalState(() => selectedType = value),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _filterSectionLabel(String label, Color color) {
    return Text(label, style: NerveStyles.filterSectionLabelStyle(color));
  }

  Widget _filterChips(
    BuildContext context,
    List<String> labels,
    String selected,
    Color chipColor,
    Color textColor,
    Color selectedColor,
    ValueChanged<String> onSelected,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const columns = 4;
        const spacing = 14.0;
        final chipWidth =
            (constraints.maxWidth - (spacing * (columns - 1))) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: 10,
          children:
              labels.map((label) {
                final isSelected = label == selected;
                return InkWell(
                  onTap: () => onSelected(label),
                  borderRadius: BorderRadius.circular(7),
                  child: Container(
                    width: chipWidth,
                    height: 27,
                    decoration:
                        isSelected
                            ? NerveStyles.filterChipDecoration(selected: true)
                            : BoxDecoration(
                              color: chipColor,
                              borderRadius: BorderRadius.circular(7),
                            ),
                    alignment: Alignment.center,
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      style: NerveStyles.filterChipTextStyle(
                        isSelected ? const Color(0xFF3A3A3A) : textColor,
                      ),
                    ),
                  ),
                );
              }).toList(),
        );
      },
    );
  }
}
