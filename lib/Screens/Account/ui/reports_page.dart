import 'package:flutter/material.dart';
import 'package:century_cqg/Helper/nerve_base.dart';
import 'package:century_cqg/Helper/nerve_colors.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = NerveBase().isDarkMode;
    final bgColor =
        isDarkMode ? const Color(0xFF0D110F) : const Color(0xFFF6F6F6);
    final cardColor = isDarkMode ? const Color(0xFF0D110F) : Colors.white;
    final borderColor = NerveColors.containerBorderColor;
    final textColor = isDarkMode ? Colors.white : const Color(0xFF505050);
    final sectionColor =
        isDarkMode ? const Color(0xFFB5B5B5) : const Color(0xFF8F8F8F);

    final sections = <_ReportSectionData>[
      const _ReportSectionData(
        title: 'Profit & Loss',
        items: ['Stocks P&L', 'F&O P&L', 'Dividend Report'],
      ),
      const _ReportSectionData(
        title: 'Tax',
        items: ['Stocks Capital Gains', 'F&O Tax Report'],
      ),
      const _ReportSectionData(
        title: 'Holdings',
        items: ['Stocks - Holdings Statement'],
      ),
      const _ReportSectionData(
        title: 'Transactions',
        items: ['Stocks - Order History', 'Balance Statement', 'Contract Note'],
      ),
    ];

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: cardColor,
        iconTheme: IconThemeData(color: textColor),
        titleSpacing: 0,
        title: Text(
          'REPORTS',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1,
            letterSpacing: 0,
            color: textColor,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: borderColor),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(12, 18, 12, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                sections
                    .map(
                      (section) => Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: _ReportsSection(
                          section: section,
                          sectionColor: sectionColor,
                          cardColor: cardColor,
                          borderColor: borderColor,
                          rowTextColor: textColor,
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }
}

class _ReportsSection extends StatelessWidget {
  final _ReportSectionData section;
  final Color sectionColor;
  final Color cardColor;
  final Color borderColor;
  final Color rowTextColor;

  const _ReportsSection({
    required this.section,
    required this.sectionColor,
    required this.cardColor,
    required this.borderColor,
    required this.rowTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            section.title,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1,
              letterSpacing: 0,
              color: sectionColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: borderColor, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: List.generate(section.items.length, (index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(18),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              section.items[index],
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1,
                                letterSpacing: 0,
                                color: rowTextColor,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 22,
                            color: rowTextColor.withOpacity(0.35),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (index != section.items.length - 1)
                    Divider(height: 1, thickness: 1, color: borderColor),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _ReportSectionData {
  final String title;
  final List<String> items;

  const _ReportSectionData({required this.title, required this.items});
}
