import 'package:safepet/core/utils/app_colors.dart';
import 'package:safepet/core/utils/app_texts.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      title: const Text(
        AppTexts.homeTitle,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
      ),
      elevation: 0,
    );
  }
}
