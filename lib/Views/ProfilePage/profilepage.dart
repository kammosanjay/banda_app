import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  Map<String, dynamic> usersInfo = {
    "Name": "John Doe",
    "Email": "testing@gmail.com",
    "Phone": "123-456-7890",
    "Address": "123 Main St, City, Country",
    "Department": "Computer Science",
    "Institute/Faculty": "Engineering",
    "Program": "Bachelor of Technology",
    "Degree": "B.Tech",
    "Campus": "Main Campus",
    "Entrance Roll No": "123456789",
    "Exam Roll No": "987654321",
    "Enrollment No": "ENR2023001",
    "Addmission Year": "2023",
    "Academic Year": "2023-2024",
    "Current Semester": "5th Semester",
  };

  /// Example user data
  userProfile(Map<String, dynamic> userData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            usersInfo.entries.map((e) => '${e.key}').join('\n'),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          // SizedBox(width: 50),
          Text(
            usersInfo.entries.map((e) => '${e.value}').join('\n'),
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 80,
            child: Image.asset("assets/images/bandabg.png"),
          ),
          // userProfile(usersInfo),
          userProfile(usersInfo),
        ],
      ),
    );
  }
}
