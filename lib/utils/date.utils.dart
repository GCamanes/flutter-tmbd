import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

abstract class DateTimeUtils {
  static String getFormatDate(BuildContext context, String date) {
    String format = 'dd MM yyyy';
    try {
      return DateFormat(format).format(DateTime.parse(date));
    } catch(e) {
      return date;
    }
  }
}