import 'package:baanda_mobile_app/Views/screenListView/aboutHEI.dart';
import 'package:baanda_mobile_app/Views/screenListView/academic.dart';
import 'package:baanda_mobile_app/Views/screenListView/administration.dart';
import 'package:baanda_mobile_app/Views/screenListView/admissionFee.dart';
import 'package:baanda_mobile_app/Views/screenListView/announement.dart';
import 'package:baanda_mobile_app/Views/screenListView/information.dart';
import 'package:baanda_mobile_app/Views/screenListView/research.dart';
import 'package:baanda_mobile_app/Views/screenListView/studentCareer.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:flutter/material.dart';

class BandaHomePage extends StatefulWidget {
  @override
  _BandaHomePageState createState() => _BandaHomePageState();
}

class _BandaHomePageState extends State<BandaHomePage> {
  int selectedIndex = 0;

  List<String> drawerMenuItems = [
    'Announcements',
    'Academic',
    'Administration',
    'Admissions & Fee',
    'Research',
    'Student Career',
    'Alumni',
    'Information Corner',
    'Emergency Contact',
    'Gallery',
    'About HEI',
  ];

  final List<Widget> contentViews = [
    NotificationScreen(),
    AcademicScreen(),
    AdministrationScreen(),
    Admissionfee(),
    Research(),
    StudentCareer(),
    Center(child: Container(color: Colors.purple)),
    Information(),
    Center(child: Container(color: Colors.purpleAccent)),
    Center(child: Container(color: Colors.deepOrange)),
    AboutHei(),
  ];
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          /// LEFT MENU
          SizedBox(
            width: 80,
            height: double.infinity,
            child: ListView.builder(
              itemCount: drawerMenuItems.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Card(
                    color: isSelected
                        ? Colors.deepPurple.shade100
                        : Color(0xFFeffdff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        height: 60,
                        child: Center(
                          child: Text(
                            drawerMenuItems[index],
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? Colors.deepPurple
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          /// RIGHT VIEW
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: contentViews[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
