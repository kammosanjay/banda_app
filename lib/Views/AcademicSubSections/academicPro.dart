import 'dart:io';

import 'package:baanda_mobile_app/Views/home/home_providers.dart';
import 'package:baanda_mobile_app/Views/language/language.dart';
import 'package:baanda_mobile_app/Views/theme/theme_provider.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
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
  final List<String> imageList = [
    "assets/svgImages/menu.svg",
    "assets/svgImages/customer-service.svg",
    "assets/svgImages/leave.svg",
    "assets/svgImages/about.svg",
    "assets/svgImages/mode.svg",
    "assets/svgImages/policy.svg",
  ];
  //
  Future<void> aboutUs() async {
    if (!await launchUrl(
      Uri.parse("https://www.softgentech.com/aboutus/"),
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch URL');
    }
  }

  Future<void> privacyPolicy() async {
    if (!await launchUrl(
      Uri.parse("https://www.softgentech.com/aboutus/"),
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch URL');
    }
  }

  Future<void> termsAndcdtn() async {
    if (!await launchUrl(
      Uri.parse("https://www.softgentech.com/aboutus/"),
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch URL');
    }
  }

  Future<void> contactUs() async {
    if (!await launchUrl(
      Uri.parse("https://www.softgentech.com/contact-us/"),
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch URL');
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      drawer: SafeArea(
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return Drawer(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: AppColor.primaryColor(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    DrawerHeader(
                      child: Stack(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 50,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              child: Consumer(
                                builder: (ctx, value, child) {
                                  final imagePath = ctx
                                      .watch<HomeProviders>()
                                      .image
                                      ?.path;
                                  return imagePath != null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                          child: Image.file(
                                            File(imagePath),
                                            fit: BoxFit.cover,
                                            height: 80,
                                            width: 80,
                                          ),
                                        )
                                      : Icon(
                                          Icons.person,
                                          size: 50,
                                          color: Colors.grey,
                                        );
                                },
                              ),
                            ),
                          ),

                          Positioned(
                            left: 100,
                            right: 15,

                            bottom: 60,
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Select Image"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            leading: Icon(Icons.camera_alt),
                                            title: Text("Gallery"),
                                            onTap: () {
                                              // context
                                              //     .read<HomeProviders>()
                                              //     .pickImage();
                                              context
                                                  .read<HomeProviders>()
                                                  .pickImage();
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.photo_library),
                                            title: Text("Camera"),
                                            onTap: () {
                                              context
                                                  .read<HomeProviders>()
                                                  .pickImageFromCamera();
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: SvgPicture.asset(
                                'assets/svgImages/camera.svg',
                                height: 20,
                                width: 20,
                                color: AppColor.headingColor(context),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),
                          Positioned(
                            left: 40,
                            right: 30,
                            top: 100,
                            bottom: 10,
                            child: Text(
                              appLoc.welcome,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      spacing: 2,
                      children: [
                        ListTile(
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Theme Mode',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Image.asset(
                                "assets/images/night.png",
                                scale: 1,
                                height: 25,
                                color: AppColor.headingColor(context),
                              ),
                            ],
                          ),

                          style: ListTileStyle.list,
                          tileColor: AppColor.backgroundColor(context),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                final currentMode = themeProvider.themeMode;

                                return AlertDialog(
                                  title: Text(
                                    'Select Theme',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                  content: SizedBox(
                                    height: 200,
                                    width: 200,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RadioListTile<ThemeMode>(
                                          title: Text(
                                            'Light',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium,
                                          ),
                                          value: ThemeMode.light,
                                          groupValue: currentMode,
                                          onChanged: (value) {
                                            print("selectedTheme is :$value");
                                            if (value != null) {
                                              themeProvider.setThemeMode(value);
                                              Navigator.pop(context);
                                            }
                                          },
                                        ),
                                        RadioListTile<ThemeMode>(
                                          title: Text(
                                            'Dark',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium,
                                          ),
                                          value: ThemeMode.dark,
                                          groupValue: currentMode,
                                          onChanged: (value) {
                                            if (value != null) {
                                              print("selectedTheme is :$value");
                                              themeProvider.setThemeMode(value);
                                              Navigator.pop(context);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),

                        ListTile(
                          // title: Text(appLoc.contact_us),
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                appLoc.contact_us,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SvgPicture.asset(
                                "assets/svgImages/customer-service.svg",
                                color: AppColor.headingColor(context),
                              ),
                            ],
                          ),
                          tileColor: AppColor.backgroundColor(context),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onTap: () {
                            // context.read<HomeProvider>().logout();
                            contactUs();
                            // Navigator.pop(context);
                          },
                        ),

                        ListTile(
                          // title: Text(appLoc.feedback),
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                appLoc.feedback,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SvgPicture.asset(
                                "assets/svgImages/feedback-review.svg",
                                color: AppColor.headingColor(context),
                              ),
                            ],
                          ),
                          tileColor: AppColor.backgroundColor(context),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onTap: () {
                            // Show contact us dialog or navigate to contact page

                            // Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          // title: Text(appLoc.support),
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Leave Request",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SvgPicture.asset(
                                "assets/svgImages/wheelchair-sleeping.svg",
                                color: AppColor.headingColor(context),
                              ),
                            ],
                          ),
                          tileColor: AppColor.backgroundColor(context),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onTap: () {
                            // Show help dialog or navigate to help page
                            // Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          // title: Text(appLoc.about_us),
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                appLoc.about_us,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SvgPicture.asset(
                                "assets/svgImages/about.svg",
                                color: AppColor.headingColor(context),
                              ),
                            ],
                          ),
                          tileColor: AppColor.backgroundColor(context),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onTap: () {
                            // Show settings dialog or navigate to settings page
                            // Navigator.pop(context);
                            aboutUs();
                          },
                        ),

                        ListTile(
                          // title: Text(appLoc.privacy_policy),
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                appLoc.privacy_policy,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SvgPicture.asset(
                                "assets/svgImages/policy.svg",
                                color: AppColor.headingColor(context),
                              ),
                            ],
                          ),
                          tileColor: AppColor.backgroundColor(context),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onTap: () {
                            // Show feedback dialog or navigate to feedback page
                            // Navigator.pop(context);
                            privacyPolicy();
                          },
                        ),
                        ListTile(
                          // title: Text(appLoc.terms_and_conditions),
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                appLoc.terms_and_conditions,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SvgPicture.asset(
                                "assets/svgImages/termsConditions.svg",
                                color: AppColor.headingColor(context),
                              ),
                            ],
                          ),
                          tileColor: AppColor.backgroundColor(context),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onTap: () {
                            // Show terms and conditions dialog or navigate to terms page
                            // Navigator.pop(context);
                            termsAndcdtn();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        //  DrawerButtonIcon(
        // elevation: 5,
        // child: ListView(
        //   children: [
        //     DrawerHeader(
        //       child: Text(appLoc.welcome),
        //       decoration: BoxDecoration(color: AppColor.primaryColor),
        //     ),
        //     ListTile(
        //       title: Text("appLoc.changeTheme"),
        //       onTap: () {
        //         // context.read<ThemeProvider>().toggleTheme();
        //         Navigator.pop(context);
        //       },
        //     ),
        //     ListTile(
        //       title: Text("appLoc.changeLanguage"),
        //       onTap: () {
        //         // This will be handled by the dropdown in the app bar
        //         Navigator.pop(context);
        //       },
        //     ),
        //   ],
        // ),
        // ),
      ),

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
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10),

                child: GFCarousel(
                  autoPlay: true,

                  autoPlayInterval: Duration(seconds: 2),
                  // autoPlayAnimationDuration: Duration(milliseconds: 1600),
                  items: imageList.map((url) {
                    return ClipRRect(
                      child: SvgPicture.asset(
                        url,
                        fit: BoxFit.contain,
                        height: 20,
                        width: 20,
                        color: AppColor.headingColor(context),
                      ),
                    );
                  }).toList(),
                  onPageChanged: (index) {
                    // setState(() {
                    //   index;
                    // });
                  },
                ),
              ),
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
          // PopupMenuButton(
          //   itemBuilder: (context) {
          //     return [
          //       PopupMenuItem(
          //         child: Text("appLoc.changeTheme"),
          //         onTap: () {
          //           // context.read<ThemeProvider>().toggleTheme();
          //         },
          //       ),
          //       PopupMenuItem(
          //         child: Text("appLoc.changeLanguage"),
          //         onTap: () {
          //           // This will be handled by the dropdown below
          //         },
          //       ),
          //     ];
          //   },
          // ),
          // Theme(
          //   data: Theme.of(context).copyWith(
          //     inputDecorationTheme: const InputDecorationTheme(
          //       border: InputBorder.none,
          //       enabledBorder: InputBorder.none,
          //       focusedBorder: InputBorder.none,
          //       disabledBorder: InputBorder.none,
          //     ),
          //   ),
          //   child: DropdownMenu(
          //     label: FittedBox(child: Text("Lang")),
          //     initialSelection: context.watch<Language>().selectectLocale,
          //     textStyle: TextStyle(color: Colors.red),
          //     dropdownMenuEntries: Language.languages
          //         .map(
          //           (e) =>
          //               DropdownMenuEntry(value: e['locale'], label: e['name']),
          //         )
          //         .toList(),
          //     onSelected: (value) {
          //       context.read<Language>().changeLanguage(value as String);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
