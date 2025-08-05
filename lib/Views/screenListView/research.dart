import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Research extends StatefulWidget {
  const Research({super.key});

  @override
  State<Research> createState() => _ResearchState();
}

class _ResearchState extends State<Research> {
  //
  final List<String> researchItems = [
    'Research And Development Cell',
    'Incubation Centre/ Start-ups / Entrepreneurship Cell',
    'Central facilities',
  ];
  //
  final List<String> researchRoutes = [
    '/research-development-cell',
    '/incubation-entrepreneurship-cell',
    '/central-facilities',
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
            itemCount: researchItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // ✅ 3 items in one row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1, // adjust for text layout
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final route = researchRoutes[index];
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
                        researchItems[index],
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
