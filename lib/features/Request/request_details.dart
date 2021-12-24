

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mojec_agent/core/constants/key_constants.dart';
import 'package:mojec_agent/core/constants/text_style_constants.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';
import 'package:mojec_agent/core/utils/widgets/app_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mojec_agent/core/utils/widgets/custom_button.dart';
class RequestDetails extends StatefulWidget {
  const RequestDetails({Key? key}) : super(key: key);

  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(

        titleText: "Request details",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: 72.h,
              child: Row(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    height: 34.h,
                    width: 34.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: blue
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("James Dieko", style: kBold700.copyWith(fontSize: 14.sp, color: black),),
                      Text("Lekki, Lagos", style: kBold400.copyWith(fontSize: 12.sp, color: fadedText),)
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text("Order #34567-235", style: kBold400.copyWith(color: kTitleTextfieldColor, fontSize: 12.sp),),
                  ),

                ],
              ),
            ),
          ),

          SizedBox(height: 27.sp,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Service Details", style: kBold700.copyWith(fontSize: 16.sp),),
                SizedBox(height: 20.h,),
                Text("Service order", style: kBold400.copyWith(fontSize: 12.sp, color: kTitleTextfieldColor),),
                SizedBox(height: 7.h,),
                Text("Wiring", style: kBold400.copyWith(fontSize: 14.sp, ),),
                SizedBox(height: 10.h,),
                Text("Work Description", style: kBold400.copyWith(fontSize: 12.sp, color: kTitleTextfieldColor ),),
                SizedBox(height: 10.h,),
             Text("I have bought  a new electrical water heater and i want it installed in the bathroom. Attached to this is the photo of the heater.",style: kBold400.copyWith(fontSize: 14.sp, color: faded ),),
                SizedBox(height: 15.h,),
             Row(
               children: [
                 Container(
                   height: 48.h,
                   width: 48.w,
                   decoration: BoxDecoration(
                     color: blue,
                     borderRadius: BorderRadius.circular(5)
                   ),
                 ),
                 SizedBox(width: 10.w,),
                 Container(
                   height: 48.h,
                   width: 48.w,
                   decoration: BoxDecoration(
                       color: blue,
                       borderRadius: BorderRadius.circular(5)
                   ),
                 ),
               ],
             ),

                SizedBox(height: 15.h,),
                Text("Address", style: kBold400.copyWith(fontSize: 12.sp, color: kTitleTextfieldColor ),),
                SizedBox(height: 10.h,),
                Text("No 2, Kolade maloko street", style: kBold400.copyWith(fontSize: 14.sp,color: faded ),),
                SizedBox(height: 10.h,),
                DateAndTime(image: "/profile/calendar", text: "Today 15th OCT, 2021",),
                SizedBox(height: 12.h,),
                DateAndTime(image: "/profile/clock", text: "12:00 PM - 2:00 PM",),

                SizedBox(height: 38.h,),
                CustomButton(
                  textColor: blue,
                  text: "Reject booking",
                ),
                SizedBox(height: 15.h,),
                CustomButton(
                  type:  ButtonType.outlined, textColor: Colors.white,
                  color: blue,
                  text: "Accept Booking",
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}


class DateAndTime extends StatelessWidget {
  final String?  image;
  final String? text;
  const DateAndTime({Key? key, this.image, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("$imagePath/$image.svg", height: 14,),
        SizedBox(width: 15.w,),
        Text(text!, style: kBold400.copyWith(fontSize: 14.sp,color: faded ),)
      ],
    );
  }
}
