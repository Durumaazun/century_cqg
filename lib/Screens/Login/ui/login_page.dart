import 'package:flutter/material.dart';
import 'package:century_cqg/Screens/Login/ui/login_mob.dart';
import 'package:century_cqg/app_config.dart';
import 'package:century_cqg/Helper/nerve_base.dart';
import 'package:century_cqg/Helper/nerve_enum.dart';

class LoginMain extends StatelessWidget {
  const LoginMain({super.key});

  @override
  Widget build(BuildContext context) {
    switch (AppConfig().currentPlatform) {
      case AppPlatform.mobile:
        return const LoginMobPage();

      case AppPlatform.web:
        return PopScope(
          canPop: false,
          child: LayoutBuilder(
            builder: (buildContext, boxConstraints) {
              final screenWidth = boxConstraints.maxWidth;
              final screenHeight = boxConstraints.maxHeight;

              NerveBase().screenWidth = boxConstraints.maxWidth;
              // NerveBase().screenHeight = boxConstraints.maxHeight;

              if ((screenWidth < 800) || (screenHeight < 600)) {
                return const LoginMobPage();
              } else {
                return Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Web Login Page',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                );
                // return const LoginWebPage();
              }
            },
          ),
        );
    }
  }
}
