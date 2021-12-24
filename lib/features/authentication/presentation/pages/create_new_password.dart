
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:mojec_agent/core/constants/text_style_constants.dart';
import 'package:mojec_agent/core/utils/navigation/navigator.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';
import 'package:mojec_agent/core/utils/widgets/custom_button.dart';
import 'package:mojec_agent/core/utils/widgets/custom_text_field.dart';
import 'package:mojec_agent/core/utils/widgets/header.dart';
import 'package:mojec_agent/core/widget/loading_overlay_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mojec_agent/features/authentication/presentation/widget/title_widget.dart';







class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  _CreateNewPasswordState createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
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
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(height:20.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.h),
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
                          mainText: "Create new password",

                        ),

                        SizedBox(height:13.h),
                        Text("Use a different password from the previous\n one used for this account", style: kBold400.copyWith(fontSize: 14.sp, color: fadedText),),
                        SizedBox(height:34.h),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [


                              CustomTextField(

                                textEditingController: controller,
                                obscureText: isVisiblePassword,
                                header: "Password",
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
                                header: "Confirm Password",
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



                              SizedBox(height:19.h),



                              // FlutterPwValidator(
                              //     controller: controller,
                              //     minLength: 7,
                              //     uppercaseCharCount: 1,
                              //     numericCharCount: 1,
                              //     specialCharCount: 1,
                              //     width: 400,
                              //     height: 150,
                              //     onSuccess: (){
                              //       setState(() {
                              //
                              //
                              //
                              //       });
                              //
                              //     }
                              // ),
                              SizedBox(height:48.h),

                              CustomButton(text: "Reset password", type:  ButtonType.outlined, textColor: Colors.white,
                                  onPressed:  (){
                                    if(_formKey.currentState!.validate()){
                                      // register();

                                    }
                                  }),


                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



// void register () async{
//   var res = await loginState.register(email: email, password: password, home_address: "", dob: "", phone: phone, full_name: accountName, role_id: "1", );
//   res.fold((l) => kShowSnackBar(context, l.props.first.toString()),
//
//
//           (r) {
//         print("rara$r.");
//         pushTo(context, OTPPage(user: r,));
//       }
//
//   );
// }
}

