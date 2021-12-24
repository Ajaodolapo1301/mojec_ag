

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mojec_agent/core/constants/key_constants.dart';
import 'package:mojec_agent/core/constants/text_style_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';

class UploadDocumentWidget extends StatefulWidget {

  const UploadDocumentWidget({Key? key,}) : super(key: key);

  @override
  _UploadDocumentWidgetState createState() => _UploadDocumentWidgetState();
}

class _UploadDocumentWidgetState extends State<UploadDocumentWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height - (height - 270),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25)
          )
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: CustomDraggingHandle()),
          SizedBox(height: 20.h,),
        Text("Document to upload", style: kBold400.copyWith(fontSize: 18.h,),),
          SizedBox(height: 20.h,),
        DocWidget(image: "$imagePath/auth/certificate.svg", text: "Certification"),
          SizedBox(height: 5.h,),
          Divider(),
          SizedBox(height: 5.h,),
          DocWidget(image: "$imagePath/auth/id.svg", text: "Valid Id Card ")
        ],
      ),
    );
  }
}


class DocWidget extends StatelessWidget {
  final String image;
  final String text;
  const DocWidget({Key? key, required this.image, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          // height: 38.h,
          // width: 38.w,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
         color: Color(0xffE4EAF1),
            shape: BoxShape.circle,

          ),

          child: SvgPicture.asset(image, ),
        ),
        SizedBox(width: 10,),
        Text(text, style: kBold400.copyWith(color: blue),)
      ],
    );
  }
}

class CustomDraggingHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 30,
      decoration: BoxDecoration(color: Color(0xffC4C4C4), borderRadius: BorderRadius.circular(16)),
    );
  }
}