import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentCareer extends StatefulWidget {
  const StudentCareer({super.key});

  @override
  State<StudentCareer> createState() => _StudentCareerState();
}

class _StudentCareerState extends State<StudentCareer> {

//
final List<String> studentItems = [
  'Sports facilities',
  'NCC',
  'NSS',
  'Hostel',
  'Placement Cell',
  'Student Grievance Redressal Committee',
  'Health Facilities',
  'Internal Complaint Committee',
  'Anti-Ragging Cell',
  'Equal Opportunity Cell',
  'Socio-Economically Disadvantaged Groups Cell',
];
//
final List<String> studentRoutes = [
  '/sports-facilities',
  '/ncc',
  '/nss',
  '/hostel',
  '/placement-cell',
  '/grievance-redressal-committee',
  '/health-facilities',
  '/internal-complaint-committee',
  '/anti-ragging-cell',
  '/equal-opportunity-cell',
  '/disadvantaged-groups-cell',
];




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 2),
          GridView.builder(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // allow embedding in scroll view
            itemCount: studentItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // ✅ 3 items in one row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1, // adjust for text layout
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final route = studentRoutes[index];
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
                        studentItems[index],
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
