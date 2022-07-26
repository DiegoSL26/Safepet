import 'package:safepet/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingListWidget extends StatelessWidget {
  const LoadingListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          AppColors.black,
        ),
      ),
    );
  }
}
