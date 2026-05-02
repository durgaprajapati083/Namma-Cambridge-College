import 'package:flutter/material.dart';

class OnlineExamScreen extends StatefulWidget {
  const OnlineExamScreen({super.key});

  @override
  State<OnlineExamScreen> createState() => _OnlineExamScreenState();
}

class _OnlineExamScreenState extends State<OnlineExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online Exam Screen"),
      ),
    );
  }
}
