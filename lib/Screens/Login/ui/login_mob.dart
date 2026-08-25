import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:century_cqg/Helper/nerve_colors.dart';
import 'package:century_cqg/Helper/nerve_styles.dart';
import 'package:century_cqg/Helper/nerve_navigation.dart';
import 'package:century_cqg/Screens/Login/service/login_service.dart';

class LoginMobPage extends StatefulWidget {
  const LoginMobPage({super.key});

  @override
  State<LoginMobPage> createState() => _LoginMobPageState();
}

class _LoginMobPageState extends State<LoginMobPage> {
  late TextEditingController _userIdController;
  late TextEditingController _passwordController;
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _userIdController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginService(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFDF6),
        body: Consumer<LoginService>(
          builder: (context, loginService, _) {
            return SizedBox.expand(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Top golden circles background (same as splash)
                    SizedBox(
                      height: 260,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final minDimension = constraints.maxHeight * 1.5;
                          final outerSize = minDimension * 0.9;
                          final midSize = minDimension * 0.65;
                          final innerSize = minDimension * 0.45;

                          return Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.hardEdge,
                            children: [
                              // Outer Circle
                              Container(
                                width: outerSize,
                                height: outerSize,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFFBEA),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Middle Circle
                              Container(
                                width: midSize,
                                height: midSize,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFF9DE),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Inner Circle
                              Container(
                                width: innerSize,
                                height: innerSize,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFF5D0),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: NerveColors.chartbgGreenLigth,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: SvgPicture.asset(
                        'lib/Resources/Images/circle_login.svg',
                        width: 74,
                        height: 16,
                      ),
                    ),
                    // Login Form
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          // Title
                          Text(
                            'Login',
                            style: NerveStyles.black_bold_16(
                              Theme.of(context).brightness == Brightness.dark,
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Error Message
                          if (loginService.errorMessage != null)
                            Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.1),
                                border: Border.all(color: Colors.red),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                loginService.errorMessage!,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),

                          // User Id Field
                          Text(
                            'User Id',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _userIdController,
                            onChanged: (value) => loginService.setUserId(value),
                            decoration: InputDecoration(
                              hintText: 'Enter your User ID',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Password Field
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _passwordController,
                            onChanged:
                                (value) => loginService.setPassword(value),
                            obscureText: !_showPassword,
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Remember Me & Forgot Password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: loginService.rememberMe,
                                    onChanged: (value) {
                                      loginService.setRememberMe(
                                        value ?? false,
                                      );
                                    },
                                    activeColor: NerveColors.selectedNavColor,
                                  ),
                                  Text(
                                    'Remember me',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigate to forgot password
                                },
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: NerveColors.selectedNavColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Sandbox Toggle
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sandbox',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Switch(
                                value: loginService.useSandbox,
                                onChanged: (value) {
                                  loginService.setUseSandbox(value);
                                },
                                activeColor: NerveColors.selectedNavColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Sign In Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed:
                                  loginService.isLoading
                                      ? null
                                      : () async {
                                        final success =
                                            await loginService.login();
                                        if (success && mounted) {
                                          // Navigate to Dashboard
                                          Navigator.of(
                                            context,
                                          ).pushReplacementNamed(
                                            NerveScreensNames.dashboard,
                                          );
                                        }
                                      },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: NerveColors.selectedNavColor,
                                disabledBackgroundColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child:
                                  loginService.isLoading
                                      ? const SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                Colors.white,
                                              ),
                                        ),
                                      )
                                      : const Text(
                                        'Sign In',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Biometric Option
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.fingerprint, size: 20),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    // Implement biometric login
                                  },
                                  child: Text(
                                    'Sign in with Biometric',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Open Account Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () {
                                // Navigate to sign up
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "Don't have an account? Open Account",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Footer Links
                          Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 4,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'User Agreement',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.blue[600],
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                Text(
                                  ' • ',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Terms & Condition',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.blue[600],
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                Text(
                                  ' • ',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.blue[600],
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
