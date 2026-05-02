import 'dart:async';

import 'package:flutter/material.dart';
import 'package:namma_cambridge/core/constants/app_colors.dart';
import 'package:namma_cambridge/core/constants/asset_paths.dart';
import 'package:namma_cambridge/features/splash/presentation/screens/campus_selection_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/widgets/header-widget.dart';

import '../widgets/footer_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/cit_main');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CampusSelectionScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: Stack(
        children: [
          Positioned(
            bottom: 180,
            left: 0,
            right: -20,
            child: Image.asset(
              AssetPaths.studentBackground,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.38,
              alignment: Alignment.center,
              color: isDarkMode ? Colors.black.withOpacity(0.6) : null,
              colorBlendMode: isDarkMode ? BlendMode.darken : null,
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42.0),
              child: Column(
                children: const [
                  SizedBox(height: 60),
                  HeaderWidget(),
                  Spacer(),
                  FooterWidget(),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
