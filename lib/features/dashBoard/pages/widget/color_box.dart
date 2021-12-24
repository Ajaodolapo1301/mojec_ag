
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mojec_agent/core/constants/key_constants.dart';
import 'package:mojec_agent/core/constants/text_style_constants.dart';

import 'package:flutter/material.dart';

class ColorBoxes extends StatelessWidget {
  final String  text;
  final String subText;
  final String image;
  final Color color;
  const ColorBoxes({Key? key, required this.text, required this.subText, required this.image, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 17),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: color
      ),
      // height: 136.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset("$imagePath/$image"),
          SizedBox(height: 10.h,),
          Text(text, style: kBold700.copyWith(fontSize: 30.sp, color: Colors.white),),
          SizedBox(height: 5.h,),
          Text(subText, style: kBold400.copyWith( color: Colors.white),)
        ],
      ),
    );
  }
}