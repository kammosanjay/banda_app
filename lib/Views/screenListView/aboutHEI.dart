import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutHei extends StatefulWidget {
  const AboutHei({super.key});

  @override
  State<AboutHei> createState() => _AboutHeiState();
}

class _AboutHeiState extends State<AboutHei> {
  //
  final List<String> aboutItems = [
  'About University',
  'Act-and-Statutes',
  'Institutional Development Plan',
  'Affiliated University / College',
  'Accreditation/ Ranking Status',
  'Recognition / Approval',
  'Annual Reports',
  'Accounting',
  'Sponsoring Body',
];
//
final List<String> aboutRoutes = [
  '/about-university',
  '/act-and-statutes',
  '/institutional-development-plan',
  '/affiliated-university',
  '/accreditation-ranking-status',
  '/recognition-approval',
  '/annual-reports',
  '/accounting',
  '/sponsoring-body',
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
            itemCount: aboutItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // ✅ 3 items in one row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1, // adjust for text layout
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final route = aboutRoutes[index];
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
                        aboutItems[index],
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