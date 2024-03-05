import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateUtil {

  static String getFormattedTime({required BuildContext context, required String time}) {
    final date = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    return TimeOfDay.fromDateTime(date).format(context);
  }

  static String getLastMessageTime({required BuildContext context, required String time}) {
    final sent = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    DateTime now = DateTime.now();

    if(now.day == sent.day && now.month == sent.month && now.year == sent.year){
      return TimeOfDay.fromDateTime(sent).format(context);
    }

    return '${sent.day} ${_getMonth(sent)}';
  }

  // get formatted last active tome of user in chat screen
  static String getLastActiveTime({required BuildContext context, required String lastActive}) {
    final int iLast = int.tryParse(lastActive) ?? -1;
    if(iLast == -1) return 'last_seen_soon_available'.tr;

    DateTime time = DateTime.fromMillisecondsSinceEpoch(iLast);
    DateTime now = DateTime.now();

    String formattedTime = TimeOfDay.fromDateTime(time).format(context);
    if(time.day == now.day && time.month == now.month && time.year == now.year){
      return 'last_seen_today'.tr + ' $formattedTime';
    }

    if((now.difference(time).inHours / 24).round() == 1){
      return 'last_seen_yesterday'.tr + ' $formattedTime';
    }

    String month = _getMonth(time);
    return 'last_seen_on'.tr + ' ${time.day} $month ' +  'on'.tr + ' $formattedTime';
  }

  // get month name from month no. or index
  static String _getMonth(DateTime date) {
    switch (date.month) {
      case 1:
        return 'jan'.tr;
      case 2:
        return 'feb'.tr;
      case 3:
        return 'mar'.tr;
      case 4:
        return 'apr'.tr;
      case 5:
        return 'may'.tr;
      case 6:
        return 'jun'.tr;
      case 7:
        return 'jul'.tr;
      case 8:
        return 'aug'.tr;
      case 9:
        return 'sept'.tr;
      case 10:
        return 'oct'.tr;
      case 11:
        return 'nov'.tr;
      case 12:
        return 'dec'.tr;
    }
    return 'NA';
  }
}