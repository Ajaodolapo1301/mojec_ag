

import 'package:flutter/material.dart';
import 'package:mojec_agent/features/Request/request_details.dart';
import 'package:mojec_agent/features/authentication/presentation/pages/bvn_page.dart';
import 'package:mojec_agent/features/authentication/presentation/pages/create_new_password.dart';
import 'package:mojec_agent/features/authentication/presentation/pages/email_sent.dart';
import 'package:mojec_agent/features/authentication/presentation/pages/login.dart';
import 'package:mojec_agent/features/authentication/presentation/pages/on_boarding.dart';
import 'package:mojec_agent/features/authentication/presentation/pages/register.dart';
import 'package:mojec_agent/features/authentication/presentation/pages/reset_password.dart';
import 'package:mojec_agent/features/authentication/presentation/pages/update_expertise.dart';
import 'package:mojec_agent/features/authentication/presentation/pages/upload_doc.dart';
import 'package:mojec_agent/features/authentication/presentation/pages/verify_phone.dart';
import 'package:mojec_agent/features/dashBoard/pages/home.dart';
import 'package:mojec_agent/features/notification/notification.dart';
import 'package:mojec_agent/features/profile/change_pass.dart';

import 'navigator.dart';



const String initialPage = '/';
const String onBoardingPage = '/onBoarding';
const String routeLogin = '/login-page';
const String routeCreateNewPassword = '/create-new-password';
const String routeVerifyPhone = '/verify-phone';
const String routeUpdateExpertise = "/update-expertise";
const String routeUploadDocument = "/upload-document";
const String routeBvnVerification = "/bvn-verification";
const String routeResetPassword = "/reset-password";
const String routeEmailSent = "/email-sent";
const String routeHome = "/dashboard";
const String routeNotification = "/notification";
const String routeChangePassword = "/change-password";
const String routeRequestDetails = "/request-details";

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case initialPage:
        return MaterialPageRoute(
          builder: (_) =>  const RegisterPage(),
        );
      case routeLogin:
        return CustomRoutes.fadeIn(LoginPage());
      case routeCreateNewPassword:
        return CustomRoutes.slideIn(CreateNewPassword());
      case routeVerifyPhone:
        return CustomRoutes.slideIn(VerifyPhone());

      case routeUpdateExpertise:
        return    MaterialPageRoute(
            builder: (_) =>  UpdateExpertise(),
          );
      case routeUploadDocument:
        return MaterialPageRoute(
          builder: (_) =>  UploadDocument(),
        );
      case routeBvnVerification:
        return MaterialPageRoute(
          builder: (_) =>  BvnVerification(),
        );

      case routeResetPassword:
        return MaterialPageRoute(
          builder: (_) =>  ResetPassowrd(),
        );
      case routeEmailSent:
        return MaterialPageRoute(
          builder: (_) =>  EmailSent(),
        );

      case routeHome:
        return MaterialPageRoute(
          builder: (_) =>  Home(),
        );
      case routeNotification:
        return CustomRoutes.fadeIn(NotificationPage());
      case routeChangePassword:
        return CustomRoutes.fadeIn(ChangePassword());
      case routeRequestDetails:
        return MaterialPageRoute(
          builder: (_) =>  RequestDetails(),
        );
      default:
        return _errorRoute();
    }
  }


  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
