import 'package:safepet/core/utils/app_colors.dart';
import 'package:safepet/core/utils/app_texts.dart';
import 'package:safepet/core/utils/date_formatter.dart';
import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  final String? time;
  final void Function()? onPressed;
  const TimeWidget({
    Key? key,
    required this.time,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.access_time,
        color: AppColors.black,
        size: 36,
      ),
      title: Text(
        time == null
            ? 'Ex: ${DateFormatter().formatTimeOfDay(timeOfDay: TimeOfDay.now())}'
            : '$time',
        style: TextStyle(
          color: time == null ? AppColors.grey600 : AppColors.black,
          fontStyle: FontStyle.normal,
          fontSize: 16,
        ),
      ),
      subtitle: const Text(AppTexts.formTime),
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
