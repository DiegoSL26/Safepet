import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  String dateTimeNowFormatted() {
    var dateFormatted = DateFormat.MMMMEEEEd('en_US').format(DateTime.now());
    return dateFormatted;
  }

  String? formatDateTime({required DateTime dateTime}) {
    var dateFormatted = DateFormat.yMd('en_US').format(dateTime);
    return dateFormatted;
  }

  String? formatTimeOfDay({required TimeOfDay timeOfDay}) {
    String hour = timeOfDay.hour.toString();
    String minute = timeOfDay.minute.toString();
    String time = '$hour:$minute';
    return time;
  }
}
