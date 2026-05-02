import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:namma_cambridge/features/splash/presentation/cse_core_specialization/cse_core_screen.dart';

class SpecializationScreen extends StatelessWidget {
  const SpecializationScreen({super.key});

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
                const SizedBox(height: 10),
                const Text(
                  "Select your specialization",
                  style: TextStyle(color: Colors.black45, fontSize: 14),
                ),
                const SizedBox(height: 20),

                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildSpecCard(
                        context,
                        "CSE Core",
                        "Traditional Computer Science",
                        Icons.computer,
                        tag: "Trending",
                        tagColor: Colors.orange,
                      ),
                      _buildSpecCard(
                        context,
                        "CSE (AI & ML)",
                        "Artificial Intelligence & Machine Learning",
                        Icons.psychology,
                      ),
                      _buildSpecCard(
                        context,
                        "CSE (Cyber Security)",
                        "Security & Ethical Hacking",
                        Icons.shield,
                        isStarred: true,
                      ),
                      _buildSpecCard(
                        context,
                        "CSE (IoT)",
                        "Internet of Things & Smart Devices",
                        Icons.settings_input_antenna,
                      ),
                      _buildSpecCard(
                        context,
                        "CSE (Data Science)",
                        "Big Data & Analytics",
                        Icons.bar_chart,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildSpecCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon, {
    String? tag,
    Color? tagColor,
    bool isStarred = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.65),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withOpacity(0.4)),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              onTap: () {
                print("Selected: $title");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CSECoreDetailScreen(),
                  ),
                );
              },
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(icon, color: const Color(0xFF1A237E), size: 30),
              ),
              title: Row(
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (tag != null) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color:
                            tagColor?.withOpacity(0.2) ??
                            Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: tagColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  if (isStarred) ...[
                    const SizedBox(width: 5),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                  ],
                ],
              ),
              subtitle: Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                color: Color(0xFF1A237E),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        "Computer Science Engineering",
        style: TextStyle(
          color: Color(0xFF1A237E),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xFF1A237E)),
        onPressed: () => Navigator.pop(context),
      ),
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(right: 16.0),
      //     child: Badge(
      //       label: const Text("1"),
      //       child: const Icon(
      //         Icons.notifications_none,
      //         color: Color(0xFF1A237E),
      //         size: 28,
      //       ),
      //     ),
      //   ),
      // ],
    );
  }

  Widget _buildBottomNav() {
    return ClipRRect(
      // borderRadius: BorderRadius.only(
      //   topRight: Radius.circular(5),
      //   topLeft: Radius.circular(5),
      // ),
      child: BottomNavigationBar(
        selectedItemColor: const Color(0xFF1A237E),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "Community",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
