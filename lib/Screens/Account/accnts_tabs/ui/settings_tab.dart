import 'package:flutter/material.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';
import 'package:century_cqg/Helper/nerve_colors.dart';
import 'package:century_cqg/Screens/Account/ui/app_settings_page.dart';
import 'package:century_cqg/Screens/Account/ui/reports_page.dart';
import 'package:century_cqg/Helper/nerve_base.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = NerveBase().isDarkMode;
    final cardColor = isDarkMode ? const Color(0xFF0D110F) : Colors.white;
    final iconBg =
        isDarkMode ? const Color(0xFF2B2B2B) : const Color(0xFFF2F2F2);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SettingsListTile(
            isDarkMode: isDarkMode,
            cardColor: cardColor,
            iconBg: iconBg,
            title: 'App Settings',
            icon: Icons.settings_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AppSettingsPage()),
              );
            },
          ),
          const SizedBox(height: 16),
          _SettingsListTile(
            isDarkMode: isDarkMode,
            cardColor: cardColor,
            iconBg: iconBg,
            title: 'Notifications',
            icon: Icons.notifications_none_rounded,
          ),
          const SizedBox(height: 16),
          _SettingsListTile(
            isDarkMode: isDarkMode,
            cardColor: cardColor,
            iconBg: iconBg,
            title: 'Reports',
            icon: Icons.help_outline_rounded,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ReportsPage()),
              );
            },
          ),
          const SizedBox(height: 16),
          _SettingsListTile(
            isDarkMode: isDarkMode,
            cardColor: cardColor,
            iconBg: iconBg,
            title: 'Support',
            icon: Icons.help_outline_rounded,
          ),
          const SizedBox(height: 16),
          _SettingsListTile(
            isDarkMode: isDarkMode,
            cardColor: cardColor,
            iconBg: iconBg,
            title: 'Logout',
            icon: Icons.logout,
            isLogout: true,
          ),
        ],
      ),
    );
  }
}

class _SettingsListTile extends StatelessWidget {
  final bool isDarkMode;
  final Color cardColor;
  final Color iconBg;
  final String title;
  final IconData icon;
  final bool isLogout;
  final VoidCallback? onTap;

  const _SettingsListTile({
    required this.isDarkMode,
    required this.cardColor,
    required this.iconBg,
    required this.title,
    required this.icon,
    this.isLogout = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color titleColor =
        isLogout
            ? const Color(0xFFFF4D4F)
            : (isDarkMode ? Colors.white : const Color(0xFF4A4A4A));

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: NerveColors.containerBorderColor,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDarkMode ? 0.18 : 0.06),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 16,
                  color:
                      isLogout
                          ? const Color(0xFFFF4D4F)
                          : (isDarkMode ? Colors.grey[300] : Colors.grey[700]),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: NerveStyles.black_medium_14_400(
                    isDarkMode,
                  ).copyWith(color: titleColor),
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 22,
                color: isDarkMode ? Colors.grey[400] : Colors.grey[500],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
