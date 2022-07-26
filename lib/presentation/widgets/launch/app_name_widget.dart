import 'package:safepet/core/utils/app_colors.dart';
import 'package:safepet/core/utils/app_texts.dart';
import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppTexts.appName,
      style: TextStyle(
        color: AppColors.white,
        fontSize: 36,
      ),
    );
  }
}
