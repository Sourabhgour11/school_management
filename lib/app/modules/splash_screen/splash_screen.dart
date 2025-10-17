import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:school_management/app/modules/auth/login_screen/login_screen.dart';
import 'package:school_management/app/utils/app_colours.dart';
import 'package:school_management/app/utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Wait until location is ready, then show your splash animation
    return Scaffold(
      backgroundColor: AppColours.backgroundColor,
      body: AnimatedSplashScreen(
        duration: 2000,
        splash: Transform.scale(
          scale: 3.0,
          child: Image.asset(AppImages.appLogo, fit: BoxFit.contain),
        ),
        nextScreen: LoginScreen(),
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      )
    );
  }
}
