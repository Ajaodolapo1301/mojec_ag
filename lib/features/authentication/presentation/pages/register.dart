



import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
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
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                          mainText: "Sign up!",

                        ),

                        SizedBox(height:34.h),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                header: "Name",
                                hint: "John Doe",
                                type: FieldType.email,
                                validator: (v){
                                  if(v!.isEmpty){
                                    //Todo validate first and last name
                                    return "Name is Required";
                                  }
                                  accountName = v;
                                  return null;
                                },

                              ),


                              CustomTextField(

                                header: "Email",
                                hint: "ajaodlp@xyz.com",
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



                              CustomTextField(

                                header: "Phone Number",
                                hint: "08065083711",
                                validator: (v){
                                  if(v!.isEmpty){

                                    return "Phone is Required";
                                  }
                                  phone = v;
                                  return null;
                                },
                                type: FieldType.phone,
                                textInputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  new LengthLimitingTextInputFormatter(11),
                                ],

                              ),

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

                              CustomButton(text: "Next", type:  ButtonType.outlined, textColor: Colors.white,
                                  onPressed:  (){
                                    pushNamedRoute(context, routeHome);
                                    // if(_formKey.currentState!.validate()){
                                    //   // register();
                                    //
                                    // }
                                  }),
                              SizedBox(height:27.h),

                              Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: "Existing user? ",
                                    style: TextStyle(
                                      color: Color(0xff999291),

                                      fontSize: 15,
                                    ),
                                    children: [
                                      TextSpan(
                                        recognizer: new TapGestureRecognizer()..onTap = () {
                                          pushNamedRoute(context, routeLogin);

                                        },
                                        text: "Log in ",
                                        style: kBold400.copyWith(

                                          color: blue,
                                          fontSize: 14.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),

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

