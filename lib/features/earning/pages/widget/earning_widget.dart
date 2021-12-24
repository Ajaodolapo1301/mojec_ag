

import 'package:flutter/material.dart';
import 'package:mojec_agent/core/constants/text_style_constants.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class EarningWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isEarning;
  const EarningWidget({Key? key, required this.onTap, required this.isEarning, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Color(0xffE5E5E5))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order #34567-235", style: kBold400.copyWith(color: kTitleTextfieldColor, fontSize: 12.sp),),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(57),
                          color:   lightGreen,

                        ),
                        // width:78.w,
                        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 7.h),

                        child: Center(child: Text(isEarning ? "Paid" :"Processing", style: kBold500.copyWith(color: isEarning ? greenText: redText, fontSize: 12.sp),)),
                      ),



                    ],
                  ),
                  SizedBox(height: 6.h,),
                  Text("Wiring", style: kBold700.copyWith(fontSize: 16.sp),),
                  SizedBox(height: 6.h,),
                  Text("Wednesday 6  Oct 2021 |  12:30 pm - 2:45 pm", style: kBold400.copyWith(fontSize: 12.sp, color: kTitleTextfieldColor),),

                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
              child: Row(
                children: [
                  Container(
                    height: 16.h,
                    width: 16.w,
                    decoration: BoxDecoration(
                        color: blue,
                        shape: BoxShape.circle
                    ),
                  ),
                  SizedBox(width: 8.w,),
                  Text("James Dieko", style: kBold400.copyWith(fontSize: 14.sp, color: fadedText),)
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}