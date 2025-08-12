import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/Views/language/language.dart';
import 'package:baanda_mobile_app/Views/theme/theme_provider.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
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
  final List<String> imageList = [
    "assets/svgImages/menu.svg",
    "assets/svgImages/customer-service.svg",
    "assets/svgImages/leave.svg",
    "assets/svgImages/about.svg",
    "assets/svgImages/mode.svg",
    "assets/svgImages/policy.svg",
  ];
  final List<IconData> officerIcons = [
    Icons.account_circle, // Chancellor
    Icons.assignment_ind, // Registrar
    Icons.person, // Vice Chancellor
    Icons.account_balance_wallet, // Finance Officer
    Icons.fact_check, // Controller Of Examination
    Icons.shield, // Chief Vigilance Officer
    Icons.gavel, // Ombudsperson
    Icons.groups, // Executive Council
    Icons.report_problem, // Internal Complaint Committee
    Icons.school, // Academic Leadership
  ];

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Color(0xFFe7f3ff),
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

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GridView.builder(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // allow embedding in scroll view
            itemCount: adminItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              crossAxisCount: 3, // adjust for text layout
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final route = adminRoutes[index];
                  context.read<RouteProvider>().navigateTo(route, context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.indigo.shade100),
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFFc0e6de),
                    gradient: LinearGradient(
                      colors: [
                        Colors.yellow.shade100,
                        Colors.green.shade100,
                        Colors.blue.shade100,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      // center: Alignment.center,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(officerIcons[index]),
                        Text(
                          adminItems[index],
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
        ),
      ),
    );
  }
}
