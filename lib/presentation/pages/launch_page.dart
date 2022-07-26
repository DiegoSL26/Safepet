import 'package:firebase_auth/firebase_auth.dart';
import 'package:safepet/core/utils/app_colors.dart';
import 'package:safepet/presentation/widgets/launch/app_name_widget.dart';
import 'package:safepet/presentation/widgets/launch/logo_widget.dart';
import 'package:flutter/material.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushNamed(context, '/home');
      } else {
        Navigator.pushNamed(context, '/login');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.blue900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            LogoWidget(),
            AppNameWidget(),
          ],
        ),
      ),
    );
  }
}
