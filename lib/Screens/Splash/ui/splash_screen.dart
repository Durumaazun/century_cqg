import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:century_cqg/Helper/nerve_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  // Staggered animations for the concentric circles
  late Animation<double> _innerCircleScale;
  late Animation<double> _midCircleScale;
  late Animation<double> _outerCircleScale;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(
        milliseconds: 1800,
      ), // Slightly prolonged for smooth staggering
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.2,
          0.8,
          curve: Curves.easeOutBack,
        ), // Playful pop effect for logo
      ),
    );

    // Staggered entries for the three concentric background rings
    _innerCircleScale = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutCubic),
      ),
    );

    _midCircleScale = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.15, 0.85, curve: Curves.easeOutCubic),
      ),
    );

    _outerCircleScale = Tween<double>(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    _animationController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(NerveScreensNames.dashboard);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // True colors matching your updated snapshot mockup
    const baseCreamBg = Color(0xFFFFFDF6); // Clean soft ivory base
    const outerRingColor = Color(0xFFFFFBEA);
    const midRingColor = Color(0xFFFFF9DE);
    const innerRingColor = Color(0xFFFFF5D0);

    return Scaffold(
      backgroundColor: baseCreamBg,
      body: SizedBox.expand(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Make circles responsive: calculate sizes based on screen width
            // Ensure all 3 circles fit on screen
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;
            final minDimension =
                screenWidth < screenHeight ? screenWidth : screenHeight;

            // Scale circles to fit on screen (outer circle = 80% of smallest dimension)
            final scale = minDimension / 990.0;
            final outerSize = 990 * scale;
            final midSize = 780 * scale;
            final innerSize = 520 * scale;

            return Center(
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.hardEdge,
                children: [
                  // Large Outer Ring
                  ScaleTransition(
                    scale: _outerCircleScale,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        width: outerSize,
                        height: outerSize,
                        decoration: const BoxDecoration(
                          color: outerRingColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),

                  // Medium Middle Ring
                  ScaleTransition(
                    scale: _midCircleScale,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        width: midSize,
                        height: midSize,
                        decoration: const BoxDecoration(
                          color: midRingColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),

                  // Solid Inner Core Ring
                  ScaleTransition(
                    scale: _innerCircleScale,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        width: innerSize,
                        height: innerSize,
                        decoration: const BoxDecoration(
                          color: innerRingColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),

                  // --- 2. LOGO CONTAINER LAYER ---
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: SizedBox(
                        width: 220,
                        height: 220,
                        child: Center(
                          child: SvgPicture.asset(
                            'lib/Resources/Images/Logo.svg',
                            width: 190,
                            height: 190,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
