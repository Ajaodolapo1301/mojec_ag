


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mojec_agent/core/constants/text_style_constants.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';
class TitleWidget extends StatelessWidget {
  final String? mainText;



  const TitleWidget({
    this.mainText,

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(mainText!, style: kBold400.copyWith(fontSize: 24.sp, color: blue)),


      ],
    );
  }
}