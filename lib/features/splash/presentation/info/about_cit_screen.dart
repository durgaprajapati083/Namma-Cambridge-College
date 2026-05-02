import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namma_cambridge/features/splash/presentation/faculty/faculty_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/specialization/specialization_screen.dart';

import '../../../campus_selection/widgets/glass_card.dart';
import '../screens/campus_selection_screen.dart';

class AboutCITScreen extends StatelessWidget {
  const AboutCITScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.asset('assets/images/main_remover.png', height: 200),
                        const SizedBox(height: 10),
                        const Text(
                          "Cambridge Institute of Technology - Main Campus",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A237E),
                          ),
                        ),
                        const Text(
                          "Innovation in Education, Excellence in Practice",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                  const Text(
                    "Leadership",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A237E),
                    ),
                  ),
                  const Text(
                    "Meet our Principal, CEO, and Founder",
                    style: TextStyle(color: Colors.black45),
                  ),
                  const SizedBox(height: 15),

                  // Horizontal Leadership List
                  SizedBox(
                    height: 280,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _leaderCard(
                          "Dr. A. Kumar",
                          "Principal",
                          "Empowering students to achieve excellence.",
                          "assets/images/principle.jpg",
                        ),
                        _leaderCard(
                          "Ms. Priya Sharma",
                          "CEO",
                          "Driving growth and industry connections.",
                          "assets/images/priya.png",
                        ),
                        _leaderCard(
                          "Mr. Rakesh Mehta",
                          "Founder",
                          "Transforming education with a visionary approach.",
                          "assets/images/rakesh.jpg",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                  const Text(
                    "Departments",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A237E),
                    ),
                  ),
                  const Text(
                    "Browse our academic departments",
                    style: TextStyle(color: Colors.black45),
                  ),
                  const SizedBox(height: 15),

                  Row(
                    children: [
                      Expanded(
                          child: _deptTile(
                            "CSE",
                            "Innovations in computer tech.",
                            "24 Faculty",
                            Icons.computer,
                              (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SpecializationScreen()));
                              }

                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _deptTile(
                          "ECE",
                          "Advancing communication tech.",
                          "18 Faculty",
                          Icons.router,
                            (){}
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _deptTileFullWidth(
                    "ME",
                    "Excellence in mechanical design.",
                    "20 Faculty",
                    Icons.settings,
                  ),
                  const SizedBox(height: 20),

                  Center(
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FacultyScreen(),
                          ),
                        );
                      },
                      icon: const Text(
                        "View All Faculty",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A237E),
                        ),
                      ),
                      label: const Icon(
                        Icons.chevron_right,
                        color: Color(0xFF1A237E),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        // icon: const Icon(Icons.arrow_back, color: Color(0xFF1A237E)),
        IconButton(onPressed: () async{
          SnackBar(content: Text("User Logging out...."));
          await FirebaseAuth.instance.signOut();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const CampusSelectionScreen()),
                (Route<dynamic> route) => false,
          );
        }, icon: Icon(Icons.logout,color: Colors.redAccent,)),
      ],
      title: const Text(
        "About CIT",
        style: TextStyle(color: Color(0xFF1A237E), fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(right: 16.0),
      //     child: Badge(
      //       label: const Text("1"),
      //       child: const Icon(
      //         Icons.notifications,
      //         color: Color(0xFF1A237E),
      //         size: 28,
      //       ),
      //     ),
      //   ),
      // ],
    );
  }

  Widget _leaderCard(String name, String role, String desc, String imgPath) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 15),
      child: GlassCard(
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    role,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(desc, style: const TextStyle(fontSize: 10), maxLines: 2),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 30,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(shape: StadiumBorder()),
                      child: const Text(
                        "View Profile",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _deptTile(String title, String sub, String count, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: GlassCard(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.blue),
                  const Spacer(),
                  const Icon(Icons.chevron_right, size: 16),
                ],
              ),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                sub,
                style: const TextStyle(fontSize: 10, color: Colors.black54),
                maxLines: 2,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.people_outline, size: 12),
                  Text(" $count", style: const TextStyle(fontSize: 10)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _deptTileFullWidth(
      // BuildContext context,
    String title,
    String sub,
    String count,
    IconData icon,
  ) {
    return GlassCard(
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(sub, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CSECoreDetailScreen()));
        },
      ),
    );
  }
}
