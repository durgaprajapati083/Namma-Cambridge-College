import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:namma_cambridge/features/splash/presentation/info/about_cit_screen.dart';
import 'package:namma_cambridge/features/splash/presentation/screens/dashboard_screen.dart';

class ApplyAdmissionScreen extends StatefulWidget {
  const ApplyAdmissionScreen({super.key});

  @override
  State<ApplyAdmissionScreen> createState() => _ApplyAdmissionScreenState();
}

class _ApplyAdmissionScreenState extends State<ApplyAdmissionScreen> {
  String selectedCourse = "CSE - Core";
  final List<String> courses = [
    "CSE - Core",
    "CSE - AI/ML",
    "CSE - Cyber Security",
    "ECE",
    "ME",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Apply for Admission",
          style: TextStyle(
            color: Color(0xFF1A237E),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A237E)),
          onPressed: () => Navigator.pop(context),
        ),
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: _GlassCard(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCampusSelector(),
                      const SizedBox(height: 20),

                      const Text(
                        "Admission Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 15),
                      _buildTextField("Full Name", Icons.person_outline),
                      _buildTextField(
                        "Phone Number",
                        Icons.phone_outlined,
                        keyboardType: TextInputType.phone,
                      ),
                      _buildTextField(
                        "Email",
                        Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      _buildDropdown(),
                      const SizedBox(height: 15),

                      const Text(
                        "* Upload 12th Marksheet (PDF)",
                        style: TextStyle(color: Colors.red, fontSize: 13),
                      ),
                      const SizedBox(height: 8),
                      _buildFilePicker(),

                      const SizedBox(height: 25),

                      const Text(
                        "Payment Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 15),
                      _buildTextField("Card Number", Icons.credit_card),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              "MM/YY",
                              Icons.calendar_today_outlined,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _buildTextField(
                              "CVV",
                              Icons.lock_outline,
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),

                      _buildPaymentLogos(),

                      const SizedBox(height: 30),

                      _buildPayButton(),

                      const SizedBox(height: 10),
                      const Center(
                        child: Text(
                          "A ₹1,000 application fee will be charged.",
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCampusSelector() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.apartment, color: Colors.blueAccent, size: 30),
          const SizedBox(width: 15),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CIT Main Campus",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Auto-selected ✓",
                style: TextStyle(color: Colors.green, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String hint,
    IconData icon, {
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          filled: true,
          fillColor: Colors.blue.withOpacity(0.05),
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.school_outlined, color: Colors.blueAccent, size: 22),
          const SizedBox(width: 12),

          const Text(
            "Choose Course",
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedCourse,
                isExpanded: true,
                alignment: Alignment.centerRight,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.blueAccent,
                  size: 25,
                ),
                style: const TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                items: courses.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (val) => setState(() => selectedCourse = val!),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilePicker() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          children: [
            Icon(Icons.description_outlined, color: Colors.blueAccent),
            SizedBox(width: 10),
            Text("Choose File", style: TextStyle(color: Colors.black54)),
            Spacer(),
            Text(
              "No file chosen",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentLogos() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/VISA-logo.png', width: 40),
          const SizedBox(width: 15),
          Image.asset('assets/images/Rupay-Logo.png', width: 35),
          const SizedBox(width: 15),
          Image.asset('assets/images/upi.png', width: 60),
        ],
      ),
    );
  }

  Widget _buildPayButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5D9BFF),
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
      ),
      child: const Text(
        "Pay & Confirm Admission",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _GlassCard extends StatelessWidget {
  final Widget child;

  const _GlassCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: child,
        ),
      ),
    );
  }
}
