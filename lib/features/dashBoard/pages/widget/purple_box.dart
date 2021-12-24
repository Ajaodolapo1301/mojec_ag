

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mojec_agent/core/constants/key_constants.dart';
import 'package:mojec_agent/core/constants/text_style_constants.dart';

class PurpleBox extends StatelessWidget {
  const PurpleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 17, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: Color(0xff7A97E6)
      ),
      // height: 110.h,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("N95000", style: kBold700.copyWith(fontSize: 30.sp, color: Colors.white),),
                  SizedBox(height: 10.h,),
                  Text("Total income", style: kBold400.copyWith(color: Colors.white),)
                ],
              ),
              SvgPicture.asset("$imagePath/bottomNav/money.svg"),
            ],
          )
        ],
      ),
    );
  }
}