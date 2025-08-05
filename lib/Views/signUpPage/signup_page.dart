import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:baanda_mobile_app/Views/loginpage/login_page.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/constant/constant_widget.dart';

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
                  'assets/images/bandaLogo.png',
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: 40),
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
                SizedBox(height: 20),
                FittedBox(
                  child: Text(
                    appLoc.welcome,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: AppColor.headingColor(context),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Accredated "A" by NAAC',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: AppColor.textColor(context),
                  ),
                ),
                SizedBox(height: 40),

                CustomWidgets.customTextFeild(
                  context: context,
                  label: 'Full Name',
                  fontwgt: FontWeight.normal,
                  headingcolor: AppColor.headingColor(context),
                  hint: 'Full Name',

                  hintColor: AppColor.textColor(context),
                  controller: fullNameController,
                  keyboardtype: TextInputType.emailAddress,
                  icon: Icon(Icons.email),
                ),
                SizedBox(height: 20),
                CustomWidgets.customTextFeild(
                  context: context,
                  label: 'Phone/Email',
                  fontwgt: FontWeight.normal,
                  headingcolor: AppColor.headingColor(context),
                  hint: 'Phone/Email',

                  hintColor: AppColor.textColor(context),
                  controller: phoneEmaiController,
                  keyboardtype: TextInputType.emailAddress,
                  icon: Icon(Icons.email),
                ),
                SizedBox(height: 20),
                CustomWidgets.customTextFeild(
                  context: context,
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

                  fontwgt: FontWeight.normal,

                  headingcolor: AppColor.headingColor(context),
                  hint: 'Password',
                  hintColor: AppColor.textColor(context),
                  controller: passController,
                  isObstructed: isShown,
                  icon: Icon(Icons.lock),
                ),

                SizedBox(height: 30),
                CustomWidgets.customButton(
                  context: context,
                  height: 55,
                  buttonName: 'Sign Up',
                  onPressed: () {},
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  btnColor: Colors.indigoAccent,
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
                          text: ' Sign In',
                          style: TextStyle(
                            color: AppColor.headingColor(context),
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
