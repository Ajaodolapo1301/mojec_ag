
import 'package:flutter/material.dart';
import 'package:mojec_agent/core/constants/text_style_constants.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';
import 'package:mojec_agent/core/utils/widgets/app_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        titleText: "Notification",

      ),


      body:  Container(

        child: Column(
          children: [
            SizedBox(height: 10,),
                Expanded(child: ListView.separated(itemBuilder: (context, index){
                  return NotificationCell();
                }, separatorBuilder: (context, index){
                  return SizedBox(height: 0,);
                }, itemCount: 5))
          ],
        ),
      ),
    );
  }
}

class NotificationCell extends StatelessWidget {
  const NotificationCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical:15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Service fee payment confirmed", style: kBold400.copyWith(fontSize: 16.sp),),

                Text("12:30", style: kBold400.copyWith(fontSize: 12.sp, color: kTitleTextfieldColor),)
              ],
              ),
              SizedBox(height: 7.h,),
              Column(
                children: [
                  Text("Service fees have been updated for the wiring", style: kBold400.copyWith(fontSize: 14.sp, color: kTitleTextfieldColor),)
                ],
              ),
            // SizedBox(height: 10.h,),


            ],
          ),
        ),
        Divider()
      ],
    );
  }
}

