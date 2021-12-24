import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mojec_agent/core/constants/text_style_constants.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final bool showArrow;
  final Color? color;
  final Color textColor;

  const CustomButton({
    Key? key,
     this.text,
    this.onPressed,
    this.textColor = Colors.white,
    this.type = ButtonType.filled,
    this.showArrow = false,
     this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == ButtonType.outlined) {
      return SizedBox(
        width: double.maxFinite,
        child: OutlinedButton(
          onPressed: onPressed,
          child: Text(
            text!,
            style: kBold400.copyWith(
              fontFamily: 'HUM77',
              color: textColor,

              fontSize: 16.sp
            ),
          ),

          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color ?? blue),

            padding: MaterialStateProperty.all( EdgeInsets.symmetric(vertical:20.h),),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
            ))

          ),

          // highlightElevation: 0,
        ),
      );
    }
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text!,
              style:  kBold400.copyWith(
                fontFamily: 'HUM777',
                fontSize: 16.sp,
                color: textColor

              ),
            ),
            if (showArrow)
              Container(
                margin: EdgeInsets.only(left: 10),
                child: const RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    Icons.keyboard_backspace_rounded,
                  ),
                ),
              ),
          ],
        ),
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(
            width: 1.0,
            color: blue
          )) ,
          backgroundColor: MaterialStateProperty.all(Colors.transparent ),

          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical:22),),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
        ),
      ),
    );
  }
}

enum ButtonType { outlined, filled }
