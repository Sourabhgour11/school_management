

import 'package:flutter/material.dart';
import 'package:school_management/app/utils/app_colours.dart';
import 'package:school_management/app/utils/app_images.dart';
import 'package:school_management/app/utils/app_style.dart';

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
      body: Center(
        child: Container(
          height: AppStyle.heightPercent(context,20),
          width: AppStyle.widthPercent(context,40),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.appLogo),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
