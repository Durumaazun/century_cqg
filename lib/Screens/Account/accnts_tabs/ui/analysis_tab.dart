import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';
import 'package:century_cqg/Helper/nerve_colors.dart';
import 'package:century_cqg/Helper/nerve_base.dart';

class AnalysisTab extends StatelessWidget {
  const AnalysisTab({super.key});

  Future<void> _showPerformanceFilterBottomSheet(
    BuildContext context,
    bool isDarkMode,
  ) async {
    final marketImpactOptions = [
      'All Trades',
      'Winning Trades',
      'Loosing Trades',
    ];
    final timeOptions = [
      'Yesterday',
      'Last Week',
      'Last Month',
      'Last Quarter',
      'Last Year',
      'Custom',
    ];

    int selectedMarketImpact = 0;
    int selectedTime = 5;
    const int customTimeIndex = 5;
    final customRangeController = TextEditingController();
    final customRangeFocusNode = FocusNode();
    final customFieldKey = GlobalKey();

    try {
      await showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (sheetContext) {
          final panelColor =
              isDarkMode ? const Color(0xFF0D110F) : Colors.white;
          final titleColor =
              isDarkMode ? Colors.white : const Color(0xFF454A54);
          final subtitleColor =
              isDarkMode ? const Color(0xFF9AA3B2) : const Color(0xFF6D726F);
          final chipBackground =
              isDarkMode ? const Color(0xFF1D2321) : const Color(0xFFF5F6F8);

          return StatefulBuilder(
            builder: (stateContext, setModalState) {
              return SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                      decoration: BoxDecoration(
                        color: panelColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                width: 40,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF5D636F),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'Filters',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: titleColor,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'Market Impact',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: subtitleColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: List.generate(
                                marketImpactOptions.length,
                                (index) {
                                  final isSelected =
                                      selectedMarketImpact == index;
                                  return _filterChip(
                                    label: marketImpactOptions[index],
                                    isSelected: isSelected,
                                    isDarkMode: isDarkMode,
                                    chipBackground: chipBackground,
                                    onTap: () {
                                      setModalState(() {
                                        selectedMarketImpact = index;
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              'Time',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: subtitleColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: List.generate(timeOptions.length, (
                                index,
                              ) {
                                final isSelected = selectedTime == index;
                                return _filterChip(
                                  label: timeOptions[index],
                                  isSelected: isSelected,
                                  isDarkMode: isDarkMode,
                                  chipBackground: chipBackground,
                                  onTap: () {
                                    setModalState(() {
                                      selectedTime = index;
                                    });

                                    if (index == customTimeIndex) {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                            customRangeFocusNode.requestFocus();
                                            final fieldContext =
                                                customFieldKey.currentContext;
                                            if (fieldContext != null) {
                                              Scrollable.ensureVisible(
                                                fieldContext,
                                                duration: const Duration(
                                                  milliseconds: 180,
                                                ),
                                                curve: Curves.easeOut,
                                                alignment: 0.2,
                                              );
                                            }
                                          });
                                    }
                                  },
                                );
                              }),
                            ),
                            if (selectedTime == customTimeIndex) ...[
                              const SizedBox(height: 12),
                              Container(
                                key: customFieldKey,
                                child: TextField(
                                  controller: customRangeController,
                                  focusNode: customRangeFocusNode,
                                  autofocus: true,
                                  textInputAction: TextInputAction.done,
                                  scrollPadding: const EdgeInsets.only(
                                    bottom: 120,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Enter custom range',
                                    filled: true,
                                    fillColor: chipBackground,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 12,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: titleColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    } finally {
      customRangeFocusNode.dispose();
      customRangeController.dispose();
    }
  }

  Widget _filterChip({
    required String label,
    required bool isSelected,
    required bool isDarkMode,
    required Color chipBackground,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFC600) : chipBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color:
                isSelected
                    ? const Color(0xFF2A2A2A)
                    : (isDarkMode
                        ? const Color(0xFFD9DDE4)
                        : const Color(0xFF454A54)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = NerveBase().isDarkMode;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF0D110F) : Colors.white,
        border: Border.all(color: NerveColors.containerBorderColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Performance Analysis',
            style: NerveStyles.black_medium_14_400(isDarkMode),
          ),
          const SizedBox(height: 16),
          _performanceChartView(isDarkMode),
          const SizedBox(height: 20),
          _performanceStatsView(isDarkMode, context),
          const SizedBox(height: 20),
          _tradesCalendarView(isDarkMode),
        ],
      ),
    );
  }

  Widget _tradesCalendarView(bool isDarkMode) {
    final weekDays = const ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    final days = <_TradeCalendarDayData>[
      _TradeCalendarDayData(day: '30', status: _TradeDayStatus.outsideMonth),
      _TradeCalendarDayData(day: '31', status: _TradeDayStatus.outsideMonth),
      _TradeCalendarDayData(day: '1', status: _TradeDayStatus.loss),
      _TradeCalendarDayData(day: '2', status: _TradeDayStatus.win),
      _TradeCalendarDayData(day: '3', status: _TradeDayStatus.none),
      _TradeCalendarDayData(day: '4', status: _TradeDayStatus.win),
      _TradeCalendarDayData(day: '5', status: _TradeDayStatus.none),
      _TradeCalendarDayData(day: '6', status: _TradeDayStatus.win),
      _TradeCalendarDayData(day: '7', status: _TradeDayStatus.none),
      _TradeCalendarDayData(day: '8', status: _TradeDayStatus.loss),
      _TradeCalendarDayData(day: '9', status: _TradeDayStatus.win),
      _TradeCalendarDayData(day: '10', status: _TradeDayStatus.loss),
      _TradeCalendarDayData(day: '11', status: _TradeDayStatus.none),
      _TradeCalendarDayData(day: '12', status: _TradeDayStatus.loss),
      _TradeCalendarDayData(day: '13', status: _TradeDayStatus.none),
      _TradeCalendarDayData(day: '14', status: _TradeDayStatus.loss),
      _TradeCalendarDayData(day: '15', status: _TradeDayStatus.win),
      _TradeCalendarDayData(day: '16', status: _TradeDayStatus.none),
      _TradeCalendarDayData(day: '17', status: _TradeDayStatus.win),
      _TradeCalendarDayData(day: '18', status: _TradeDayStatus.win),
      _TradeCalendarDayData(day: '19', status: _TradeDayStatus.win),
      _TradeCalendarDayData(day: '20', status: _TradeDayStatus.none),
      _TradeCalendarDayData(day: '21', status: _TradeDayStatus.win),
      _TradeCalendarDayData(day: '22', status: _TradeDayStatus.none),
      _TradeCalendarDayData(day: '23', status: _TradeDayStatus.loss),
      _TradeCalendarDayData(day: '24', status: _TradeDayStatus.win),
      _TradeCalendarDayData(day: '25', status: _TradeDayStatus.loss),
      _TradeCalendarDayData(day: '26', status: _TradeDayStatus.win),
      _TradeCalendarDayData(day: '27', status: _TradeDayStatus.win),
      _TradeCalendarDayData(day: '28', status: _TradeDayStatus.loss),
      _TradeCalendarDayData(day: '29', status: _TradeDayStatus.win),
      _TradeCalendarDayData(day: '30', status: _TradeDayStatus.win),
      _TradeCalendarDayData(day: '1', status: _TradeDayStatus.outsideMonth),
      _TradeCalendarDayData(day: '2', status: _TradeDayStatus.outsideMonth),
      _TradeCalendarDayData(day: '3', status: _TradeDayStatus.outsideMonth),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF0D110F) : Colors.white,
        border: Border(
          top: BorderSide(
            color:
                isDarkMode ? const Color(0xFF202220) : const Color(0xFFF2F2F2),
            width: 1,
          ),
          bottom: BorderSide(
            color:
                isDarkMode ? const Color(0xFF202220) : const Color(0xFFF2F2F2),
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trades Calendar',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 1,
                  letterSpacing: 0,
                  color: isDarkMode ? Colors.white : const Color(0xFF454A54),
                ),
              ),
              Row(
                children: [
                  _calendarNavButton(
                    icon: Icons.chevron_left_rounded,
                    isDarkMode: isDarkMode,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Jun 2026',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1,
                      letterSpacing: 0,
                      color:
                          isDarkMode ? Colors.white : const Color(0xFF454A54),
                    ),
                  ),
                  const SizedBox(width: 10),
                  _calendarNavButton(
                    icon: Icons.chevron_right_rounded,
                    isDarkMode: isDarkMode,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children:
                weekDays
                    .map(
                      (day) => Expanded(
                        child: Center(
                          child: Text(
                            day,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 1,
                              letterSpacing: 0,
                              color:
                                  isDarkMode
                                      ? const Color(0xFF9AA3B2)
                                      : const Color(0xFF8A93A3),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: days.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final day = days[index];
              return _calendarDayCell(day: day, isDarkMode: isDarkMode);
            },
          ),
          const SizedBox(height: 14),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 10,
            children: const [
              _CalendarLegendDot(
                color: Color(0xFF20A16F),
                label: 'Winning day',
              ),
              _CalendarLegendDot(color: Color(0xFFF6465D), label: 'Losing day'),
              _CalendarLegendDot(color: Color(0xFFE8EAF0), label: 'No trades'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _calendarNavButton({
    required IconData icon,
    required bool isDarkMode,
  }) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? const Color(0xFF303630) : const Color(0xFFE5EAF0),
          width: 1,
        ),
      ),
      child: Icon(
        icon,
        size: 18,
        color: isDarkMode ? const Color(0xFF9AA3B2) : const Color(0xFF8A93A3),
      ),
    );
  }

  Widget _calendarDayCell({
    required _TradeCalendarDayData day,
    required bool isDarkMode,
  }) {
    final isWin = day.status == _TradeDayStatus.win;
    final isLoss = day.status == _TradeDayStatus.loss;
    final isNoTrade = day.status == _TradeDayStatus.none;
    final isOutside = day.status == _TradeDayStatus.outsideMonth;

    final backgroundColor =
        isWin
            ? const Color(0xFF20A16F)
            : isLoss
            ? const Color(0xFFF6465D)
            : (isDarkMode ? const Color(0xFF252A33) : const Color(0xFFE8EAF0));

    final dayTextColor =
        isWin || isLoss
            ? Colors.white
            : (isOutside
                ? const Color(0xFFC9CFDA)
                : (isDarkMode
                    ? const Color(0xFF9AA3B2)
                    : const Color(0xFF7D8798)));

    return Container(
      decoration: BoxDecoration(
        color: isOutside ? Colors.transparent : backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border:
            isOutside
                ? Border.all(
                  color:
                      isDarkMode
                          ? const Color(0xFF303630)
                          : const Color(0xFFDDE3EC),
                  width: 1,
                )
                : null,
      ),
      alignment: Alignment.center,
      child: Text(
        day.day,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1,
          letterSpacing: 0,
          color: isNoTrade ? const Color(0xFF7D8798) : dayTextColor,
        ),
      ),
    );
  }

  Widget _performanceStatsView(bool isDarkMode, BuildContext context) {
    final summaryCards = <_SummaryCardData>[
      _SummaryCardData(
        label: 'WINS',
        value: '14',
        valueColor: const Color(0xFF0AA66A),
        lightBackground: const Color(0xFFEAF8F2),
        darkBackground: const Color(0xFF112B22),
      ),
      _SummaryCardData(
        label: 'LOSSES',
        value: '5',
        valueColor: const Color(0xFFFF4B55),
        lightBackground: const Color(0xFFFDEEF1),
        darkBackground: const Color(0xFF321A1E),
      ),
      _SummaryCardData(
        label: 'NET P&L',
        value: '+6,200',
        valueColor: const Color(0xFFC89000),
        lightBackground: const Color(0xFFFFF6DE),
        darkBackground: const Color(0xFF332A12),
      ),
    ];

    final stats = <_StatData>[
      _StatData(
        label: 'Net Profit',
        value: '6,200.83',
        valueColor: const Color(0xFF0AA66A),
      ),
      _StatData(label: 'Profit Factor', value: '1.67'),
      _StatData(label: 'Max Balance Drawdown', value: '20.92%'),
      _StatData(
        label: 'Commission',
        value: '-13.74',
        valueColor: const Color(0xFFFF4B55),
      ),
      _StatData(label: 'Total Trades', value: '19'),
      _StatData(label: 'Average Trade', value: '326.36'),
      _StatData(
        label: 'Largest Winning Trade',
        value: '6,551.00',
        valueColor: const Color(0xFF0AA66A),
      ),
      _StatData(
        label: 'Winning Trades',
        value: '14',
        valueColor: const Color(0xFF0AA66A),
      ),
      _StatData(
        label: 'Losing Trades',
        value: '5',
        valueColor: const Color(0xFFFF4B55),
      ),
      _StatData(
        label: 'Largest Losing Trade',
        value: '-3,576.00',
        valueColor: const Color(0xFFFF4B55),
      ),
      _StatData(label: 'Total Pips Won', value: '893.18'),
      _StatData(label: 'Avg. Pips Won per Trade', value: '47.01'),
      _StatData(label: 'Avg. Trade Duration', value: '2h 6m 45s'),
      _StatData(label: 'USD Volume Traded', value: '16m'),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Performance Stats',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color:
                          isDarkMode ? Colors.white : const Color(0xFF454A54),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '23/09/25 - 03/01/26',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color:
                          isDarkMode
                              ? const Color(0xFF9AA3B2)
                              : const Color(0xFF8D98A7),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  _showPerformanceFilterBottomSheet(context, isDarkMode);
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color:
                          isDarkMode
                              ? const Color(0xFF303630)
                              : const Color(0xFFE5EAF0),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    Icons.tune_rounded,
                    size: 18,
                    color:
                        isDarkMode
                            ? const Color(0xFF9AA3B2)
                            : const Color(0xFF8D98A7),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children:
                summaryCards.map((item) {
                  final index = summaryCards.indexOf(item);
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: index == summaryCards.length - 1 ? 0 : 10,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              isDarkMode
                                  ? item.darkBackground
                                  : item.lightBackground,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item.label,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: item.valueColor,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              item.value,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: item.valueColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: stats.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.65,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              final item = stats[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color:
                          isDarkMode
                              ? const Color(0xFF9AA3B2)
                              : const Color(0xFF7E828B),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.value,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color:
                          item.valueColor ??
                          (isDarkMode ? Colors.white : const Color(0xFF3E4148)),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _performanceChartView(bool isDarkMode) {
    final chartData = <_PerformancePoint>[
      _PerformancePoint(day: 'Mon', winningTrades: 5, losingTrades: 5),
      _PerformancePoint(day: 'Tue', winningTrades: 7, losingTrades: 7),
      _PerformancePoint(day: 'Wed', winningTrades: 16, losingTrades: 16),
      _PerformancePoint(day: 'Thu', winningTrades: 7, losingTrades: 7),
      _PerformancePoint(day: 'Fri', winningTrades: 5, losingTrades: 5),
    ];

    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 390,
        height: 298,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF0D110F) : Colors.white,
          border: Border(
            top: BorderSide(
              color:
                  isDarkMode
                      ? const Color(0xFF202220)
                      : const Color(0xFFF2F2F2),
              width: 1,
            ),
            bottom: BorderSide(
              color:
                  isDarkMode
                      ? const Color(0xFF202220)
                      : const Color(0xFFF2F2F2),
              width: 1,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Performance Chart',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? Colors.white : const Color(0xFF454A54),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isDarkMode
                            ? const Color(0xFF141A16)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color:
                          isDarkMode
                              ? const Color(0xFF303630)
                              : const Color(0xFFE4E7EC),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Daily',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color:
                              isDarkMode
                                  ? Colors.white
                                  : const Color(0xFF454A54),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 18,
                        color:
                            isDarkMode ? Colors.white : const Color(0xFF6A7280),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Expanded(
              child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                margin: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                enableSideBySideSeriesPlacement: true,
                legend: Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                  alignment: ChartAlignment.center,
                  itemPadding: 20,
                  iconWidth: 10,
                  iconHeight: 10,
                  textStyle: TextStyle(
                    fontSize: 14,
                    color:
                        isDarkMode
                            ? const Color(0xFFB7C0CF)
                            : const Color(0xFF7F8CA1),
                  ),
                ),
                primaryXAxis: CategoryAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  majorTickLines: const MajorTickLines(size: 0),
                  axisLine: const AxisLine(width: 1, color: Color(0xFFEEF1F5)),
                  labelStyle: TextStyle(
                    fontSize: 13,
                    color:
                        isDarkMode
                            ? const Color(0xFF9AA3B2)
                            : const Color(0xFF8A93A3),
                  ),
                ),
                // nTangle - Keep winning trades on the primary axis to preserve the left-side scale.
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  maximum: 18,
                  interval: 3,
                  axisLine: const AxisLine(width: 0),
                  majorTickLines: const MajorTickLines(size: 0),
                  majorGridLines: MajorGridLines(
                    width: 1,
                    color:
                        isDarkMode
                            ? const Color(0xFF243029)
                            : const Color(0xFFEFF2F6),
                  ),
                  labelStyle: TextStyle(
                    fontSize: 11,
                    color:
                        isDarkMode
                            ? const Color(0xFF9AA3B2)
                            : const Color(0xFF8A93A3),
                  ),
                ),
                axes: <ChartAxis>[
                  // nTangle - Use a second Y-axis for losing trades to satisfy a true multi-axis chart setup.
                  NumericAxis(
                    name: 'losingAxis',
                    minimum: 0,
                    maximum: 18,
                    interval: 3,
                    opposedPosition: true,
                    isVisible: false,
                  ),
                ],
                series: <CartesianSeries<_PerformancePoint, String>>[
                  ColumnSeries<_PerformancePoint, String>(
                    name: 'Winning Trades',
                    dataSource: chartData,
                    xValueMapper: (_PerformancePoint point, _) => point.day,
                    yValueMapper:
                        (_PerformancePoint point, _) => point.winningTrades,
                    color: const Color(0xFF2EBD85),
                    width: 0.32,
                    spacing: 0.14,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                  ),
                  ColumnSeries<_PerformancePoint, String>(
                    name: 'Losing Trades',
                    dataSource: chartData,
                    xValueMapper: (_PerformancePoint point, _) => point.day,
                    yValueMapper:
                        (_PerformancePoint point, _) => point.losingTrades,
                    yAxisName: 'losingAxis',
                    color: const Color(0xFFF6465D),
                    width: 0.32,
                    spacing: 0.14,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PerformancePoint {
  final String day;
  final double winningTrades;
  final double losingTrades;

  const _PerformancePoint({
    required this.day,
    required this.winningTrades,
    required this.losingTrades,
  });
}

class _SummaryCardData {
  final String label;
  final String value;
  final Color valueColor;
  final Color lightBackground;
  final Color darkBackground;

  const _SummaryCardData({
    required this.label,
    required this.value,
    required this.valueColor,
    required this.lightBackground,
    required this.darkBackground,
  });
}

class _StatData {
  final String label;
  final String value;
  final Color? valueColor;

  const _StatData({required this.label, required this.value, this.valueColor});
}

enum _TradeDayStatus { win, loss, none, outsideMonth }

class _TradeCalendarDayData {
  final String day;
  final _TradeDayStatus status;

  const _TradeCalendarDayData({required this.day, required this.status});
}

class _CalendarLegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const _CalendarLegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF7D8798),
          ),
        ),
      ],
    );
  }
}
