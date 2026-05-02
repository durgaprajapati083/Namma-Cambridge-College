import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:namma_cambridge/DashboardScreens/course_registration_screen.dart';
import 'package:namma_cambridge/DashboardScreens/exam_application_screen.dart';
import 'package:namma_cambridge/DashboardScreens/internship_project_screen.dart';
import 'package:namma_cambridge/DashboardScreens/online_exam_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/faculty/faculty_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/screens/campus_selection_screen.dart';

import '../widgets/glass_container.dart';
import '../widgets/info_card.dart';
import '../widgets/sidebar_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      // backgroundColor: Colors.blueAccent,
      key: scaffoldKey,
      drawer: const SidebarDrawer(),
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
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.menu, color: Color(0xFF1A237E)),
                            onPressed: () => scaffoldKey.currentState?.openDrawer(),
                          ),
                          // const Badge(
                          //   label: Text('2'),
                          //   child: Icon(
                          //     Icons.notifications_none,
                          //     color: Color(0xFF1A237E),
                          //     size: 28,
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Hello, Durga Prajapati 👋",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A237E),
                        ),
                      ),
                      const Text(
                        "CSE Core | Sem 3 >",
                        style: TextStyle(color: Colors.black45, fontSize: 13),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Expanded(
                            child: InfoCard(
                              title: "Library Books",
                              mainText: "Introduction to Algorithms",
                              footerText: "Due by: Apr 30, 2024",
                              icon: Icons.menu_book,
                              imagePath: 'assets/images/book.png',
                              subtitle: 'Issued on:',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  FacultyScreen()),
                                );
                              },
                              child: const InfoCard(
                                title: "Faculty",
                                subtitle: "View Department Faculty",
                                actionButtonText: "Choose Department >",
                                icon: Icons.people_alt_outlined,
                                imagePath: 'assets/images/faculty_logo.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      GlassContainer(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.campaign_outlined, color: Colors.blue),
                                    Text(" Announcements", style: TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: const Text(
                                    "View All >",
                                    style: TextStyle(color: Colors.blue, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            const ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Icon(Icons.calendar_month, color: Color(0xFF1A237E)),
                              title: Text(
                                "Mid-Term Exam Schedule",
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "Check the updated schedule for upcoming exams.",
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const GlassContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Today's Classes", style: TextStyle(fontWeight: FontWeight.bold)),
                                Text(
                                  "View Full Timetable",
                                  style: TextStyle(color: Colors.blue, fontSize: 11),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            _ClassRow(
                              time: "10:00 am - 11:00 am",
                              subject: "DSA",
                              room: "C-206",
                            ),
                            _ClassRow(
                              time: "11:00 am - 12:00 pm",
                              subject: "Operating Systems",
                              room: "C-204",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 2.5,
                        children: [
                          _buildActionBtn(
                            Icons.edit_note,
                            "Course\nRegistration",
                            Colors.blue.shade50,
                                () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CourseRegistrationScreen())),
                          ),
                          _buildActionBtn(
                            Icons.description_outlined,
                            "Exam\nApplication",
                            Colors.indigo.shade50,
                                () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ExamApplicationScreen())),
                          ),
                          _buildActionBtn(
                            Icons.laptop_chromebook,
                            "Online Exam",
                            Colors.blue.shade50,
                                () => Navigator.push(context, MaterialPageRoute(builder: (context) => const OnlineExamScreen())),
                          ),
                          _buildActionBtn(
                            Icons.business_center_outlined,
                            "Project /\nInternship",
                            Colors.indigo.shade50,
                                () => Navigator.push(context, MaterialPageRoute(builder: (context) => const InternshipProjectScreen())),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 20,
                  right: 20,
                  child: _CustomBottomNav(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionBtn(IconData icon, String label, Color bg, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue[800], size: 22),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A237E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClassRow extends StatelessWidget {
  final String time, subject, room;
  const _ClassRow({required this.time, required this.subject, required this.room});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          Text(subject, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1A237E), fontSize: 12)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              room,
              style: const TextStyle(color: Colors.blue, fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navItem(Icons.search, "Explore", true),
          _navItem(Icons.calendar_today_outlined, "Events", false),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: active ? Colors.blue : Colors.grey),
        Text(
          label,
          style: TextStyle(
            color: active ? Colors.blue : Colors.grey,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}