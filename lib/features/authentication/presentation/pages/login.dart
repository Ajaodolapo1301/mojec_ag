






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







class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                          mainText: "Login to your account",

                        ),

                        SizedBox(height:34.h),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [



                              CustomTextField(

                                header: "Email",
                                hint: "ajaodlp@xyz.com",
                                type: FieldType.email,
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

                                textEditingController: controller,
                                obscureText: isVisiblePassword,
                                header: "Password",
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: (){

                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          child: Container(
                                            padding: EdgeInsets.all(7),
                                            child: Container(
                                              color: blue,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              shape: BoxShape.rectangle,
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Text("Remember me", style: kBold400.copyWith(fontSize: 14.sp, color: fadedText),)
                                    ],
                                  ),

                                  InkWell(
                                      onTap: (){
                                        pushNamedRoute(context, routeResetPassword);
                                      },
                                      child: Text("Forgot Password?", style: kBold400.copyWith(fontSize: 14.sp, color: blue),))
                                ],
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

                              CustomButton(text: "Login", type:  ButtonType.outlined, textColor: Colors.white,
                                  onPressed:  (){
                                    // if(_formKey.currentState!.validate()){
                                    //
                                    //
                                    // }
                                    pushNamedRoute(context, routeVerifyPhone);
                                  }),
                              SizedBox(height:27.h),

                              Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: "New user? ",
                                    style: TextStyle(
                                      color: fadedText,

                                      fontSize: 15,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: " Sign Up",
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

