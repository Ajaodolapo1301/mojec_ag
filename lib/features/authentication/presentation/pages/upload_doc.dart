import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:mojec_agent/core/constants/text_style_constants.dart';
import 'package:mojec_agent/core/utils/function/bottom_sheet/bottom_sheet.dart';
import 'package:mojec_agent/core/utils/navigation/navigator.dart';
import 'package:mojec_agent/core/utils/navigation/route_generator.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';
import 'package:mojec_agent/core/utils/widgets/custom_button.dart';
import 'package:mojec_agent/core/utils/widgets/header.dart';
import 'package:mojec_agent/core/widget/loading_overlay_widget.dart';
import 'package:mojec_agent/features/authentication/presentation/widget/title_widget.dart';

class UploadDocument extends StatefulWidget {
  const UploadDocument({Key? key}) : super(key: key);

  @override
  _UploadDocumentState createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  var accountName;
  var email;
  var phone;
  var password;
  bool isVisiblePassword = true;
  @override
  Widget build(BuildContext context) {

    return LoadingOverlayWidget(
      loading: false,
      child: Scaffold(

        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.h),
            // width: double.infinity,
            child: Column(
              children: [

                SizedBox(height:20.h),
                Container(

                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(
                        color: blue,
                        preferredActionOnBackPressed: (){
                          pop(context);
                        },
                        text: "",

                      ),
                      SizedBox(height: 25.h,),
                      TitleWidget(
                        mainText: "Upload Relevant Documents",

                      ),

                      SizedBox(height:55.h),
                      Column(
                        children: [


                          Center(
                            child: InkWell(
                              onTap: (){
                                showUploadDoc(context: context);
                              },
                              child: DottedBorder(
                                color: kTitleTextfieldColor,
                                strokeWidth: 1,
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 40,),
                                  child: Column(
                                    children: [
                                      Text("Tap to add images to upload", style: kBold400.copyWith(color: blue, fontSize: 14.sp),),
                                      SizedBox(height:16.h),
                                      Text("JPG, PNG, PDF smaller than 10MB",  style: kBold400.copyWith(color: fadedText, fontSize: 12.sp),)
                                    ],
                                  ),
                                )
                              ),
                            ),
                          ),





                        ],
                      ),


                    ],
                  ),
                ),
                Spacer(),
                CustomButton(text: "Next", type:  ButtonType.outlined, textColor: Colors.white,
                    onPressed:  (){
                      pushNamedRoute(context, routeBvnVerification);

                    }),

              ],
            ),
          ),
        ),
      ),
    );
  }

}