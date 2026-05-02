import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:namma_cambridge/Authentication/reset_password_screen.dart';

import 'auth_service.dart';

class StudentLoginScreen extends StatefulWidget {
  const StudentLoginScreen({super.key});

  @override
  State<StudentLoginScreen> createState() => _StudentLoginScreenState();
}

class _StudentLoginScreenState extends State<StudentLoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

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
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.school,
                        size: 60,
                        color: Color(0xFF4285F4),
                      ),
                    ),
                    const SizedBox(height: 25),

                    const Text(
                      "Welcome Student",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A237E),
                      ),
                    ),
                    const Text(
                      "Login to your student portal",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 40),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _buildTextField(
                                controller: _emailController,
                                hint: "Registered Email/Phone",
                                icon: Icons.person_outline,
                              ),
                              const SizedBox(height: 16),
                              _buildTextField(
                                controller: _passwordController,
                                hint: "Password",
                                icon: Icons.lock_outline,
                                isPassword: true,
                                isVisible: _isPasswordVisible,
                                onToggle: () {
                                  setState(
                                    () => _isPasswordVisible =
                                        !_isPasswordVisible,
                                  );
                                },
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen()));
                                },
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ),
                              const SizedBox(height: 10),

                              GestureDetector(
                                onTap: () async {
                                  // 1. Show a loading indicator (optional but good UI)
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => const Center(child: CircularProgressIndicator()),
                                  );

                                  try {
                                    // 2. USE THE CORRECT CONTROLLER NAMES: _emailController and _passwordController
                                    final user = await _authService.login(
                                      _emailController.text.trim(),
                                      _passwordController.text.trim(),
                                    );

                                    // Close loading indicator
                                    Navigator.pop(context);

                                    if (user != null) {
                                      // 3. Fetch user document from Firestore
                                      DocumentSnapshot userData = await FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(user.uid)
                                          .get();

                                      if (userData.exists) {
                                        // 4. Check the 'isFirstLogin' field we created in the database
                                        // if (userData['isFirstLogin'] == true) {
                                        //   Navigator.pushReplacementNamed(context, '/reset_password_screen');
                                        // } else {
                                          String role = userData['role'];
                                          // Navigate based on role
                                          Navigator.pushNamed(
                                              context,
                                              role == 'student' ? '/dashboard' :  '/faculty_login_screen'
                                          );
                                        // }
                                      }
                                    } else {
                                      // Show error if user is null
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text("Login Failed. Please check your credentials.")),
                                      );
                                    }
                                  } catch (e) {
                                    Navigator.pop(context); // Close loading if error occurs
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Error: ${e.toString()}")),
                                    );
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF64B5F6),
                                        Color(0xFF1E88E5),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue.withOpacity(0.3),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // const Text(
                    //   "Registered Email/Phone",
                    //   style: TextStyle(color: Colors.black45, fontSize: 13),
                    // ),
                    // const SizedBox(height: 10),
                    // // _contactInfo(
                    // //   Icons.email_outlined,
                    // //   "prajapatidurga067@gmail.com",
                    // // ),
                    // const SizedBox(height: 5),
                    // _contactInfo(Icons.phone_outlined, "+91 7054484937"),
                  ],
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "For any issues, please contact us:",
                    style: TextStyle(color: Colors.black45, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _footerContact(
                        Icons.email_outlined,
                        "prajapatidurga067@gmail.com",
                      ),
                      const SizedBox(width: 20),
                      _footerContact(Icons.phone_outlined, "+91 7054484937"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool isVisible = false,
    VoidCallback? onToggle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword && !isVisible,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.indigo.shade300),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    size: 20,
                  ),
                  onPressed: onToggle,
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  Widget _contactInfo(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 18, color: Colors.indigo),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _footerContact(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.indigo),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 12, color: Colors.indigo)),
      ],
    );
  }
}
