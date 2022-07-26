import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safepet/presentation/pages/chat_page.dart';
import 'package:safepet/presentation/pages/create_adoption_page.dart';
import 'package:safepet/presentation/pages/home_page.dart';
import 'package:safepet/presentation/pages/launch_page.dart';
import 'package:safepet/presentation/pages/login_page.dart';
import 'package:safepet/presentation/pages/profile_page.dart';
import 'package:safepet/presentation/pages/report_list_page.dart';
import 'package:safepet/presentation/pages/report_page.dart';
import 'package:safepet/presentation/pages/signup_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SafePet',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blue[900],
          secondary: Colors.blue[900],
        ),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const LaunchPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/home': (BuildContext context) => const HomePage(),
        '/profile': (BuildContext context) => const ProfilePage(),
        '/signup': (BuildContext context) => const SignupPage(),
        '/create-adoption': (BuildContext context) =>
            const CreateAdoptionPage(),
        '/report-list': (BuildContext context) => const ReportListPage(),
        '/chat': (BuildContext context) => ChatPage(),
        '/report': (BuildContext context) => const ReportPage(),
      },
    );
  }
}
