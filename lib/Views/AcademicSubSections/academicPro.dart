import 'dart:io';

import 'package:baanda_mobile_app/Views/home/home_providers.dart';
import 'package:baanda_mobile_app/Views/language/language.dart';
import 'package:baanda_mobile_app/Views/theme/theme_provider.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/constant/constant_widget.dart';
import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AcademicProgramScreen extends StatefulWidget {
  const AcademicProgramScreen({super.key});

  @override
  State<AcademicProgramScreen> createState() => _AcademicProgramScreenState();
}

class _AcademicProgramScreenState extends State<AcademicProgramScreen> {
  //
  List<String> acadlist = [
    'Undergraduate Programmes',
    'Postgraduate Programmes',
    'Postgraduate Diploma',
    'Doctoral Programmes',
  ];

  List<String> courseList = [
    "Economics",
    'Informatics',
    'siesmographic',
    'pyrologic',
    'mechanics',
  ];
  List<String> searchedList=[];
  //
  TextEditingController searchContrll = TextEditingController();
  String? searchedText;

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Color(0xFFe7f3ff),

      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
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

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // allow embedding in scroll view
              itemCount: acadlist.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // final route = menuRoutes[index];
                    // context.read<RouteProvider>().navigateTo(route, context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.indigo.shade100,
                      ),
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
                      child: Center(
                        child: Text(
                          acadlist[index],
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomWidgets.customTextFeild(
              context: context,
              label: 'Search Courses',
              hintfontSize: 14,
              hintfontWeight: FontWeight.normal,
              fontwgt: FontWeight.bold,
              headingcolor: AppColor.textColor(context),
              hint: 'Search Courses here...',
              onChanges: (value) {
                print("User typed: $value");
              },
              hintColor: Theme.of(context).colorScheme.secondary,
              controller: searchContrll,
              keyboardtype: TextInputType.emailAddress,
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,

              scrollDirection: Axis.vertical,

              itemCount: courseList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text('${index + 1}'),
                  title: Text(courseList[index]),
                  trailing: TextButton(
                    onPressed: () {},
                    child: Text('view${index + 1}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
