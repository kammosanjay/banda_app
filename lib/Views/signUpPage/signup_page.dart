import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/Views/loginpage/login_provider.dart';

import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:baanda_mobile_app/Views/loginpage/login_page.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/constant/constant_widget.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isShown = true;
  TextEditingController passController = TextEditingController();
  TextEditingController phoneEmaiController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Scaffold(
      // backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,s
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/bandabg.png',
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Center(
              child: Text(
                'Welcome To',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textColor(context),
                ),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Row(
                //   children: [
                //     Icon(Icons.track_changes),
                //     SizedBox(width: 8),
                //     Text(
                //       'EATA',
                //       style: GoogleFonts.poppins(
                //         fontSize: 12,
                //         color: AppColor.textColor(context),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 10),
                FittedBox(
                  child: Text(
                    appLoc.welcome,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.headingColor(context),
                    ),
                  ),
                ),
                SizedBox(height: 40),

                // Text(
                //   'Accredated "A" by NAAC',
                //   style: GoogleFonts.poppins(
                //     fontSize: 12,
                //     color: AppColor.textColor(context),
                //   ),
                // ),
                // SizedBox(height: 40),
                CustomWidgets.customTextFeild(
                  context: context,
                  label: 'Full Name',
                  fontwgt: FontWeight.w600,
                  headingcolor: AppColor.textColor(context),
                  hint: 'Full Name',
                  hintfontSize: 14,
                  hintColor: Theme.of(context).colorScheme.secondary,
                  controller: fullNameController,
                  keyboardtype: TextInputType.emailAddress,
                  icon: Image(
                    image: AssetImage('assets/images/person.png'),
                    height: 14,
                    width: 18,
                  ),
                ),
                SizedBox(height: 20),
                CustomWidgets.customTextFeild(
                  context: context,
                  hintfontSize: 14,
                  label: 'Email',
                  fontwgt: FontWeight.w600,
                  headingcolor: AppColor.textColor(context),
                  hint: 'Email',

                  hintColor: Theme.of(context).colorScheme.secondary,
                  controller: phoneEmaiController,
                  keyboardtype: TextInputType.emailAddress,
                  icon: Image(
                    image: AssetImage('assets/images/email.png'),
                    height: 14,
                    width: 18,
                  ),
                ),
                SizedBox(height: 20),
                CustomWidgets.customTextFeild(
                  context: context,

                  hintfontSize: 14,
                  label: 'Password',
                  suffIcons: InkWell(
                    onTap: () {
                      setState(() {
                        isShown = !isShown;
                      });
                    },
                    child: isShown
                        ? Icon(
                            Icons.remove_red_eye,
                            color: AppColor.textColor(context),
                          )
                        : Icon(
                            Icons.remove_red_eye_outlined,
                            color: AppColor.textColor(context),
                          ),
                  ),

                  fontwgt: FontWeight.w600,

                  headingcolor: AppColor.textColor(context),
                  hint: 'Password',
                  hintColor: Theme.of(context).colorScheme.secondary,
                  controller: passController,
                  isObstructed: isShown,
                  icon: Image(
                    image: AssetImage('assets/images/pass.png'),
                    height: 14,
                    width: 18,
                  ),
                ),

                SizedBox(height: 30),
                CustomWidgets.customButton(
                  context: context,
                  height: 60,
                  buttonName: 'Register',
                  onPressed: () {
                    context.read<LoginProvider>().saveSignupData(
                      fullNameController.text,
                      
                      phoneEmaiController.text,
                      passController.text,
                    );
                    context.read<RouteProvider>().navigateTo(
                      '/otpPage',
                      context,
                      arguments: 'signup',
                    );
                  },
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  btnColor: Colors.amber,
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an Account !",
                      style: TextStyle(
                        color: AppColor.textColor(context),
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Login',
                          style: TextStyle(
                            color: AppColor.errorColor(context),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: ' 👋', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
