import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';
import 'package:century_cqg/Helper/nerve_colors.dart';
import 'package:century_cqg/Screens/Account/service/account_service.dart';
import 'package:century_cqg/Helper/nerve_base.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = NerveBase().isDarkMode;

    return Consumer<AccountService>(
      builder: (context, proValue, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              portfolioView(isDarkMode, proValue),
              const SizedBox(height: 18),
              topPositionView(isDarkMode, proValue),
              const SizedBox(height: 8),
              allocationView(isDarkMode, proValue),
            ],
            // ),
            //],
          ),
        );
      },
    );
  }

  Widget portfolioView(isDarkMode, proValue) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      color: isDarkMode ? const Color(0xFF0D110F) : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'PORTFOLIO VALUE',
              style: NerveStyles.grey_medium_12(isDarkMode),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '\$67,504.34',
                  style: NerveStyles.black_bold_24(isDarkMode),
                ),
                Wrap(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: NerveColors.softGreenBackgroundColor,
                        borderRadius: BorderRadius.circular(22),
                      ),

                      child: Wrap(
                        children: [
                          const Icon(
                            Icons.trending_up,
                            color: Colors.green,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            '4.45%',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    Text(
                      '+\$257.07',
                      style: NerveStyles.grey_medium_13(isDarkMode),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Container(
            height: 120,
            decoration: BoxDecoration(
              //  color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              // border: Border.all(
              //   color: NerveColors.containerBorderColor,
              //   width: 1,
              // ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: SfCartesianChart(
                margin: EdgeInsets.zero,
                plotAreaBorderWidth: 0,
                primaryXAxis: NumericAxis(
                  isVisible: false,
                  majorGridLines: const MajorGridLines(width: 0),
                  axisLine: const AxisLine(width: 0),
                ),
                primaryYAxis: NumericAxis(
                  isVisible: false,
                  majorGridLines: const MajorGridLines(width: 0),
                  axisLine: const AxisLine(width: 0),
                ),
                series: <CartesianSeries<_PortfolioPoint, num>>[
                  AreaSeries<_PortfolioPoint, num>(
                    dataSource: const [
                      _PortfolioPoint(0, 38),
                      _PortfolioPoint(1, 45),
                      _PortfolioPoint(2, 43),
                      _PortfolioPoint(3, 49),
                      _PortfolioPoint(4, 47),
                      _PortfolioPoint(5, 52),
                      _PortfolioPoint(6, 50),
                    ],
                    xValueMapper: (_PortfolioPoint p, _) => p.x,
                    yValueMapper: (_PortfolioPoint p, _) => p.y,
                    gradient:
                        isDarkMode
                            ? const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(255, 69, 117, 70),
                                //   Color.fromARGB(170, 18, 213, 125),
                                Color.fromARGB(68, 64, 129, 88),
                                Color(0x0022C55E),
                              ],
                            )
                            : const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(102, 139, 205, 163),
                                Color.fromARGB(97, 197, 244, 213),
                                Color.fromARGB(0, 235, 239, 237),
                              ],
                            ),
                    borderWidth: 0,
                  ),
                  LineSeries<_PortfolioPoint, num>(
                    dataSource: const [
                      _PortfolioPoint(0, 39),
                      _PortfolioPoint(1, 45),
                      _PortfolioPoint(2, 43),
                      _PortfolioPoint(3, 49),
                      _PortfolioPoint(4, 47),
                      _PortfolioPoint(5, 52),
                      _PortfolioPoint(6, 50),
                    ],
                    xValueMapper: (_PortfolioPoint p, _) => p.x,
                    yValueMapper: (_PortfolioPoint p, _) => p.y,
                    color: const Color(0xFF2EBD85),
                    width: 2,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  ['1D', '1W', '1M', '3M', '1Y'].map((period) {
                    final isSelected = period == '1D';
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? NerveColors.selectedNavColor
                                  : (isDarkMode
                                      ? const Color(0xFF0D110F)
                                      : Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          period,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color:
                                isSelected
                                    ? Colors.black
                                    : (isDarkMode
                                        ? Colors.grey[400]
                                        : Colors.grey[600]),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
          const SizedBox(height: 26),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),

            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 10,
            childAspectRatio: 1.6,
            children: [
              _MetricCard(
                isDarkMode: isDarkMode,
                label: 'Account Value',
                value: '\$67,504.34',
              ),
              _MetricCard(
                isDarkMode: isDarkMode,
                label: 'Invested Value',
                value: '\$63,504',
              ),
              _MetricCard(
                isDarkMode: isDarkMode,
                label: 'Available',
                value: '570.79',
              ),
              _MetricCard(
                isDarkMode: isDarkMode,
                label: 'Total PnL',
                value: '+557.07',
                valueColor: Colors.green,
              ),
              _MetricCard(
                isDarkMode: isDarkMode,
                label: 'Day PnL',
                value: '-57.56',
                valueColor: Colors.red,
              ),
              _MetricCard(
                isDarkMode: isDarkMode,
                label: 'Cash',
                value: '257.07',
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                marginUtilisation(isDarkMode),
                const SizedBox(height: 16),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.6,
                  children: [
                    _MetricCard(
                      isDarkMode: isDarkMode,
                      label: 'Total Margin',
                      value: '257.07',
                    ),
                    _MetricCard(
                      isDarkMode: isDarkMode,
                      label: 'Margin Call',
                      value: '257.07',
                    ),
                    _MetricCard(
                      isDarkMode: isDarkMode,
                      label: 'Std. Close Out',
                      value: '257.07',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget marginUtilisation(bool isDarkMode) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'MARGIN UTILISATION',
                style: NerveStyles.grey_medium_13(isDarkMode),
              ),
              const Text(
                '72%',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFF39C12),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: 0.72,
            minHeight: 8,
            backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFF39C12)),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('0%', style: NerveStyles.grey_medium_13(isDarkMode)),
            Text('100%', style: NerveStyles.grey_medium_13(isDarkMode)),
          ],
        ),
      ],
    );
  }

  Widget topPositionView(bool isDarkMode, AccountService proValue) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color:
            isDarkMode
                ? const Color(0xFF0D110F)
                : NerveColors.scaffoldBackgroundColor(isDarkMode),
        border: Border(
          top: BorderSide(
            color:
                isDarkMode
                    ? const Color(0xFF202220)
                    : NerveColors.containerBorderColor,
            width: 1,
          ),
          bottom: BorderSide(
            color:
                isDarkMode
                    ? const Color(0xFF202220)
                    : NerveColors.containerBorderColor,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Positions',
                  style: NerveStyles.black_medium_14_400(isDarkMode),
                ),
                Text('Show All', style: NerveStyles.blue_bold_12(isDarkMode)),
              ],
            ),
            const SizedBox(height: 6),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: proValue.positions.length,
              itemBuilder: (context, index) {
                final item = proValue.positions[index];
                return Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xFF0D110F) : Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color:
                            isDarkMode
                                ? const Color(0xFF202220)
                                : NerveColors.containerBorderColor,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            children: [
                              Text(
                                item.ticker,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.teal.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  item.type,
                                  style: const TextStyle(
                                    color: Colors.teal,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color:
                                  isDarkMode
                                      ? const Color(0xFF0D110F)
                                      : const Color(0xFFEAF7F0),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: SvgPicture.asset(
                              'lib/Resources/Images/line_chart.svg',
                              width: 150,
                              height: 22,
                            ),
                          ),
                          Text(
                            '+ ${item.profit.toStringAsFixed(2)}',
                            style: TextStyle(
                              color:
                                  isDarkMode
                                      ? Colors.teal.shade200
                                      : Colors.teal,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Qty: ${item.qty}',
                            style: TextStyle(
                              color:
                                  isDarkMode ? Colors.grey[200] : Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            'Avg: ${item.avgPrice.toStringAsFixed(2).padLeft(8, '0')}',
                            style: TextStyle(
                              color:
                                  isDarkMode ? Colors.grey[200] : Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            'LTP: ${item.ltp.toStringAsFixed(2)}',
                            style: TextStyle(
                              color:
                                  isDarkMode ? Colors.grey[200] : Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget allocationView(bool isDarkMode, AccountService proValue) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color:
            isDarkMode
                ? const Color(0xFF0D110F)
                : NerveColors.scaffoldBackgroundColor(isDarkMode),
        border: Border(
          top: BorderSide(
            color:
                isDarkMode
                    ? const Color(0xFF202220)
                    : NerveColors.containerBorderColor,
            width: 1,
          ),
          bottom: BorderSide(
            color:
                isDarkMode
                    ? const Color(0xFF202220)
                    : NerveColors.containerBorderColor,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Allocation',
                  style: NerveStyles.black_medium_14_500(isDarkMode),
                ),
                Text('Show All', style: NerveStyles.blue_bold_12(isDarkMode)),
              ],
            ),
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: SizedBox(
                height: 7,
                child: Row(
                  children:
                      proValue.allocations
                          .map(
                            (item) => Expanded(
                              flex: item.allocationPercent,
                              child: Container(color: item.color),
                            ),
                          )
                          .toList(),
                ),
              ),
            ),
            const SizedBox(height: 14),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: proValue.allocations.length,
              separatorBuilder:
                  (context, index) => Divider(
                    color: NerveColors.containerBorderColor,
                    height: 22,
                  ),
              itemBuilder: (context, index) {
                final item = proValue.allocations[index];
                return _allocationRow(
                  isDarkMode: isDarkMode,
                  symbol: item.symbol,
                  name: item.name,
                  changePercent: item.changePercent,
                  allocationPercent: item.allocationPercent,
                  amountInMillions: item.amountInMillions,
                  color: item.color,
                );
              },
            ),
            Divider(color: NerveColors.containerBorderColor, height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('TOTAL', style: NerveStyles.grey_medium_14(isDarkMode)),
                Text(
                  proValue.allocationTotalValue,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : const Color(0xFF3E3F43),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _allocationRow({
    required bool isDarkMode,
    required String symbol,
    required String name,
    required double changePercent,
    required int allocationPercent,
    required double amountInMillions,
    required Color color,
  }) {
    final bool isPositive = changePercent >= 0;
    final Color changeColor =
        isPositive
            ? (isDarkMode ? const Color(0xFF31BD77) : const Color(0xFF20A567))
            : (isDarkMode ? const Color(0xFFFF6C7F) : const Color(0xFFF24861));

    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: symbol,
                      style: TextStyle(
                        color:
                            isDarkMode ? Colors.white : const Color(0xFF3D3F44),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: name,
                      style: TextStyle(
                        color:
                            isDarkMode
                                ? const Color(0xFFA9ADB7)
                                : const Color(0xFF98A0AE),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${isPositive ? '+' : ''}${changePercent.toStringAsFixed(2)}%',
              style: TextStyle(
                color: changeColor,
                fontSize: 14,

                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '$allocationPercent%',
              style: TextStyle(
                color:
                    isDarkMode
                        ? const Color(0xFFA9ADB7)
                        : const Color(0xFF98A0AE),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color:
                      isDarkMode
                          ? const Color(0xFF343742)
                          : const Color(0xFFE2E5EA),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: allocationPercent / 100,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Text(
              '\$${amountInMillions.toStringAsFixed(1)}M',
              style: TextStyle(
                color:
                    isDarkMode
                        ? const Color(0xFF969CA7)
                        : const Color(0xFF98A0AE),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final bool isDarkMode;
  final String label;
  final String value;
  final Color? valueColor;

  const _MetricCard({
    required this.isDarkMode,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF0D110F) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: NerveColors.containerBorderColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: NerveStyles.black_regular_12(isDarkMode),
            maxLines: 2,
            // overflow: TextOverflow.ellipsis,
          ),
          Text(
            value,
            style: NerveStyles.black_bold_14(isDarkMode).copyWith(
              color: valueColor ?? (isDarkMode ? Colors.white : Colors.black87),
            ),
            // maxLines: 1,
            // overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _PortfolioPoint {
  final num x;
  final num y;

  const _PortfolioPoint(this.x, this.y);
}
