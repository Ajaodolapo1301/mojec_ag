


import 'package:flutter/material.dart';
import 'package:mojec_agent/core/constants/text_style_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class WalletWidget extends StatelessWidget {

  final String? text;
  final String? subText;
  final Widget? withdrawButton;
  const WalletWidget({Key? key, this.text, this.subText, this.withdrawButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23, bottom: 23, left: 17, right: 20),
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
                  Text(text!, style: kBold400.copyWith(color: Colors.white),),

                  SizedBox(height: 10.h,),
                  Text(subText!, style: kBold700.copyWith(fontSize: 18.sp, color: Colors.white),),
                ],
              ),
              withdrawButton?? SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
