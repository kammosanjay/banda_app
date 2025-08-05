import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdministrationScreen extends StatefulWidget {
  const AdministrationScreen({super.key});

  @override
  State<AdministrationScreen> createState() => _AdministrationScreenState();
}

class _AdministrationScreenState extends State<AdministrationScreen> {
  //
  final List<String> adminItems = [
    'Chancellor',
    'Registrar',
    'Vice Chancellor',
    'Finance Officer',
    'Controller Of Examination',
    'Chief Vigilance Officer',
    'Ombudsperson',
    'Executive Council',
    'Internal Complaint Committee',
    'Academic Leadership',
  ];
  //
  final List<String> adminRoutes = [
    '/chancellor',
    '/registrar',
    '/vice-chancellor',
    '/finance-officer',
    '/controller-of-examination',
    '/chief-vigilance-officer',
    '/ombudsperson',
    '/executive-council',
    '/internal-complaint-committee',
    '/academic-leadership',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 2),
          GridView.builder(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // allow embedding in scroll view
            itemCount: adminItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // ✅ 3 items in one row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1, // adjust for text layout
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final route = adminRoutes[index];
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
                        adminItems[index],
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
