import 'dart:io';

import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/Views/home/home_providers.dart';
import 'package:baanda_mobile_app/Views/screenListView/update_email.dart';
import 'package:baanda_mobile_app/Views/screenListView/updatephone.dart';
import 'package:baanda_mobile_app/constant/constant_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  Map<String, IconData> usersInfoIcons = {
    "Name": Icons.person,
    "Email": Icons.email,
    "Phone": Icons.phone,
    "Address": Icons.home,
    "Department": Icons.school,
    "Institute/Faculty": Icons.account_balance,
    "Program": Icons.book,
    "Degree": Icons.grade,
    "Campus": Icons.location_city,
    "Entrance Roll No": Icons.confirmation_number,
    "Exam Roll No": Icons.how_to_reg,
    "Enrollment No": Icons.assignment_ind,
    "Addmission Year": Icons.calendar_today,
    "Academic Year": Icons.calendar_view_month,
    "Current Semester": Icons.menu_book,
  };

  /// Example user data
  userProfile(Map<String, dynamic> userData) {
    return Column(
      children: userData.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
          child: Row(
            children: [
              Icon(usersInfoIcons[entry.key], size: 20, color: Colors.blueGrey),

              SizedBox(width: 10),

              Expanded(
                flex: 2,
                child: Text(
                  entry.key,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),

              Expanded(
                flex: 3,
                child: Text(
                  entry.value.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      

      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Row(
                    children: [
                      Consumer(
                        builder: (ctx, value, child) {
                          final imagePath = ctx
                              .watch<HomeProviders>()
                              .image
                              ?.path;
                          return imagePath != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: Image.file(
                                    File(imagePath),
                                    fit: BoxFit.cover,
                                    height: 140,
                                    width: 140,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.grey.shade200,
                                  radius: 80,
                                  child: Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                );
                        },
                      ),
                      SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              usersInfo['Name'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              usersInfo['Email'],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              usersInfo['Phone'],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              usersInfo['Address'],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: 150,
                  left: 0,
                  right: 100,
                  child: GestureDetector(
                    onTap: () {
                      context.read<HomeProviders>().pickImage();
                    },
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 30,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            userProfile(
              Map<String, dynamic>.from(usersInfo)..removeWhere(
                (key, value) =>
                    key == "Name" ||
                    key == "Email" ||
                    key == "Phone" ||
                    key == "Address",
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: CustomWidgets.customButton(
                      context: context,
                      buttonName: 'Update Phone Number',

                      fontWeight: FontWeight.w600,
                      btnColor: Colors.amber,
                      onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Updatephone(),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomWidgets.customButton(
                      context: context,
                      buttonName: 'Update Email',

                      fontWeight: FontWeight.w600,
                      btnColor: Colors.amber,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateEmail(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
