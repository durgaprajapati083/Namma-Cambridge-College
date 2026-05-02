import 'package:flutter/material.dart';

import 'auth_service.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passController = TextEditingController();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Create Your Personal Password", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: _passController,
              decoration: InputDecoration(hintText: "Enter New Password", border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool success = await _auth.updateInitialPassword(_passController.text);
                if (success) {
                  // Navigate to your main CampusSelectionScreen
                  Navigator.pushReplacementNamed(context, '/dashboard');
                }
              },
              child: Text("Update and Continue"),
            )
          ],
        ),
      ),
    );
  }
}