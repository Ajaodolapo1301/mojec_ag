

import 'package:flutter/material.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';
import 'package:mojec_agent/core/utils/widgets/app_app_bar.dart';
import 'package:mojec_agent/core/utils/widgets/custom_button.dart';
import 'package:mojec_agent/core/utils/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isVisiblePassword = true;
  var password;
  TextEditingController controller  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppAppBar(
        titleText: "Change Password",
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.h),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            CustomTextField(

              textEditingController: controller,
              obscureText: isVisiblePassword,
              header: "Current password",
              hint: "*********",
              validator: (v){
                if(v!.length < 6){
                  return "Password should be at least 6 character ";
                }else if(v.isEmpty) {
                  return "password is Required";
                }
                password = v;
                return null;
              },


              suffix: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisiblePassword = !isVisiblePassword;
                      });
                    },
                    child: Text(
                      isVisiblePassword ? "SHOW" :  "HIDE",
                      style: TextStyle(fontSize: 10, color: blue),
                    ),
                  ),

                ],
              ),
              type: FieldType.password,

            ),

            CustomTextField(

              textEditingController: controller,
              obscureText: isVisiblePassword,
              header: "New password",
              hint: "*********",
              validator: (v){
                if(v != controller.text) {
                  return "Password do not match ";
                }
                password = v;
                return null;
              },
              suffix: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisiblePassword = !isVisiblePassword;
                      });
                    },
                    child: Text(
                      isVisiblePassword ? "SHOW" :  "HIDE",
                      style: TextStyle(fontSize: 10, color: blue),
                    ),
                  ),

                ],
              ),
              type: FieldType.password,

            ),

            CustomTextField(

              textEditingController: controller,
              obscureText: isVisiblePassword,
              header: "Confirm new password",
              hint: "*********",
              validator: (v){
                if(v != controller.text) {
                  return "Password do not match ";
                }
                password = v;
                return null;
              },
              suffix: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisiblePassword = !isVisiblePassword;
                      });
                    },
                    child: Text(
                      isVisiblePassword ? "SHOW" :  "HIDE",
                      style: TextStyle(fontSize: 10, color: blue),
                    ),
                  ),

                ],
              ),
              type: FieldType.password,

            ),
            SizedBox(height:60.h),
            CustomButton(text: "Save", type:  ButtonType.outlined, textColor: Colors.white,
                onPressed:  (){


                }),
            SizedBox(height:15.h),
            CustomButton(text: "Cancel", type:  ButtonType.filled, textColor:blue,
                onPressed:  (){


                }),
          ],
        ),
      ),
    );
  }
}
