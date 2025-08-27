import 'dart:async';

import 'package:flutter/material.dart';
import 'package:baanda_mobile_app/Views/ReportsPage/report_provider.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:provider/provider.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  // StreamController<List<Map<String, dynamic>>> streamController =
  //     StreamController<List<Map<String, dynamic>>>();

  void initState() {
    super.initState();
    // Fetch data once the widget is loaded
    // Future.delayed(Duration.zero, () {
    //   context.read<ReportProvider>().fetchReport();
    // });
  }

  List<String> imageList = [
    "https://buat.edu.in/wp-content/uploads/2025/07/WhatsApp-Image-2025-07-07-at-2.49.11-PM.jpeg",
    "https://buat.edu.in/wp-content/uploads/2023/02/DSC_7909-min-scaled.jpg",
    "https://buat.edu.in/wp-content/uploads/2025/07/DSC_7891.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFe7f3ff),
      body: Column(
        children: [
          // Expanded(
          //   child: Consumer<ReportProvider>(
          //     builder: (context, reportProvider, child) {
          //       if (reportProvider != null) {
          //         return ListView.builder(
          //           itemCount: reportProvider.getList.length,
          //           itemBuilder: (BuildContext context, int index) {
          //             return ListTile(
          //               leading: Text(
          //                 reportProvider.getList[index]['id'].toString(),
          //               ),
          //               title: Text(reportProvider.getList[index]['title']),
          //             );
          //           },
          //         );
          //       }
          //       return Container();
          //     },
          //   ),
          // ),

          // ElevatedButton(
          //   onPressed: () {
          //     context.read<ReportProvider>().insertData();
          //   },
          //   child: Text("insert"),
          // ),
          GFCarousel(
            items: imageList
                .map((e) => Image.network(e, fit: BoxFit.cover))
                .toList(),
                aspectRatio: 16/9,
                
                viewportFraction: 1,
                autoPlayCurve: Curves.fastOutSlowIn,
            height: 200,
            autoPlay: true,
            autoPlayInterval: Duration(seconds:2),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
          ),
        ],
      ),
    );
  }
}
