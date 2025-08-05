import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  //
  final List<String> miscItems = [
  'RTI',
  'Circulars And Notices',
  'Announcements',
  'Newsletters',
  'Recent Events & Achievements',
  'Job openings',
  'Reservation Roster',
  'Study in India',
  'Admission Procedure And Facilities',
];
//
final List<String> miscRoutes = [
  '/rti',
  '/circulars-notices',
  '/announcements',
  '/newsletters',
  '/recent-events-achievements',
  '/job-openings',
  '/reservation-roster',
  '/study-in-india',
  '/admission-procedure-facilities',
];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:ListView(
        children: [
          SizedBox(height: 2),
          GridView.builder(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // allow embedding in scroll view
            itemCount: miscItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // ✅ 3 items in one row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1, // adjust for text layout
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final route = miscRoutes[index];
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
                        miscItems[index],
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
      ) ,
    );
  }
}