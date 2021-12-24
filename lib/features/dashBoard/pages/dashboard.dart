import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mojec_agent/core/constants/text_style_constants.dart';
import 'package:mojec_agent/core/utils/navigation/navigator.dart';
import 'package:mojec_agent/core/utils/navigation/route_generator.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';
import 'package:mojec_agent/features/dashBoard/pages/widget/booking_widget.dart';
import 'package:mojec_agent/features/dashBoard/pages/widget/color_box.dart';
import 'package:mojec_agent/features/dashBoard/pages/widget/purple_box.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi James,",
                    style: kBold700.copyWith(fontSize: 24.sp),
                  ),
                  IconButton(
                      onPressed: ()=> pushNamedRoute(context, routeNotification),
                      icon: Icon(
                        Icons.notifications_none_rounded,
                        size: 25,
                        color: blue,
                      ))
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Overview",
                style: kBold400.copyWith(
                    fontSize: 18.sp, color: Color(0xff888888)),
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: ColorBoxes(
                    text: 'O1',
                    subText: 'Ongoing Jobs',
                    image: 'bottomNav/arc.svg',
                    color: Color(0xffE6BE5C),
                  )),
                  SizedBox(
                    width: 17.w,
                  ),
                  Expanded(
                      child: ColorBoxes(
                    text: '15',
                    subText: 'Completed jobs',
                    image: 'bottomNav/check.svg',
                    color: Color(0xff1DAAA9),
                  ))
                ],
              ),
              SizedBox(
                height: 17.h,
              ),
              PurpleBox(),
              SizedBox(
                height: 23.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Booking requests",
                    style: kBold700.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    "See all",
                    style: kBold400.copyWith(color: blue),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return BookingWidget(
                          onTap: () {},
                          isCompleted: true,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 7.h,
                        );
                      },
                      itemCount: 3))
            ],
          ),
        ),
      ),
    );
  }
}
