import 'package:safepet/core/utils/app_colors.dart';
import 'package:safepet/core/utils/app_texts.dart';
import 'package:safepet/data/models/adoption_model.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required AdoptionModel? adoptionModel,
  })  : _adoptionModel = adoptionModel,
        super(key: key);

  final AdoptionModel? _adoptionModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 56,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _adoptionModel?.uid == null
                ? AppTexts.createTitle
                : AppTexts.updateTitle,
            style: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            _adoptionModel?.uid == null
                ? AppTexts.createMessage
                : AppTexts.updateMessage,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.grey600,
            ),
          ),
        ],
      ),
    );
  }
}
