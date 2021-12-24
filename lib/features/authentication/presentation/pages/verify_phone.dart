

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojec_agent/core/constants/key_constants.dart';
import 'package:mojec_agent/core/constants/text_style_constants.dart';
import 'package:mojec_agent/core/utils/function/snaks.dart';
import 'package:mojec_agent/core/utils/navigation/navigator.dart';
import 'package:mojec_agent/core/utils/navigation/route_generator.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';
import 'package:mojec_agent/core/utils/widgets/custom_button.dart';
import 'package:mojec_agent/core/utils/widgets/header.dart';
import 'package:mojec_agent/core/widget/loading_overlay_widget.dart';
import 'package:mojec_agent/features/authentication/presentation/widget/OtpTimer.dart';
import 'package:mojec_agent/features/authentication/presentation/widget/title_widget.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class VerifyPhone extends StatefulWidget {

  const VerifyPhone({Key? key, }) : super(key: key);

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone>  with TickerProviderStateMixin{
 late Timer timer;
  int totalTimeInSeconds = 0;
  bool _hideResendButton = true;



  final FocusNode _pinPutFocusNode = FocusNode();
  final int time = 60;
  final _otpController = TextEditingController();
late    AnimationController _controller;
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: kTitleTextfieldColor),

    );
  }

  @override
  void initState() {
    totalTimeInSeconds = time;
    _controller =
    AnimationController(vsync: this, duration: Duration(seconds: time))
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          setState(() {
            _hideResendButton = !_hideResendButton;
          });
        }
      });
    _controller.reverse(
        from: _controller.value == 0.0 ? 1.0 : _controller.value);
    _startCountdown();

    // getCurrentAppTheme();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return LoadingOverlayWidget(
      loading:false,
      child: Scaffold(

        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                  mainText: "Verify your Phone number",

                ),
                SizedBox(height: 50.h,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                          SvgPicture.asset("$imagePath/auth/phone.svg"),
                      SizedBox(height: 34.h,),

                      Text("Phone Number Verification",style: kBold400.copyWith(fontSize: 22.sp,) ),
                      SizedBox(height: 13.h,),
                      Text("Enter the code sent to your phone \n number to verify your account", textAlign: TextAlign.center,style: kBold400.copyWith(fontSize: 14.sp, color: fadedText)),
                      SizedBox(height: 46.h,),
                      Container(

                        child: PinPut(
                          fieldsCount: 6,
                          onSubmit: (String pin) {
                            setState(() {
                              // _enableBtn = true;
                            });
                          },
                          eachFieldHeight: 56.h,
                          focusNode: _pinPutFocusNode,
                          controller: _otpController,
                          submittedFieldDecoration: _pinPutDecoration.copyWith(
                            // borderRadius: BorderRadius.circular(20.0),
                          ),
                          selectedFieldDecoration: _pinPutDecoration,
                          followingFieldDecoration: _pinPutDecoration.copyWith(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color:kTitleTextfieldColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 8.h),
                _hideResendButton  ?     Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Resend code in ",style: kBold400.copyWith(fontSize: 14.sp,)),
                      _getTimerText,
                    ],
                  ),
                ) : TextButton(

                    onPressed: (){

                }, child: Center(child: Text("Resend Code", style: kBold400.copyWith(fontSize: 14.sp, color: blue)))),

                SizedBox(height: 30.h),
                CustomButton(text: "Verify", type:  ButtonType.outlined, textColor: Colors.white,  onPressed:  (){

                  if(_otpController.text.length == 6){
                    pushNamedRoute(context, routeUpdateExpertise);

                  }else{
                    kShowSnackBar(context, "Enter OTP");
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }










  get _getTimerText {
    return Container(
      // height: 32,
      child: new Offstage(
        offstage: !_hideResendButton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OtpTimer(_controller, 14.sp, blue )
          ],
        ),
      ),
    );
  }



  Future<Null> _startCountdown() async {
    setState(() {
      _hideResendButton = true;
      totalTimeInSeconds = time;
    });
    _controller.reverse(
        from: _controller.value == 0.0 ? 1.0 : _controller.value);
  }
}