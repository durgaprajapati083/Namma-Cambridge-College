import 'dart:ui';

import 'package:flutter/material.dart';

class Faculty {
  final String name;
  final String designation;
  final String qualification;
  final String image;
  final List<Icon> socials;

  Faculty({
    required this.name,
    required this.designation,
    required this.qualification,
    required this.image,
    required this.socials,
  });
}

class FacultyScreen extends StatelessWidget {
  FacultyScreen({super.key});

  final List<Faculty> facultyList = [
    Faculty(
      name: "Dr. Anil Verma",
      designation: "Professor & HOD, CSE Core",
      qualification: "PhD, M.Tech (CSE)",
      image: "assets/images/faculty1.jpg",
      socials: [
        Icon(Icons.line_axis),
        Icon(Icons.eighteen_up_rating_outlined),
        Icon(Icons.person),
      ],
    ),
    Faculty(
      name: "Dr. Neha Sharma",
      designation: "Associate Professor",
      qualification: "PhD, M.Tech (CSE)",
      image: "assets/images/faculty2.jpg",
      socials: [
        Icon(Icons.line_axis),
        Icon(Icons.eighteen_up_rating_outlined),
        Icon(Icons.person),
      ],
    ),
    Faculty(
      name: "Mr. Vivek Rathore",
      designation: "Assistant Professor, CSE Core",
      qualification: "M.Tech (CSE)",
      image: "assets/images/faculty3.jpg",
      socials: [
        Icon(Icons.line_axis),
        Icon(Icons.eighteen_up_rating_outlined),
        Icon(Icons.person),
      ],
    ),
    Faculty(
      name: "Ms. Priya Patel",
      designation: "Senior Lecturer, CSE Core",
      qualification: "M.Tech (CSE)",
      image: "assets/images/faculty4.jpg",
      socials: [
        Icon(Icons.line_axis),
        Icon(Icons.eighteen_up_rating_outlined),
        Icon(Icons.person),
      ],
    ),
  ];

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSearchBar(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "All Faculty",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A237E),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: facultyList.length,
                    itemBuilder: (context, index) =>
                        _FacultyCard(faculty: facultyList[index]),
                  ),
                ),
              ],
            ),
          ),
        ],
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
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Faculty",
            style: TextStyle(
              color: Color(0xFF1A237E),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            "Computer Science Engineering · CSE Core",
            style: TextStyle(color: Colors.black45, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, size: 20),
          hintText: "Search faculty...",
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _FacultyCard extends StatelessWidget {
  final Faculty faculty;

  const _FacultyCard({required this.faculty});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => _FacultyDetailScreen(faculty: faculty),
                ),
              ),
              child: Row(
                children: [
                  Hero(
                    tag: faculty.name,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        faculty.image,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 70,
                          height: 70,
                          color: Colors.blue.shade100,
                          child: const Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          faculty.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          faculty.designation,
                          style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          faculty.qualification,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: faculty.socials
                              .map((s) => _buildSocialIcon(s))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Colors.blueGrey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(Icon type) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.blue.shade400,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(type.icon, size: 10),
    );
  }
}

class _FacultyDetailScreen extends StatelessWidget {
  final Faculty faculty;

  const _FacultyDetailScreen({required this.faculty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/campus_bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(color: Colors.black12),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Hero(
                  tag: faculty.name,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(faculty.image),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  faculty.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  faculty.designation,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Biography",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${faculty.name} is a dedicated educator with years of experience in ${faculty.designation}. Specialist in ${faculty.qualification}.",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
