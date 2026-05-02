import 'package:flutter/material.dart';

class InternshipProjectScreen extends StatefulWidget {
  const InternshipProjectScreen({super.key});

  @override
  State<InternshipProjectScreen> createState() => _InternshipProjectScreenState();
}

class _InternshipProjectScreenState extends State<InternshipProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Internship/Project Screen"),
      ),
    );
  }
}
