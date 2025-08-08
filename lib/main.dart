import 'package:baanda_mobile_app/Views/AcademicSubSections/acadCalen.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/acadColla.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/acadExam.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/academicPro.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/colleges.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/internalQA.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/library.dart';
import 'package:baanda_mobile_app/Views/AcademicSubSections/listOfUgc.dart';
import 'package:baanda_mobile_app/Views/home/banda_home_page.dart';
import 'package:baanda_mobile_app/Views/screenListView/aboutHEI.dart';
import 'package:baanda_mobile_app/Views/screenListView/academic.dart';
import 'package:baanda_mobile_app/Views/screenListView/administration.dart';
import 'package:baanda_mobile_app/Views/screenListView/admissionFee.dart';
import 'package:baanda_mobile_app/Views/screenListView/alumni.dart';
import 'package:baanda_mobile_app/Views/screenListView/announement.dart';
import 'package:baanda_mobile_app/Views/screenListView/emergency.dart';
import 'package:baanda_mobile_app/Views/screenListView/gallery.dart';
import 'package:baanda_mobile_app/Views/screenListView/information.dart';
import 'package:baanda_mobile_app/Views/screenListView/research.dart';
import 'package:baanda_mobile_app/Views/screenListView/studentCareer.dart';
import 'package:baanda_mobile_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get_storage/get_storage.dart';

import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/Views/Forgot/forgot_page.dart';
import 'package:baanda_mobile_app/Views/ReportsPage/report_provider.dart';
// Ensure that 'myPage_routes.dart' defines a class named 'MyPageRoutes' with a static 'routes' property.
import 'package:baanda_mobile_app/Views/home/home_providers.dart';
import 'package:baanda_mobile_app/Views/home/home.dart';
import 'package:baanda_mobile_app/Views/home/task_page.dart';
import 'package:baanda_mobile_app/Views/home/tasklist_page.dart';
import 'package:baanda_mobile_app/Views/loginpage/login_page.dart';
import 'package:baanda_mobile_app/Views/signUpPage/signup_page.dart';
import 'package:baanda_mobile_app/Views/splash/splash_provider.dart';
import 'package:baanda_mobile_app/Views/splash/splash_screen.dart';
import 'package:baanda_mobile_app/Views/todolist/todo_provider.dart';

import 'package:baanda_mobile_app/l10n/app_localizations.dart';
import 'package:baanda_mobile_app/Views/language/language.dart';

import 'package:baanda_mobile_app/Views/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqlite_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Language>(create: (_) => Language()),
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
        ChangeNotifierProvider<HomeProviders>(create: (_) => HomeProviders()),
        ChangeNotifierProvider<RouteProvider>(create: (_) => RouteProvider()),
        ChangeNotifierProvider<TodoProvider>(create: (_) => TodoProvider()),
        ChangeNotifierProvider<ReportProvider>(create: (_) => ReportProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    final langProvider = Provider.of<Language>(context, listen: true);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
        Locale('es'),
        Locale('bn'),
        Locale('ta'),
        Locale('te'),
        Locale('mr'),
        Locale('kn'),
        Locale('as'),
        Locale('ur'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      themeMode: themeProvider.themeMode,
      locale: langProvider.selectectLocale,
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const MyHome(),
        '/task': (context) => TaskPage(),
        '/CreateTaskList': (context) => CreateTaskList(),
        '/loginpage': (context) => LoginPage(),
        '/forgotpage': (context) => ForgotPage(),
        '/signUpPage': (context) => SignupPage(),
        '/bandaHomePage': (context) => BandaHomePage(),
        '/acadProgram': (context) => AcademicProgramScreen(),
        '/acadCalender': (context) => AcademicCalenderScreen(),
        '/acadExaminations': (context) => AcademicExamScreen(),
        '/colleges': (context) => AcademicCollegesScreen(),
        '/UGC': (context) => AcademicUGCScreen(),
        '/IQA': (context) => AcademicIQAScreen(),
        '/library': (context) => AcademicLibraryScreen(),
        '/acadCollaborations': (context) => AcademicCollaborationScreen(),
        //
        'Announcements': (context) => NotificationScreen(),
        'Academic': (context) => AcademicScreen(),
        'Administration': (context) => AdministrationScreen(),
        'Admissions & Fee': (context) => Admissionfee(),
        'Research': (context) => Research(),
        'Student Career': (context) => StudentCareer(),
        'Alumni': (context) => Alumni(),
        'Information Corner': (context) => Information(),
        'Emergency Contact': (context) => Emergency(),
        'Gallery': (context) => Gallery(),
        'About HEI': (context) => AboutHei(),
      },
    );
  }
}
