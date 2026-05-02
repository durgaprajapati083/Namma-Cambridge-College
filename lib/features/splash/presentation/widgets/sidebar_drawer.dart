import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namma_cambridge/features/splash/presentation/screens/campus_selection_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/specialization/specialization_screen.dart';

class SidebarDrawer extends StatelessWidget {
  const SidebarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0D1B3E),
      child: Column(
        children: [
          const SizedBox(height: 50),
          const ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/profile.jpeg'),
            ),
            title: Text(
              "Durga Prajapati",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "CSE Core | Sem 3",
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white54,
              size: 14,
            ),
          ),
          const Divider(color: Colors.white12, indent: 15, endIndent: 15),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                _buildTile(
                  context,
                  Icons.home_outlined,
                  "Dashboard",
                  isSelected: true,
                ),
                _buildTile(context, Icons.person_outline, "My Profile"),
                _buildTile(
                  context,
                  Icons.calendar_month_outlined,
                  "Attendance",
                ),
                _buildTile(
                  context,
                  Icons.event_note_outlined,
                  "Exam Timetable",
                ),
                _buildTile(context, Icons.edit_document, "Course Registration"),
                _buildTile(
                  context,
                  Icons.assignment_turned_in_outlined,
                  "Exam Application",
                ),
                _buildTile(
                  context,
                  Icons.group_work_outlined,
                  "Project / Internship",
                ),
                _buildTile(context, Icons.computer_outlined, "Online Exam"),
                _buildTile(context, Icons.grade_outlined, "Exam Result"),
                _buildTile(
                  context,
                  Icons.history_edu_outlined,
                  "Photocopy History",
                ),
                _buildTile(
                  context,
                  Icons.refresh_outlined,
                  "Revaluation History",
                ),
                _buildTile(
                  context,
                  Icons.verified_outlined,
                  "Challenge Revaluation",
                ),
                _buildTile(
                  context,
                  Icons.school_outlined,
                  "I-Grade Application",
                ),
                _buildTile(
                  context,
                  Icons.support_agent_outlined,
                  "Ticket Support",
                ),
                _buildTile(
                  context,
                  Icons.logout,
                  "Logout",
                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(
                      Icons.confirmation_num_outlined,
                      color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Ticket Support",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(
    BuildContext context,
    IconData icon,
    String title, {
    bool isSelected = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white.withOpacity(0.15) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -3),
        leading: Icon(icon, color: Colors.white, size: 20),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white24,
          size: 12,
        ),
        onTap: ()async {
          if (title == 'Logout') {
            SnackBar(content: Text("User Logging out...."));
            await FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const CampusSelectionScreen()),
                  (Route<dynamic> route) => false,
            );
          }
        },
      ),
    );
  }
}
