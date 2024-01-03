import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/res/color.dart';
import 'package:intl/intl.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';

class Utils {
  static void fieldFocus(
      BuildContext context, FocusNode currentNode, FocusNode nextFocus) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColors.primaryTextTextColor,
        textColor: AppColors.whiteColor,
        fontSize: 16);
  }

  static String postTime(String time) {
    var dt = DateTime.fromMicrosecondsSinceEpoch(int.parse(time.toString()));
    var originalDate = DateFormat('MM/dd/yyyy h:mma').format(dt);
    final todayDate = DateTime.now();
    String difference = '';

    if (kDebugMode) {
      // print(originalDate);
      // print(todayDate);
      // print(todayDate.difference(dt).inDays);
    }

    if (todayDate.difference(dt).inDays < 1) {
      //  difference = "Today" ;
      difference = DateFormat('jm').format(dt).toString();
    } else if (todayDate.difference(dt).inDays >= 1 &&
        todayDate.difference(dt).inDays < 2) {
      difference = "Yesterday";
    } else if (todayDate.difference(dt).inDays >= 2 &&
        todayDate.difference(dt).inDays < 3) {
      difference = DateFormat('EEEE').format(dt).toString();
    } else if (todayDate.difference(dt).inDays >= 3 &&
        todayDate.difference(dt).inDays < 4) {
      difference = DateFormat('EEEE').format(dt).toString();
    } else if (todayDate.difference(dt).inDays >= 4 &&
        todayDate.difference(dt).inDays < 5) {
      difference = DateFormat('EEEE').format(dt).toString();
    } else if (todayDate.difference(dt).inDays >= 5 &&
        todayDate.difference(dt).inDays < 6) {
      difference = DateFormat('EEEE').format(dt).toString();
    } else if (todayDate.difference(dt).inDays >= 6 &&
        todayDate.difference(dt).inDays < 7) {
      difference = DateFormat('EEEE').format(dt).toString();
    } else if (todayDate.difference(dt).inDays >= 7 &&
        todayDate.difference(dt).inDays < 14) {
      difference = "${todayDate.difference(dt).inDays} Days Ago";
    } else {
      difference = originalDate;
    }

    return difference;
  }

  static void flushBarDoneMessage(String message, BuildContext, context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          forwardAnimationCurve: Curves.easeIn,
          flushbarPosition: FlushbarPosition.TOP,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(15),
          duration: Duration(seconds: 3),
          borderRadius: BorderRadius.circular(10),
          backgroundColor: Colors.green.shade400,
          positionOffset: 20,
          icon: Icon(
            Icons.done_rounded,
            size: 20,
            color: Colors.white,
          ),
        )..show(context));
  }

  static void flushBarErrorMessage(String message, BuildContext, context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          forwardAnimationCurve: Curves.easeIn,
          flushbarPosition: FlushbarPosition.BOTTOM,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(15),
          duration: Duration(seconds: 3),
          borderRadius: BorderRadius.circular(10),
          backgroundColor: Colors.red.shade400,
          positionOffset: 20,
          icon: Icon(
            Icons.error,
            size: 20,
            color: Colors.white,
          ),
        )..show(context));
  }
}
