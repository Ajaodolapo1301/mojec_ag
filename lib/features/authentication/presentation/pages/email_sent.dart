






import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojec_agent/core/constants/key_constants.dart';
import 'package:mojec_agent/core/constants/text_style_constants.dart';
import 'package:mojec_agent/core/utils/navigation/navigator.dart';
import 'package:mojec_agent/core/utils/navigation/route_generator.dart';

import 'package:mojec_agent/core/utils/styles/color_utils.dart';
import 'package:mojec_agent/core/utils/widgets/custom_button.dart';
import 'package:mojec_agent/core/utils/widgets/custom_text_field.dart';
import 'package:mojec_agent/core/utils/widgets/header.dart';
import 'package:mojec_agent/core/widget/loading_overlay_widget.dart';
import 'package:mojec_agent/features/authentication/presentation/widget/OtpTimer.dart';
import 'package:mojec_agent/features/authentication/presentation/widget/title_widget.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class EmailSent extends StatefulWidget {

  const EmailSent({Key? key, }) : super(key: key);

  @override
  _EmailSentState createState() => _EmailSentState();
}

class _EmailSentState extends State<EmailSent>  with TickerProviderStateMixin{


  var email = "";



  @override
  void initState() {

    super.initState();
  }
  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return LoadingOverlayWidget(
      loading:false,
      child: Scaffold(

        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  text: "",
                  preferredActionOnBackPressed: (){
                    Navigator.maybePop(context);
                  },
                ),
                SizedBox(height: 25.h,),
                TitleWidget(
                  mainText: "Email sent!!",

                ),
                SizedBox(height: 50.h,),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SvgPicture.asset("$imagePath/auth/phone.svg"),
                      SizedBox(height: 34.h,),

                      Text("Check your mail",style: kBold400.copyWith(fontSize: 22.sp,) ),
                      SizedBox(height: 13.h,),
                      Text("We have sent the password recovery instruction to your mail", textAlign: TextAlign.center,style: kBold400.copyWith(fontSize: 14.sp, color: fadedText)),
                      SizedBox(height: 46.h,),

                    ],
                  ),
                ),



                CustomButton(text: "Send reset link", type:  ButtonType.outlined, textColor: Colors.white,  onPressed:  (){

                  pushNamedRoute(context, routeCreateNewPassword);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

}