

import 'package:flutter/material.dart';
import 'package:mojec_agent/core/utils/navigation/navigator.dart';
import 'package:mojec_agent/core/utils/navigation/route_generator.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';
import 'package:mojec_agent/core/utils/widgets/app_app_bar.dart';
import 'package:mojec_agent/features/dashBoard/pages/widget/booking_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppAppBar(
          titleText: "Your Bookings",
        ),
        body: Column(
          children: [

            SizedBox(height: 36.h,),

            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyle(color: blue),
                labelColor: blue,
              // overlayColor: MaterialStateProperty.all(blue),
              indicatorColor: blue,
              unselectedLabelColor: fadedText,
              tabs: [
                Tab(
                  text: "Pending",

                ),
                Tab(
                  text: "Ongoing",

                ),
                Tab(
                  text: "Completed",

                ),
              ],
            ),

            SizedBox(height: 7.h,),

            Expanded(
              child: TabBarView(
                children: [


                PendingTab(),


                  OngoingTab(),


                  CompletedTab()


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PendingTab extends StatefulWidget {
  const PendingTab({Key? key}) : super(key: key);

  @override
  _PendingTabState createState() => _PendingTabState();
}

class _PendingTabState extends State<PendingTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric(vertical:10),
      padding: EdgeInsets.symmetric(horizontal:20),
      child:  ListView.separated(itemBuilder: (context, index){
        return BookingWidget(
          isCompleted: false, onTap: () {
          pushNamedRoute(context, routeRequestDetails);
        },
        );
      }, separatorBuilder: (context, index){
        return SizedBox(height: 10.h,);
      }, itemCount: 10),
    );
  }
}


class OngoingTab extends StatefulWidget {
  const OngoingTab({Key? key}) : super(key: key);

  @override
  _OngoingTabState createState() => _OngoingTabState();
}

class _OngoingTabState extends State<OngoingTab> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin:EdgeInsets.symmetric(vertical:10),
      padding: EdgeInsets.symmetric(horizontal:10),
      child:  ListView.separated(itemBuilder: (context, index){
        return BookingWidget(
          isCompleted: true, onTap: () {  },
        );
      }, separatorBuilder: (context, index){
        return SizedBox(height: 10.h,);
      }, itemCount: 10),
    );
  }
}

class CompletedTab extends StatefulWidget {
  const CompletedTab({Key? key}) : super(key: key);

  @override
  _CompletedTabState createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:EdgeInsets.symmetric(vertical:10),
      padding: EdgeInsets.symmetric(horizontal:10),
      child:  ListView.separated(itemBuilder: (context, index){
        return BookingWidget(
          isCompleted: true, onTap: () {  },
        );
      }, separatorBuilder: (context, index){
        return SizedBox(height: 10.h,);
      }, itemCount: 10),
    );
  }
}
