import 'dart:ui';

import 'package:flutter/material.dart';

class ScWelcomeRoleScreen extends StatelessWidget {
  const ScWelcomeRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.4),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF1A237E),
                size: 20,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Badge(
        //       label: Text("1"),
        //       child: Icon(
        //         Icons.notifications,
        //         color: Color(0xFF1A237E),
        //         size: 28,
        //       ),
        //     ),
        //     onPressed: () {},
        //   ),
        //   const SizedBox(width: 12),
        // ],
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
            child: Column(
              children: [
                const SizedBox(height: 5),
                Center(
                  child: Image.asset(
                    'assets/images/cambridge_school_logo.png',
                    height: 280,
                    width: 280,
                  ),
                ),
                const SizedBox(height: 10),
                // 3. Main Headings
                const Text(
                  "Welcome to Cambridge School",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Explore, Learn, and Connect",
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.blueGrey.shade800,
                  ),
                ),
                const SizedBox(height: 40),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildWelcomeCard(
                          context,
                          title: "Faculty Login",
                          subtitle: "Manage students\n& updates",
                          icon: Icons.person_search_outlined,
                          route: '',
                        ),
                      ),

                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildWelcomeCard(
                          context,
                          title: "Student Login",
                          subtitle: "Access your\ndashboard",
                          icon: Icons.school_outlined,
                          route: '',
                          isActive: true,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildWelcomeCard(
                          context,
                          title: "Visitor",
                          subtitle: "Explore campus\n& facilities",
                          icon: Icons.visibility_outlined,
                          route: '',
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),
                const Text(
                  "Built by Cambrians ❤️",
                  style: TextStyle(
                    color: Color(0xFF1A237E),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeCard(
      BuildContext context, {
        required String title,
        required String subtitle,
        required IconData icon,
        required String route,
        bool isActive = false,
      }) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        height: 190,
        decoration: BoxDecoration(
          color: isActive
              ? Colors.blue.shade100.withOpacity(0.8)
              : Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Icon(icon, size: 40, color: const Color(0xFF1E88E5)),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Color(0xFF1A237E),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, color: Colors.blueGrey.shade700),
            ),
            const Spacer(),
            Container(
              height: 35,
              width: double.infinity,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFF1E88E5)
                    : Colors.blue.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.arrow_forward,
                size: 18,
                color: isActive ? Colors.white : const Color(0xFF1E88E5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
