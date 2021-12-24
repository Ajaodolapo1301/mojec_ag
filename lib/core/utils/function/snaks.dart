


import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:mojec_agent/core/constants/text_style_constants.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

kShowSnackBar(BuildContext ctx, String msg, {position, color, textColor, title}) {
  return Flushbar(
    flushbarPosition: position ??  FlushbarPosition.BOTTOM,
    backgroundColor: color ?? Colors.red,

    titleColor: blue,
    icon: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: const Icon(
        Icons.info,
        size: 28,
        color: Color(0xffFFB113),
      ),
    ),
    messageText: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(msg,      style: kBold500.copyWith(
            color: Colors.white,

            fontSize: 15.sp,
          ),),
          Text(
            title ?? "",
            // textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
        ],
      ),
    ),

    leftBarIndicatorColor: Color(0xffFFB113),
    duration: const Duration(seconds: 3),
  )..show(ctx);
}
