import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AcademicScreen extends StatefulWidget {
  const AcademicScreen({super.key});

  @override
  State<AcademicScreen> createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {
  //
  final List<String> menuItems = [
    'Academic Programs',
    'Academic Calendar',
    'Academics Examinations',
    'Colleges',
    'List of UGC-recognized ODL',
    'Internal Quality Assurance Cell (IQAC)',
    'Library',
    'Academic Collaborations',
  ];
  final List<String> menuRoutes = [
    '/acadProgram',
    '/acadCalender',
    '/acadExaminations',
    '/colleges',
    '/UGC',
    '/IQA',
    '/library',
    '/acadCollaborations',
  ];
  //
  @override
  Widget build(BuildContext context) {
    final isTheme = Theme.of(context).brightness;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 2),
          GridView.builder(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // allow embedding in scroll view
            itemCount: menuItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // ✅ 3 items in one row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1, // adjust for text layout
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final route = menuRoutes[index];
                  context.read<RouteProvider>().navigateTo(route, context);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        menuItems[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
