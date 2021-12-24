import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:mojec_agent/core/constants/text_style_constants.dart';
import 'package:mojec_agent/core/utils/myUtils/my_utils.dart';
import 'package:mojec_agent/core/utils/navigation/navigator.dart';
import 'package:mojec_agent/core/utils/navigation/route_generator.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';
import 'package:mojec_agent/core/utils/widgets/app_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mojec_agent/core/utils/widgets/header.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        titleText: "Profile",
      ),

      body: Container(

        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 42.h,),
                Column(
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: blue,

                      ),

                    ),
                    SizedBox(height:21.h,),
                    Text("Dayo Smallie", style: kBold600.copyWith(fontSize: 16.sp, color: black),),
                    SizedBox(height:5.h,),
                    Text("dayo@smallie.gmail.com", style: kBold400.copyWith(fontSize: 14.sp, color: kTitleTextfieldColor),),
                    SizedBox(height:2.h,),
                    TextButton(onPressed: () {  },
                    child: Text("Edit Profile", style: kBold600.copyWith(fontSize: 14.sp, color: blue),)),
                    SizedBox(height:40.h,),
                    Divider()
                  ],
                ),
            SizedBox(height: 20.h,),
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(highlightColor: Colors.pink),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.separated(
                    separatorBuilder: (_, __) =>
                        SizedBox(
                      height: 30.h,

                    ),
                    itemBuilder: (context, index) {
                      if (index == list.length) {
                        return SizedBox(height: 10.h);
                      }
                      return  InkWell(
                        onTap: () {
                          if (list[index] != null) {
                            list[index].onTap(context);
                          }
                        },
                        child: Row(
                          children: [
                            Container(
                              // height: 38.h,
                              // width: 38.w,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Color(0xffE4EAF1),
                                shape: BoxShape.circle,

                              ),

                              child: SvgPicture.asset(list[index].imagePath, height: 15,),
                            ),
                            SizedBox(width: 10,),
                            Text(list[index].mainText , style: kBold600.copyWith(color: black, fontSize: 14.sp),)
                          ],
                        ),
                      );
                      //   Row(
                      //   children: [
                      //     Circle(image: list[index].imagePath),
                      //  SizedBox(width: 10.w),
                      //     Text(list[index].mainText, style: kBold600.copyWith(fontSize: 14.sp, color: black),)
                      //   ],
                      // );
                    },
                    itemCount: list.length + 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<FeatureFromMoreDetails> get list => getPersona();
  List<FeatureFromMoreDetails>  getPersona(){
    return    [
      FeatureFromMoreDetails(
        imagePath: "assets/images/profile/history.svg",
        mainText: "History",

        onTap: (context) {
          // pushTo(context, SelectAvailability());

        },
      ),
      FeatureFromMoreDetails(
        imagePath: "assets/images/profile/saved_payment.svg",
        mainText: "Saved payment methods",

        onTap: (context) {



        },
      ),
      FeatureFromMoreDetails(
        imagePath: "assets/images/profile/change_pass.svg",
        mainText: "Change password",

        onTap: (context) {
        pushNamedRoute(context, routeChangePassword);

        },
      ),


      FeatureFromMoreDetails(
          imagePath: "assets/images/profile/address.svg",
          mainText: "Saved address",

          onTap: (context){
            // pushTo(context, LiveChatWebView());

          }
      ),

      FeatureFromMoreDetails(
          imagePath: "assets/images/profile/info.svg",
          mainText: "Information",

          onTap: (context){

          },


      ),


      FeatureFromMoreDetails(
          imagePath: "assets/images/profile/logout.svg",
          mainText: "Logout",

          onTap: (context){

            Platform.isIOS ?       MyUtils.showIOSAreYouSureDialog(context,
                mainText: "Logout", subtext: "Are you sure you want to logout",
                leftText: "Cancel", rightText: "Ok", onClose: (){
                  pop(context);
                  final box = Hive.box("trainer");
                  box.put('user',null);

                }
            ) :

            MyUtils.showAreYouSureDialog(context,
                mainText: "Logout", subtext: "Are you sure you want to logout",
                leftText: "Cancel", rightText: "Ok", onClose: (){

                  final box = Hive.box("trainer");
                  box.put('user',null);

                }
            );
          },


      ),

    ];

  }
}




class FeatureFromMoreDetails{
  final String imagePath;
  final String mainText;

  final Function(BuildContext context) onTap;

  FeatureFromMoreDetails({required this.onTap, required this.imagePath, required this.mainText,});
}


class Circle extends StatelessWidget {
 final String image;
  const Circle({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 25.w,
      height: 25.h,
      decoration: BoxDecoration(
          color: Color(0xffE4EAF1),
          shape: BoxShape.circle

      ),
      child: SvgPicture.asset(image, width: 5.w, height: 2.h, fit: BoxFit.cover,),
    );
  }
}
