import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/asset_paths.dart';
import '../widgets/campus_grid_card.dart';

class DestinationPickerScreen extends StatelessWidget {
  const DestinationPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _iconBox(Icons.arrow_back),
                  _iconBox(Icons.notifications_none, hasBadge: true),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Where do you want to go?',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.navyBlue,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.85,
                  children: const [
                    CampusCard(
                      title: 'CIT - Main Campus',
                      asset: AssetPaths.citLogo,
                    ),
                    CampusCard(
                      title: 'CIT - North Campus',
                      asset: AssetPaths.citLogo,
                    ),
                    CampusCard(
                      title: 'Cambridge College',
                      asset: AssetPaths.collegeLogo,
                    ),
                    CampusCard(
                      title: 'Cambridge PU College',
                      asset: AssetPaths.puLogo,
                    ),
                    CampusCard(
                      title: 'Cambridge School',
                      asset: AssetPaths.schoolLogo,
                    ),
                    CampusCard(
                      title: 'Cambridge Juniors',
                      asset: AssetPaths.juniorsLogo,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconBox(IconData icon, {bool hasBadge = false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Icon(icon, color: AppColors.primaryBlue),
          if (hasBadge)
            Positioned(
              right: 0,
              child: CircleAvatar(radius: 4, backgroundColor: Colors.red),
            ),
        ],
      ),
    );
  }
}
