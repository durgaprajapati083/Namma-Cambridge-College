import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:namma_cambridge/features/campus_selection/widgets/glass_card.dart';

class CampusSelectionScreen extends StatelessWidget {
  const CampusSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
          // child: CircleAvatar(
          //   backgroundColor: Colors.blue.withOpacity(0.2),
            // child: IconButton(
            //   icon: const Icon(
            //     Icons.arrow_back,
            //     color: Color(0xFF1A237E),
            //     size: 20,
            //   ),
            //   onPressed: () => Navigator.pop(context),
            // ),
          // ),
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                // const Icon(
                //   Icons.notifications,
                //   color: Color(0xFF1A237E),
                //   size: 28,
                // ),
                // Container(
                //   padding: const EdgeInsets.all(4),
                //   decoration: const BoxDecoration(
                //     color: Colors.red,
                //     shape: BoxShape.circle,
                //   ),
                //   child: const Text(
                //     '1',
                //     style: TextStyle(color: Colors.white, fontSize: 10),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(color: Colors.white.withOpacity(0.1)),
            ),
          ),

          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  // const SizedBox(height: ),
                  const Text(
                    "Where do you want to go?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A237E),
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: GridView.count(
                      padding: EdgeInsets.only(bottom: 100),
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.70,
                      children: [
                        _buildCampusCard(
                          context,
                          "CIT - Main Campus",
                          "assets/images/main_remover.png",
                          bgPath: "assets/images/background.png",
                        ),
                        _buildCampusCard(
                          context,
                          "CIT - North Campus",
                          "assets/images/cambridge_northcampus_logo.png",
                          bgPath: "assets/images/north_campus.jpeg",
                        ),
                        _buildCampusCard(
                          context,
                          "Cambridge College",
                          "assets/images/cambridge_college_logo.png",
                          bgPath: "assets/images/cambridge_college.jpeg",
                        ),
                        _buildCampusCard(
                          context,
                          "Cambridge PU College",
                          "assets/images/cam_pre_uni_logo.png",
                          bgPath: "assets/images/PU.jpeg",
                        ),
                        _buildCampusCard(
                          context,
                          "Cambridge School",
                          "assets/images/cambridge_school_logo.png",
                          bgPath: "assets/images/School.jpeg",
                        ),
                        _buildCampusCard(
                          context,
                          "Cambridge Juniors",
                          "assets/images/cam_juniors_logo.png",
                          bgPath: "assets/images/juniors.jpeg",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCampusCard(
    BuildContext context,
    String title,
    String logoPath, {
    double? imageWidth,
    double? imageHeight,
    String? bgPath,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 195,
      child: GlassCard(
        child: Stack(
          children: [
            Positioned.fill(
              child: bgPath != null
                  ? Image.asset(bgPath, fit: BoxFit.cover)
                  : Container(color: Colors.white),
            ),

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.4)),
                ),
              ),
            ),

            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () {
                  if (title == "CIT - Main Campus")
                    Navigator.pushNamed(context, '/cit_main');
                  else if (title == "CIT - North Campus")
                    Navigator.pushNamed(context, '/cit_north');
                  else if (title == "Cambridge College")
                    Navigator.pushNamed(context, '/cambridge_college');
                  else if (title == "Cambridge PU College")
                    Navigator.pushNamed(context, '/cambridge_pu');
                  else if (title == "Cambridge School")
                    Navigator.pushNamed(context, '/cambridge_school');
                  else if (title == "Cambridge Juniors")
                    Navigator.pushNamed(context, '/cambridge_juniors');
                },
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.85),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Image.asset(logoPath, fit: BoxFit.contain),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A237E),
                        ),
                      ),

                      const SizedBox(height: 4),

                      const Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
