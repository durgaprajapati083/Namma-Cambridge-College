import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:namma_cambridge/Authentication/reset_password_screen.dart';
import 'package:namma_cambridge/faculty_screens/faculty_dashboard_screen.dart';

import '../../Authentication/auth_service.dart';

class FacultyLoginScreen extends StatefulWidget {
  const FacultyLoginScreen({super.key});

  @override
  State<FacultyLoginScreen> createState() => _FacultyLoginScreenState();
}

class _FacultyLoginScreenState extends State<FacultyLoginScreen> {
  bool _obscureText = true;
  bool _rememberMe = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Faculty Login",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A237E),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Please login to access your faculty portal.",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    const SizedBox(height: 32),

                    _buildTextField(
                      controller: _emailController,
                      hint: "Registered Email/Phone",
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 16),

                    _buildTextField(
                      controller: _passwordController,
                      hint: "Password",
                      icon: Icons.lock_outline,
                      isPassword: true,
                    ),
                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                            //   child: Checkbox(
                            //     value: _rememberMe,
                            //     activeColor: const Color(0xFF5C79FF),
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(4),
                            //     ),
                            //     onChanged: (val) =>
                            //         setState(() => _rememberMe = val!),
                            //   ),
                            // ),
                            // const SizedBox(width: 8),
                            // const Text(
                            //   "Remember Me",
                            //   style: TextStyle(
                            //     fontSize: 13,
                            //     color: Colors.black87,
                            //   ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen()));
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color(0xFF5C79FF),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () async {
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
                                      role == 'faculty' ? '/faculty_dashboard' : '/student_login_screen'
                                  );
                                }
                              } else {
                                // Show error if user is null
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Login Failed. Please check your credentials.")),
                                );
                              }
                            } catch (e) {
                              Navigator.pop(
                                  context); // Close loading if error occurs
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("Error: ${e.toString()}")),
                              );
                            }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5C79FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    const Text(
                      "For assistance, please contact admin@college.edu",
                      style: TextStyle(color: Colors.black45, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                "For assistance, please contact admin@college.edu",
                style: TextStyle(color: Color(0xFF1A237E), fontSize: 11),
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
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? _obscureText : false,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
          prefixIcon: Icon(icon, color: const Color(0xFF1A237E), size: 20),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black38,
                    size: 20,
                  ),
                  onPressed: () => setState(() => _obscureText = !_obscureText),
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
