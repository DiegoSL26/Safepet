import 'package:safepet/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.check,
      color: AppColors.white,
      size: 128,
    );
  }
}
