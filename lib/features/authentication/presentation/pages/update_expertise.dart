
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







class UpdateExpertise extends StatefulWidget {
  const UpdateExpertise({Key? key}) : super(key: key);

  @override
  _UpdateExpertiseState createState() => _UpdateExpertiseState();
}

class _UpdateExpertiseState extends State<UpdateExpertise> {
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
                          mainText: "Update your Expertise",

                        ),

                        SizedBox(height:34.h),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [



                              CustomTextField(

                                header: "Expertise",
                                hint: "Electrical Work",
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

                                textEditingController: controller,
                                header: "Description",
                                hint: "Additional Information...",
                                maxLines: 7,
                                minLines: 7,
                                maxLength: 200,

                                type: FieldType.multiline,

                              ),
                              SizedBox(height:19.h),


                              SizedBox(height:48.h),

                              CustomButton(text: "Next", type:  ButtonType.outlined, textColor: Colors.white,
                                  onPressed:  (){
                                    // if(_formKey.currentState!.validate()){
                                    //
                                    //
                                    // }
                                    pushNamedRoute(context, routeUploadDocument);
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

