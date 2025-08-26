import 'package:baanda_mobile_app/constant/constant_widget.dart';
import 'package:file_picker/file_picker.dart';
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
  FilePickerResult? _filePickerResult;

  _pickedImg(){
    FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    ).then((result) {
      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        print('Selected file: ${file.name}, size: ${file.size} bytes');
      } else {
        print('No file selected.');
      }
    }).catchError((error) {
      print('Error picking file: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: Center(
        child: ListView(
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
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade100,
                        radius: 80,

                        child: Icon(
                          Icons.person_2_outlined,
                          size: 100,
                          color: Colors.grey,
                        ),
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
                    onTap: () {},
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
              Map<String, dynamic>.from(usersInfo)
                ..removeWhere((key, value) =>
                    key == "Name" ||
                    key == "Email" ||
                    key == "Phone" ||
                    key == "Address"),
            ),
           
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
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: CustomWidgets.customButton(
                      context: context,
                      buttonName: 'Update Email',

                      fontWeight: FontWeight.w600,
                      btnColor: Colors.amber,
                      onPressed: () {},
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
