import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Admissionfee extends StatefulWidget {
  const Admissionfee({super.key});

  @override
  State<Admissionfee> createState() => _AdmissionfeeState();
}

class _AdmissionfeeState extends State<Admissionfee> {
  //
  final List<String> feeItems = [
  'Prospectus',
  'Admission Process And Guidelines',
  'Fee Submission',
  'Fee Refund Policy',
];
//
final List<String> feeRoutes = [
  '/prospectus',
  '/admission-guidelines',
  '/fee-submission',
  '/fee-refund-policy',
];

  @override
  Widget build(BuildContext context) {

    return  Scaffold(body:  ListView(
        children: [
          SizedBox(height: 2),
          GridView.builder(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // allow embedding in scroll view
            itemCount: feeItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // ✅ 3 items in one row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1, // adjust for text layout
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final route = feeRoutes[index];
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
                        feeItems[index],
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