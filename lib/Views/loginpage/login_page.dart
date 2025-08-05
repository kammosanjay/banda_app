import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/Views/Forgot/forgot_page.dart';
import 'package:baanda_mobile_app/Views/signUpPage/signup_page.dart';
import 'package:baanda_mobile_app/constant/appColor.dart';
import 'package:baanda_mobile_app/constant/constant_widget.dart';
import 'package:baanda_mobile_app/utils/custom_widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isShown = true;
  TextEditingController passController = TextEditingController();
  TextEditingController phoneEmaiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return Container(
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
      ),
      child: Scaffold(
        // backgroundColor: Colors.grey.shade100,
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
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
                  //     Icon(
                  //       Icons.track_changes,
                  //       color: AppColor.headingColor(context),
                  //     ),
                  //     SizedBox(width: 8),
                  //     Text(
                  //       'EATA',
                  //       style: GoogleFonts.poppins(
                  //         fontSize: 12,
                  //         // color: AppColor.textColor(context),
                  //         textStyle: Theme.of(context).textTheme.titleSmall,
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
                    label: 'Phone/Email',
                    fontwgt: FontWeight.normal,
                    headingcolor: AppColor.textColor(context),
                    hint: 'Phone/Email',

                    hintColor: Theme.of(context).colorScheme.secondary,
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
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // Removes all padding
                        minimumSize: Size(
                          10,
                          10,
                        ), // Optional: removes minimum tap area
                        tapTargetSize: MaterialTapTargetSize
                            .shrinkWrap, // Optional: tight layout
                      ),
                      child: Text("Forgot Password ?"),
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomWidgets.customButton(
                    context: context,
                    height: 55,
                    buttonName: 'Sign In',
                    onPressed: () {
                      context.read<RouteProvider>().navigateTo(
                        '/home',
                        context,
                      );
                    },
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    btnColor: Colors.indigoAccent,
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      // context.read<RouteProvider>().navigateTo(
                      //   '/signup',
                      //   context,
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an Account? ",
                        style: TextStyle(
                          color: AppColor.textColor(context),
                          fontSize: 16,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign Up',
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
      ),
    );
  }
}
