import 'package:flutter/material.dart';
import 'package:century_cqg/Helper/nerve_colors.dart';
import 'package:century_cqg/Helper/nerve_base.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = NerveBase().isDarkMode;
    final bgColor =
        isDarkMode ? const Color(0xFF0D110F) : const Color(0xFFF6F6F6);
    final cardColor = isDarkMode ? const Color(0xFF0D110F) : Colors.white;
    final borderColor = NerveColors.containerBorderColor;
    final titleColor = isDarkMode ? Colors.white : const Color(0xFF2A2A2A);
    final subtitleColor =
        isDarkMode ? const Color(0xFFB5B5B5) : const Color(0xFF8F8F8F);
    final rowTextColor = isDarkMode ? Colors.white : const Color(0xFF505050);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: cardColor,
        iconTheme: IconThemeData(color: rowTextColor),
        titleSpacing: 0,
        title: Text(
          'APP SETTINGS',
          style: TextStyle(
            color: rowTextColor,
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1,
            letterSpacing: 0,
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
          padding: const EdgeInsets.fromLTRB(10, 18, 10, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SettingsSection(
                title: 'Profile',
                titleColor: subtitleColor,
                cardColor: cardColor,
                borderColor: borderColor,
                rowTextColor: rowTextColor,
                items: const [
                  'Personal Information',
                  'Two-Factor Authentication',
                  'Change Password',
                ],
              ),
              const SizedBox(height: 18),
              _SettingsSection(
                title: 'Trading',
                titleColor: subtitleColor,
                cardColor: cardColor,
                borderColor: borderColor,
                rowTextColor: rowTextColor,
                items: const [
                  'Default Leverage',
                  'Risk Management',
                  'Order Confirmation',
                ],
              ),
              const SizedBox(height: 18),
              _SettingsSection(
                title: 'Notifications',
                titleColor: subtitleColor,
                cardColor: cardColor,
                borderColor: borderColor,
                rowTextColor: rowTextColor,
                items: const [
                  'Price Alerts',
                  'Order Updates',
                  'Account Activity',
                ],
              ),
              const SizedBox(height: 8),
              Text('', style: TextStyle(color: titleColor)),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color cardColor;
  final Color borderColor;
  final Color rowTextColor;
  final List<String> items;

  const _SettingsSection({
    required this.title,
    required this.titleColor,
    required this.cardColor,
    required this.borderColor,
    required this.rowTextColor,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1,
              letterSpacing: 0,
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
                color: Colors.black.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: List.generate(items.length, (index) {
              return Column(
                children: [
                  _SectionRow(title: items[index], rowTextColor: rowTextColor),
                  if (index != items.length - 1)
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

class _SectionRow extends StatelessWidget {
  final String title;
  final Color rowTextColor;

  const _SectionRow({required this.title, required this.rowTextColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: rowTextColor,
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1,
                  letterSpacing: 0,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: rowTextColor.withOpacity(0.5),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
