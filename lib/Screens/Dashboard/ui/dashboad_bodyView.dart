import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';
import 'package:century_cqg/Helper/nerve_colors.dart';
import 'package:century_cqg/Screens/Dashboard/service/dasboard_service.dart';
import 'package:century_cqg/Helper/nerve_base.dart';

class DashboardBodyView extends StatelessWidget {
  const DashboardBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardService>(
      builder: (context, proValue, _) {
        final isDarkMode = NerveBase().isDarkMode;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            accountSumView(isDarkMode),
            SizedBox(height: 8),

            watchedListView(isDarkMode, proValue),
            SizedBox(height: 8),

            topPositionView(isDarkMode, proValue),
            SizedBox(height: 8),

            trendingView(isDarkMode, proValue),
            SizedBox(height: 8),

            activityFeedView(isDarkMode),
            SizedBox(height: 8),
          ],
        );
      },
    );
  }

  Widget accountSumView(bool isDarkMode) {
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
      child: Card(
        elevation: 0,
        color: isDarkMode ? const Color(0xFF0D110F) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account Summary',
                style: NerveStyles.black_medium_14_400(isDarkMode),
              ),
              const SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: _buildMetricColumn(
                        title: 'Cash Balance',
                        value: '\$84,250.00',
                        isDarkMode: isDarkMode,
                        valueSize: 20,
                        valueWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildMetricItem(
                            'Buying Power',
                            '\$168,500.00',
                            isDarkMode: isDarkMode,
                            isBoldValue: true,
                          ),
                          const SizedBox(height: 6),
                          _buildMetricItem(
                            'Unrealized P&L',
                            '+\$1,842.00',
                            isDarkMode: isDarkMode,
                            valueColor:
                                isDarkMode
                                    ? Colors.green.shade300
                                    : Colors.green.shade600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildMetricItem(
                            'Margin Used',
                            '\$42,100.00',
                            isDarkMode: isDarkMode,
                          ),
                          const SizedBox(height: 6),
                          _buildMetricItem(
                            'Realized P&L',
                            '+\$3,215.00',
                            isDarkMode: isDarkMode,
                            valueColor:
                                isDarkMode
                                    ? Colors.green.shade300
                                    : Colors.green.shade600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }

  Widget watchedListView(bool isDarkMode, DashboardService proValue) {
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
      child: Card(
        elevation: 0,
        color: isDarkMode ? const Color(0xFF0D110F) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Watched Recently',
                    style: NerveStyles.black_medium_14_400(isDarkMode),
                  ),
                  Text('Show All', style: NerveStyles.blue_bold_12(isDarkMode)),
                ],
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 163,

                // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder:
                      (context, index) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return stockCard(
                      stock: proValue.stocks[index],
                      isDarkMode: isDarkMode,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricColumn({
    required String title,
    required String value,
    required bool isDarkMode,
    required double valueSize,
    required FontWeight valueWeight,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: NerveStyles.black_normal_11(isDarkMode)),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: valueWeight,
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildMetricItem(
    String label,
    String value, {
    required bool isDarkMode,
    Color? valueColor,
    bool isBoldValue = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: NerveStyles.black_normal_11(isDarkMode),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBoldValue ? FontWeight.bold : FontWeight.w500,
            color: valueColor ?? (isDarkMode ? Colors.white : Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget stockCard({required dynamic stock, required bool isDarkMode}) {
    return Container(
      width: 171,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1C1E1D) : Colors.white,
        border: Border.all(
          width: 1,
          color:
              isDarkMode
                  ? const Color(0x0DFFFFFF)
                  : NerveColors.containerBorderColor,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color:
                isDarkMode ? const Color(0x14FFFFFF) : const Color(0x29000000),
            offset: const Offset(1, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color:
                      isDarkMode
                          ? const Color(0xFF2A2A2A)
                          : const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    stock.symbol[0],
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stock.symbol,
                    style: NerveStyles.black_medium_14_400(isDarkMode),
                  ),
                  Text(
                    '\$${stock.price.toStringAsFixed(2)}',
                    style: NerveStyles.black_medium_14_500(isDarkMode),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  '+${stock.percentageChange.toStringAsFixed(2)}%',
                  overflow: TextOverflow.ellipsis,
                  style: NerveStyles.green_medium_12_600(isDarkMode),
                ),
              ),
              Flexible(
                child: Text(
                  '(+${stock.pointsChange.toStringAsFixed(2)} pts)',
                  overflow: TextOverflow.ellipsis,
                  style: NerveStyles.green_medium_12_600(isDarkMode),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Container(
            height: 28,
            width: double.infinity,
            decoration: BoxDecoration(
              color:
                  isDarkMode
                      ? NerveColors.chartbgGreenDark
                      : NerveColors.chartbgGreenLigth,
              borderRadius: isDarkMode ? null : BorderRadius.circular(6),
            ),
            child: CustomPaint(
              painter: SparklinePainter(
                stock.sparklinePoints,
                isDarkMode ? Colors.green.shade300 : Colors.green,
              ),
            ),
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'B ${stock.bid.toStringAsFixed(2)}',
                style: NerveStyles.black_medium_12_400(isDarkMode),
              ),
              Text(
                'A ${stock.ask.toStringAsFixed(2)}',
                style: NerveStyles.black_medium_12_400(isDarkMode),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget topPositionView(bool isDarkMode, DashboardService proValue) {
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
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: isDarkMode ? const Color(0xFF0D110F) : Colors.white,
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
                      color:
                          isDarkMode ? const Color(0xFF0D110F) : Colors.white,
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
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text(
                                  item.ticker,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        isDarkMode
                                            ? Colors.white
                                            : Colors.black,
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    isDarkMode
                                        ? NerveColors.chartbgGreenDark
                                        : NerveColors.chartbgGreenLigth,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: SvgPicture.asset(
                                'lib/Resources/Images/line_chart.svg',
                                width: 120,
                                height: 22,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              '+ ${item.profit.toStringAsFixed(2)}',
                              textAlign: TextAlign.end,
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
                              'Qty: ${item.qty.toStringAsFixed(2).padLeft(6, '0')}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color:
                                    isDarkMode ? Colors.grey[200] : Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              'Avg: ${item.avgPrice.toStringAsFixed(2).padLeft(6, '0')}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color:
                                    isDarkMode ? Colors.grey[200] : Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              'LTP: ${item.ltp.toStringAsFixed(2).padLeft(6, '0')}',
                              overflow: TextOverflow.ellipsis,
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
      ),
    );
  }

  Widget trendingView(bool isDarkMode, DashboardService proValue) {
    final List<String> trendingTabs = [
      'Trending',
      'Gainers',
      'Losers',
      'Volume Mover',
    ];

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
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: isDarkMode ? const Color(0xFF0D110F) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    trendingTabs.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color:
                              index == 0
                                  ? NerveColors.trendingBadgeBG
                                  : (isDarkMode
                                      ? const Color(0xFF2A2A2A)
                                      : const Color(0xFFF2F2F2)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          trendingTabs[index],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color:
                                index == 0
                                    ? NerveColors.trendingBadgeText
                                    : (isDarkMode
                                        ? Colors.white
                                        : Colors.black87),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 22,
                  childAspectRatio: 1.05,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final stock = proValue.stocks[index % proValue.stocks.length];
                  final isPositive = stock.percentageChange >= 0;

                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isDarkMode ? const Color(0xFF1C1E1D) : Colors.white,
                      border: Border.all(
                        width: 1,
                        color:
                            isDarkMode
                                ? const Color(0x0DFFFFFF)
                                : const Color(0x0D000000),
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color:
                              isDarkMode
                                  ? const Color(0x14FFFFFF)
                                  : const Color(0x29000000),
                          offset: const Offset(1, 2),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color:
                                    isDarkMode
                                        ? const Color(0xFF2A2A2A)
                                        : const Color(0xFFF2F2F2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  stock.symbol[0],
                                  style: TextStyle(
                                    color:
                                        isDarkMode
                                            ? Colors.white
                                            : Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    stock.symbol,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color:
                                          isDarkMode
                                              ? Colors.white
                                              : Colors.black87,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '\$${stock.price.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                      color:
                                          isDarkMode
                                              ? Colors.grey[200]
                                              : Colors.grey,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${isPositive ? '+' : ''}${stock.percentageChange.toStringAsFixed(2)}%',
                              style: TextStyle(
                                color:
                                    isPositive
                                        ? (isDarkMode
                                            ? Colors.green.shade300
                                            : Colors.green.shade600)
                                        : (isDarkMode
                                            ? Colors.red.shade300
                                            : Colors.red.shade600),
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              '(${isPositive ? '+' : ''}${stock.pointsChange.toStringAsFixed(2)} pts)',
                              style: TextStyle(
                                color:
                                    isPositive
                                        ? (isDarkMode
                                            ? Colors.green.shade300
                                            : Colors.green.shade600)
                                        : (isDarkMode
                                            ? Colors.red.shade300
                                            : Colors.red.shade600),
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Container(
                          height: 24,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                isPositive
                                    ? (isDarkMode
                                        ? const Color(0xFF2A3A32)
                                        : const Color(0xFFEAF7F0))
                                    : (isDarkMode
                                        ? const Color(0xFF3A2A2A)
                                        : const Color(0xFFF7EAEA)),
                            borderRadius:
                                isDarkMode ? null : BorderRadius.circular(6),
                          ),
                          child: CustomPaint(
                            painter: SparklinePainter(
                              stock.sparklinePoints,
                              isPositive
                                  ? (isDarkMode
                                      ? Colors.green.shade300
                                      : Colors.green.shade600)
                                  : (isDarkMode
                                      ? Colors.red.shade300
                                      : Colors.red.shade600),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'B ${stock.bid.toStringAsFixed(2)}',
                              style: TextStyle(
                                color:
                                    isDarkMode ? Colors.grey[200] : Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              'A ${stock.ask.toStringAsFixed(2)}',
                              style: TextStyle(
                                color:
                                    isDarkMode ? Colors.grey[200] : Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'Show All',
                  style: NerveStyles.blue_bold_12(isDarkMode),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget activityFeedView(bool isDarkMode) {
    final List<Map<String, String>> activities = [
      {
        'status': 'Complete',
        'title': 'AAPL 100@190.80 filled',
        'type': 'complete',
      },
      {
        'status': 'Alert',
        'title': 'TSLA crossed \$250 support',
        'type': 'alert',
      },
      {'status': 'System', 'title': 'Market open - NYSE', 'type': 'system'},
    ];

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
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: isDarkMode ? const Color(0xFF0D110F) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Activity Feed',
                    style: NerveStyles.black_medium_14_400(isDarkMode),
                  ),
                  Text('Show All', style: NerveStyles.blue_bold_12(isDarkMode)),
                ],
              ),
              const SizedBox(height: 16),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: activities.length,
                separatorBuilder:
                    (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final activity = activities[index];
                  Color badgeColor;
                  Color badgeBG;

                  switch (activity['type']) {
                    case 'complete':
                      badgeColor =
                          isDarkMode
                              ? const Color(0xFF00C087)
                              : NerveColors.activityCompleteBadgeColor;
                      badgeBG =
                          isDarkMode
                              ? Colors.transparent
                              : NerveColors.activityCompleteBadgeBG;
                      break;
                    case 'alert':
                      badgeColor =
                          isDarkMode
                              ? const Color(0xFFD39A00)
                              : NerveColors.activityAlertBadgeColor;
                      badgeBG =
                          isDarkMode
                              ? Colors.transparent
                              : NerveColors.activityAlertBadgeBG;
                      break;
                    case 'system':
                      badgeColor =
                          isDarkMode
                              ? const Color(0xFF6E8096)
                              : NerveColors.activitySystemBadgeColor;
                      badgeBG =
                          isDarkMode
                              ? Colors.transparent
                              : NerveColors.activitySystemBadgeBG;
                      break;
                    default:
                      badgeColor = Colors.grey;
                      badgeBG =
                          isDarkMode
                              ? Colors.transparent
                              : Colors.grey.shade100;
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          minHeight: 32,
                          minWidth: 68,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: badgeBG,
                          border: Border.all(color: badgeColor, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            activity['status']!,
                            style: TextStyle(
                              color: badgeColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          activity['title']!,
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black87,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SparklinePainter extends CustomPainter {
  final List<Offset> points;
  final Color lineColor;

  SparklinePainter(this.points, this.lineColor);

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;

    final paint =
        Paint()
          ..color = lineColor
          ..strokeWidth = 1.5
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(points[0].dx * size.width, points[0].dy * size.height);

    for (var i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx * size.width, points[i].dy * size.height);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant SparklinePainter oldDelegate) =>
      oldDelegate.points != points || oldDelegate.lineColor != lineColor;
}
