

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';

import 'dart:io';

const kBold700 = TextStyle(
    fontWeight: FontWeight.w700
);


const kBold600 = TextStyle(
    color: kTitleTextfieldColor,
    fontWeight: FontWeight.w600
);


const kBold500 = TextStyle(
  color: kTitleTextfieldColor,
    fontWeight: FontWeight.w500
);


TextStyle kBold400 = TextStyle(
    fontWeight: FontWeight.w400,
     fontSize: 14.sp,
);


Color getColor(int index, _processIndex ) {
  if (index == _processIndex) {
    return kTitleTextfieldColor;
  } else if (index < _processIndex) {
    return kTitleTextfieldColor;
  } else {
    return Colors.grey;
  }
}

Widget kAppBar(String label,  {bool showLead = true, bool cancel = false, showAction= false, VoidCallback? onPress}  ) {
  return  AppBar(
    elevation: 0,
    leading: showLead ?  IconButton(icon: Icon(Platform.isIOS ?  Icons.arrow_back_ios : Icons.arrow_back_outlined,  color: Colors.black,),onPressed: showLead ?  onPress : null): Container(),
    backgroundColor: Colors.white,
    actions: [
    showAction ? IconButton(icon: Icon(cancel ? Icons.close: Icons.more_vert, color: Colors.black,),  onPressed: cancel ? onPress : null): Container()
    ],
    centerTitle: true,
    title: Text(label,style:  kBold700.copyWith(
        color: Colors.black,
        fontSize: 20,
  )));
}

enum Pages{Order, Receiver, Review}