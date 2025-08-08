import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/Views/language/language.dart';
import 'package:baanda_mobile_app/Views/screenListView/aboutHEI.dart';
import 'package:baanda_mobile_app/Views/screenListView/academic.dart';
import 'package:baanda_mobile_app/Views/screenListView/administration.dart';
import 'package:baanda_mobile_app/Views/screenListView/admissionFee.dart';
import 'package:baanda_mobile_app/Views/screenListView/alumni.dart';
import 'package:baanda_mobile_app/Views/screenListView/announement.dart';
import 'package:baanda_mobile_app/Views/screenListView/emergency.dart';
import 'package:baanda_mobile_app/Views/screenListView/gallery.dart';
import 'package:baanda_mobile_app/Views/screenListView/information.dart';
import 'package:baanda_mobile_app/Views/screenListView/research.dart';
import 'package:baanda_mobile_app/Views/screenListView/studentCareer.dart';
import 'package:baanda_mobile_app/Views/theme/theme_provider.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:provider/provider.dart';

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
    Alumni(),
    Information(),
    Emergency(),
    Gallery(),
    AboutHei(),
  ];
  List<IconData> drawerMenuIcons = [
    Icons.announcement, // Announcements
    Icons.school, // Academic
    Icons.account_balance, // Administration
    Icons.payment, // Admissions & Fee
    Icons.science, // Research
    Icons.work, // Student Career
    Icons.group, // Alumni
    Icons.info, // Information Corner
    Icons.emergency, // Emergency Contact
    Icons.photo_library, // Gallery
    Icons.info_outline, // About HEI
  ];

  final ScrollController _scrollController = ScrollController();

  final List<String> imageList = [
    "assets/svgImages/menu.svg",
    "assets/svgImages/customer-service.svg",
    "assets/svgImages/leave.svg",
    "assets/svgImages/about.svg",
    "assets/svgImages/mode.svg",
    "assets/svgImages/policy.svg",
  ];
  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      body: Row(
        children: [
          /// LEFT MENU
          Expanded(
            child: GridView.builder(
              itemCount: drawerMenuItems.length,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    final route = drawerMenuItems[index];
                    context.read<RouteProvider>().navigateTo(route, context);
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(drawerMenuIcons[index]),
                            Text(
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
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // / RIGHT VIEW
          // Expanded(
          //   child: AnimatedSwitcher(
          //     duration: Duration(milliseconds: 300),
          //     child: contentViews[selectedIndex],
          //   ),
          // ),
        ],
      ),
    );
  }
}
