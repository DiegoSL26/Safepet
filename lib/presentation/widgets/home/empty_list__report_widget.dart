import 'package:safepet/core/utils/app_images.dart';
import 'package:safepet/core/utils/app_texts.dart';
import 'package:flutter/material.dart';

class EmptyListReportWidget extends StatelessWidget {
  const EmptyListReportWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.empty,
            width: 200,
          ),
          const Text(
            AppTexts.emptyListTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const Text(
            AppTexts.emptyListReportSubtitle,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
