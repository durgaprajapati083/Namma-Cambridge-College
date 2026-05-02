import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namma_cambridge/core/constants/app_colors.dart';
import 'package:namma_cambridge/core/constants/app_strings.dart';
import 'package:namma_cambridge/core/constants/asset_paths.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AssetPaths.appLogo,
          width: 110,
          height: 110,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 20),

        Text(
          AppStrings.appTitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: AppColors.primaryBlue,
              fontSize: 25,
              fontWeight: FontWeight.w700, // Bold weight
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          AppStrings.appTagline,
          textAlign: TextAlign.center,
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
              color: AppColors.textGray,
              fontSize: 18,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
