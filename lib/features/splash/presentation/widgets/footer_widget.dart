import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namma_cambridge/core/constants/app_colors.dart';
import 'package:namma_cambridge/core/constants/app_strings.dart';
import 'package:namma_cambridge/core/constants/asset_paths.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AssetPaths.bell,
          width: 45,
          height: 45,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),


        Text(
          AppStrings.footerMadeBy,
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              color: AppColors.textGray,
              fontSize: 12,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 4),

        Text(
          AppStrings.footerCompany,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: AppColors.primaryBlue,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}