import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skl_first/preference/colors.dart';

import 'welcoming1_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 1.0;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _opacity = 0.0;
        });

        Future.delayed(const Duration(milliseconds: 400), () {
          if (mounted) {
            // Use PageRouteBuilder for smoother bottom-to-top transition with fade
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                const Welcoming1Screen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0); // Start from bottom
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var slideTween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  var fadeTween = Tween<double>(begin: 0.0, end: 1.0);

                  var slideAnimation = animation.drive(slideTween);
                  var fadeAnimation = animation.drive(fadeTween);

                  return FadeTransition(
                    opacity: fadeAnimation,
                    child: SlideTransition(
                      position: slideAnimation,
                      child: child,
                    ),
                  );
                },
                transitionDuration:
                const Duration(milliseconds: 800), // Smoother and faster
              ),
            );
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(milliseconds: 600),
        child: buildSplash(),
      ),
    );
  }

  Stack buildSplash() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icon_splash.png',
                  width: 300,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
