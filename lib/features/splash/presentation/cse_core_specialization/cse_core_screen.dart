import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:namma_cambridge/features/splash/presentation/applyforadmission_screen/applyforadmission_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/faculty/faculty_screen.dart';

class CSECoreDetailScreen extends StatelessWidget {
  const CSECoreDetailScreen({super.key});

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
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeaderCard(),
                        const SizedBox(height: 20),
                        _buildAboutSection(),
                        const SizedBox(height: 20),
                        _buildLabsSection(),
                        const SizedBox(height: 20),
                        _buildAchievementsSection(),
                        const SizedBox(height: 20),
                        _buildHODSection(context),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          _buildBottomAction(context),
        ],
      ),
    );
  }

  Widget _buildHeaderCard() {
    return _GlassWrapper(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset('assets/images/bell_3d.png', height: 80, width: 80),
            const SizedBox(width: 15),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CSE Core",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E),
                  ),
                ),
                Text(
                  "Traditional Computer Science",
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return _GlassWrapper(
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A237E),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "The CSE Core program focuses on fundamental areas of computer science such as Data Structures & Algorithms, OS, DBMS, and Networks. Students gain industry-relevant knowledge.",
              style: TextStyle(height: 1.5, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabsSection() {
    return _GlassWrapper(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSectionHeader("Labs"),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(child: _buildSmallTile("Programming Lab", Icons.code)),
                const SizedBox(width: 10),
                Expanded(child: _buildSmallTile("OS Lab", Icons.memory)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _buildSmallTile("Database Lab", Icons.storage)),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildSmallTile(
                    "Student Projects",
                    Icons.lightbulb_outline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementsSection() {
    return _GlassWrapper(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSectionHeader("Achievements"),
            const SizedBox(height: 10),
            _buildListTile("Coding Competitions", Icons.emoji_events_outlined),
            _buildListTile("Hackathons", Icons.psychology_outlined),
            _buildListTile("Student Projects", Icons.folder_open_outlined),
          ],
        ),
      ),
    );
  }

  Widget _buildHODSection(BuildContext context) {
    return _GlassWrapper(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSectionHeader("Head of Department"),
            const SizedBox(height: 15),
            const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/principle.jpg'),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Anil Verma",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Professor & HOD, CSE Core",
                      style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              "Welcome to the CSE Core program. Our department is committed to providing a strong foundation and preparing students for successful careers...",
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>FacultyScreen()));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "View Complete Faculty",
                    style: TextStyle(color: Colors.blue),
                  ),
                  Icon(Icons.chevron_right, color: Colors.blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A237E),
          ),
        ),
        const Icon(Icons.chevron_right, color: Colors.blueGrey),
      ],
    );
  }

  Widget _buildSmallTile(String title, IconData icon) {
    return InkWell(
      onTap: () {
        print("object");
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.blueAccent),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.orangeAccent),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.chevron_right, size: 18),
    );
  }

  Widget _buildBottomAction(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 16,
      right: 16,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ApplyAdmissionScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF448AFF),
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        icon: const Icon(Icons.school_outlined, color: Colors.white),
        label: const Text(
          "Apply for Admission",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xFF1A237E)),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}

class _GlassWrapper extends StatelessWidget {
  final Widget child;

  const _GlassWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: child,
        ),
      ),
    );
  }
}
