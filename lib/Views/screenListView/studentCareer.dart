import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/Views/language/language.dart';
import 'package:baanda_mobile_app/Views/theme/theme_provider.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
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
  final List<IconData> studentIcons = [
  Icons.sports_soccer,       // Sports facilities
  Icons.military_tech,       // NCC
  Icons.volunteer_activism,  // NSS
  Icons.bed,                 // Hostel
  Icons.work,                // Placement Cell
  Icons.forum,               // Student Grievance Redressal Committee
  Icons.local_hospital,      // Health Facilities
  Icons.report_problem,      // Internal Complaint Committee
  Icons.no_accounts,         // Anti-Ragging Cell
  Icons.diversity_3,         // Equal Opportunity Cell
  Icons.groups_2,            // Socio-Economically Disadvantaged Groups Cell
];

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
      appBar: AppBar(
        // backgroundColor: AppColor.primaryColor(context),
        title: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return Text(
              appLoc.welcome,
              // style: GoogleFonts.poppins(
              //   textStyle: Theme.of(context).textTheme.bodyLarge,

              // ),
            );
          },
        ),
        // leading: Builder(
        //   builder: (context) {
        //     return GestureDetector(
        //       onTap: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       child: Container(
        //         margin: const EdgeInsets.only(top: 10),

        //         child: GFCarousel(
        //           autoPlay: true,

        //           autoPlayInterval: Duration(seconds: 2),
        //           // autoPlayAnimationDuration: Duration(milliseconds: 1600),
        //           items: imageList.map((url) {
        //             return ClipRRect(
        //               child: SvgPicture.asset(
        //                 url,
        //                 fit: BoxFit.contain,
        //                 height: 20,
        //                 width: 20,
        //                 color: AppColor.headingColor(context),
        //               ),
        //             );
        //           }).toList(),
        //           onPageChanged: (index) {
        //             // setState(() {
        //             //   index;
        //             // });
        //           },
        //         ),
        //       ),
        //     );
        //   },
        // ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: AppColor.primaryColor(context),
                      title: const Text("Language"),
                      content: DropdownButton<String>(
                        alignment: Alignment(0, 10),
                        autofocus: true,
                        dropdownColor: AppColor.primaryColor(context),
                        icon: Icon(Icons.language_outlined),
                        menuWidth: 110.0,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        value: context
                            .watch<Language>()
                            .selectectLocale
                            .languageCode,
                        items: Language.languages
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e['locale'],
                                child: Text(e['name']),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            context.read<Language>().changeLanguage(value);
                            print(value);
                            Navigator.pop(context);
                          }
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Close"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: 10,
                      // spreadRadius: 5,
                      offset: Offset(10, 5),
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/svgImages/lang.svg',
                  height: 20,
                  width: 20,
                  color: AppColor.headingColor(context),
                ),
              ),
            ),
          ),
        ],
      ),

      body: ListView(
        children: [
          SizedBox(height: 2),
          GridView.builder(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // allow embedding in scroll view
            itemCount: studentItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // ✅ 3 items in one row
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
                  color: AppColor.primaryColor(context),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(studentIcons[index]),
                        Text(
                          studentItems[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
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
