import 'package:baanda_mobile_app/Views/language/language.dart';
import 'package:baanda_mobile_app/Views/theme/theme_provider.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Idcard extends StatelessWidget {
  const Idcard({super.key});

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

      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height*0.8,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
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
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor(context),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "Banda University of Agriculture & Technology",
                  style: TextStyle(
                    color: AppColor.textColor(context),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),

              // Photo + QR Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      width: 150,
                      height: 150,
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.grey[300], // Replace with QR image
                    child: Icon(Icons.qr_code, size: 50, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Name
              FittedBox(
                child: const Text(
                  "Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

              // Details
              _buildDetail("Department:", "Department of Chemistry"),
              _buildDetail("Program:", "M.Sc. in Chemistry"),
              _buildDetail("Enroll. No:", "465731"),
              _buildDetail("Campus:", "Main Campus"),
              _buildDetail("Admission Year:", "2023"),
              _buildDetail("Phone:", "6388701319"),
              _buildDetail("Email:", "gargim191@gmail.com"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$label ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(color: Colors.black87, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
