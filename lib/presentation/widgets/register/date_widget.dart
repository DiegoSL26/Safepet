import 'package:safepet/core/utils/app_colors.dart';
import 'package:safepet/core/utils/app_texts.dart';
import 'package:safepet/core/utils/date_formatter.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final String? date;
  final void Function()? onPressed;
  const DateWidget({
    Key? key,
    required this.date,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.date_range,
        color: AppColors.black,
        size: 36,
      ),
      title: Text(
        date == null
            ? 'Ex: ${DateFormatter().formatDateTime(dateTime: DateTime.now())}'
            : '$date',
        style: TextStyle(
          color: date == null ? AppColors.grey600 : AppColors.black,
          fontStyle: FontStyle.normal,
          fontSize: 16,
        ),
      ),
      subtitle: const Text(AppTexts.formDate),
      trailing: IconButton(
        icon: const Icon(
          Icons.keyboard_arrow_right,
          color: AppColors.black,
          size: 36,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
