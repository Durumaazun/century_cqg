import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:century_cqg/Helper/nerve_base.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';
import 'package:century_cqg/Screens/Trade/History/service/history_service.dart';
import 'package:century_cqg/Screens/Trade/History/ui/execution_page.dart';
import 'package:century_cqg/Screens/Trade/History/ui/history_page.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final historyService = context.watch<HistoryService>();
    final isDarkMode = NerveBase().isDarkMode;
    final background = isDarkMode ? const Color(0xFF0D110F) : Colors.white;
    final textColor = isDarkMode ? Colors.white : const Color(0xFF444444);
    final mutedColor =
        isDarkMode ? const Color(0xFF8F9793) : const Color(0xFF7A817D);
    final selectedColor = const Color(0xFFF2C400);

    return Container(
      color: background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Container(
              height: 28,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD9DDE2)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  _tab(
                    context,
                    'Execution',
                    0,
                    historyService.selectedTabIndex,
                    textColor,
                    selectedColor,
                  ),
                  _tab(
                    context,
                    'History',
                    1,
                    historyService.selectedTabIndex,
                    textColor,
                    selectedColor,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child:
                historyService.selectedTabIndex == 0
                    ? const ExecutionPage()
                    : HistoryList(mutedColor: mutedColor, textColor: textColor),
          ),
        ],
      ),
    );
  }

  Widget _tab(
    BuildContext context,
    String label,
    int index,
    int selectedIndex,
    Color textColor,
    Color selectedColor,
  ) {
    final selected = selectedIndex == index;
    final isExecutionTab = index == 0;
    return Expanded(
      child: GestureDetector(
        onTap: () => context.read<HistoryService>().setSelectedTabIndex(index),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? selectedColor : Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: isExecutionTab ? const Radius.circular(16) : Radius.zero,
              bottomLeft:
                  isExecutionTab ? const Radius.circular(16) : Radius.zero,
              topRight:
                  isExecutionTab ? Radius.zero : const Radius.circular(16),
              bottomRight:
                  isExecutionTab ? Radius.zero : const Radius.circular(16),
            ),
          ),
          child: Text(label, style: NerveStyles.filterChipTextStyle(textColor)),
        ),
      ),
    );
  }
}
