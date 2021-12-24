



import 'package:flutter/material.dart';
import 'package:mojec_agent/core/utils/navigation/navigator.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Header extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final VoidCallback? preferredActionOnBackPressed;
  final Widget? suffix;
  final bool showPrefix;
  final Color? color;

  final Border? border;
  const Header({
    Key? key,
    this.text,
    this.color,

    this.border,
    this.showPrefix = true,
    this.textStyle,
    this.suffix,
    this.backgroundColor,

    this.preferredActionOnBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBack(
          border: border,
          color: color,
          preferredActionOnBackPressed: preferredActionOnBackPressed,
        ),
        Spacer(),
        Text(
          text!,
          style: textStyle ??  TextStyle(
            color: blue,
            fontWeight: FontWeight.w700,
            fontSize: 21,
          ),
        ),
        Spacer(),
        suffix ?? Icon(Icons.search, color: Colors.transparent,)
        // Opacity(
        //   opacity: 0,
        //   child: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back_ios,
        //       size: 18,
        //     ),
        //     onPressed: null,
        //   ),
        // ),
      ],
    );
  }
}


class CustomBack extends StatelessWidget {
final  Border? border;

final VoidCallback? preferredActionOnBackPressed;

final Color? color;

  const CustomBack({Key? key, this.border, this.preferredActionOnBackPressed, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      child: Container(
        width: 38.w,
        height: 38.h,
        decoration: BoxDecoration(
            color: Color(0xffE4EAF1),
            borderRadius: BorderRadius.circular(16),
            border: border
        ),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: color,
          size: 15,
        ),
      ),
      onTap: preferredActionOnBackPressed ??
              () {
            pop(context);
          },
    );
  }
}
