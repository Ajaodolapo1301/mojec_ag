





import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mojec_agent/core/constants/text_style_constants.dart';
import 'package:mojec_agent/core/utils/navigation/navigator.dart';
import 'package:mojec_agent/core/utils/navigation/route_generator.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';
import 'package:mojec_agent/core/utils/widgets/custom_button.dart';
import 'package:mojec_agent/core/utils/widgets/custom_text_field.dart';
import 'package:mojec_agent/core/utils/widgets/header.dart';
import 'package:mojec_agent/core/widget/loading_overlay_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mojec_agent/features/authentication/presentation/widget/title_widget.dart';







class BvnVerification extends StatefulWidget {
  const BvnVerification({Key? key}) : super(key: key);

  @override
  _BvnVerificationState createState() => _BvnVerificationState();
}

class _BvnVerificationState extends State<BvnVerification> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  final testData = ["Your relevant documents", "Your passport photograph" ];
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
            width: double.infinity,
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
                        mainText: "BVN Verification",

                      ),

                      SizedBox(height:34.h),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [



                            CustomTextField(

                              header: "BVN Number",
                              hint: "0123456789",
                              type: FieldType.text,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return "Email is required";
                                } else if (!EmailValidator.validate(
                                    value.replaceAll(" ", "").trim())) {
                                  return "Email is invalid";
                                }
                                email = value;
                                return null;
                              },


                            ),
                            SizedBox(height:32.h),
                            Container(
                              width: 300.w,
                                child: Text("Please visit the Mojec office to be fully onboarded and activate your account. Make sure you have with you:", style: kBold400.copyWith(color: fadedText),)),
                            SizedBox(height:15.h),
                            OrderedList(testData),


                          ],
                        ),
                      )
                    ],
                  ),
                ),


                Spacer(),

                CustomButton(text: "Done", type:  ButtonType.outlined, textColor: Colors.white,
                    onPressed:  (){
                      // if(_formKey.currentState!.validate()){
                      //
                      //
                      // }

                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }


}


class OrderedList extends StatelessWidget {
OrderedList(this.texts);
final List<dynamic> texts;

@override
Widget build(BuildContext context) {
  var widgetList = <Widget>[];
  int counter = 0;
  for (var text in texts) {
    // Add list item
    counter++;
    widgetList.add(OrderedListItem(counter, text));
    // Add space between items
    widgetList.add(SizedBox(height: 5.0));
  }

  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widgetList);
}
}



class OrderedListItem extends StatelessWidget {
  OrderedListItem(this.counter, this.text);
  final int counter;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("• ", style: kBold400.copyWith(color: fadedText, fontSize: 20.sp)),
        Text(text, style: kBold400.copyWith(color: fadedText)),
      ],
    );
  }
}

