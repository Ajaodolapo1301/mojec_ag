import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mojec_agent/core/animation/fade_route.dart';
import 'package:mojec_agent/core/animation/size_route.dart';



Future<T> pushToWihRouteAndNavKey<T>(GlobalKey<NavigatorState> navKey,Route? route ) async{
  return await navKey.currentState!.push(route!);
}

Future<T> pushToWithNavKey<T>(GlobalKey<NavigatorState> navKey, Widget page, [PushStyle? pushStyle]) async{
  return await navKey.currentState!.push(
      pushStyle == PushStyle.cupertino
          ? CupertinoPageRoute(builder: (context) => page)
          : MaterialPageRoute(builder: (context) => page));
}

// Future<T> pushToWithRoute<T>(BuildContext context, Route? route) async {
//   return await Navigator.push<T>(context, MaterialPageRoute(builder: (context) => page));
// }

Future<T> pushReplacementToWithRoute<T>(BuildContext context, Route route) async {
  return await Navigator.pushReplacement(context, route);
}

Future<T?> pushTo<T>(BuildContext context, Widget page,
    [PushStyle? pushStyle]) async {
  return await Navigator.push<T>(
      context,
      pushStyle == PushStyle.cupertino
          ? CupertinoPageRoute(builder: (context) => page)
          : MaterialPageRoute(builder: (context) => page));
}


// Future pushWithAnimTo(BuildContext context, Widget page,
//     [PushStyle? pushStyle]) async {
//   return await Navigator.push<T>(
//       context,
//       pushStyle == PushStyle.cupertino
//           ? CupertinoPageRoute(builder: (context) => page)
//           : SizeRoute(page: page));
// }

// Future<T> pushWithFadeTo<T>(BuildContext context, Widget page,
//     [PushStyle? pushStyle]) async {
//   return await Navigator.push<T?>(
//       context,
//
//       // pushStyle == PushStyle!.cupertino
//       //     ? CupertinoPageRoute(builder: (context) => page)
//       //     : FadeRoute(page: page));
// }
Future<T> pushReplacementTo<T>(BuildContext context, Widget page, [PushStyle? pushStyle]) async {
  return await Navigator.pushReplacement(
      context, pushStyle == PushStyle.cupertino
      ? CupertinoPageRoute(builder: (context) => page)
      : MaterialPageRoute(builder: (context) => page));
}

Future pushNamedRoute(BuildContext context, String route, {Object? args}) async {
  return await Navigator.pushNamed(context, route, arguments:args );
}


void pushToAndClearStack(BuildContext context, Widget page) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page), (route) => false);
}

void pop<T>(BuildContext context, [T? value]) {
  return Navigator.pop<T>(context, value);
}

enum PushStyle { material, cupertino }

class CustomRoutes {
  static Route fadeIn(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, page) {
        var begin = 0.0;
        var end = 1.0;
        var curve = Curves.easeInExpo;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return FadeTransition(
          opacity: animation.drive(tween),
          child: page,
        );
      },
    );
  }

  static Route slideIn(Widget page) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, page) {
        var begin = Offset(10, 0);
        var end = Offset.zero;
        var curve = Curves.easeInExpo;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: page,
        );
      },
    );
  }

  static Route slideUp(Widget page) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds:300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, page) {
        var begin = Offset(0, 1);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: page,
        );
      },
    );
  }

}

GestureDetector backButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      pop(context);
    },
    child: const Align(
      alignment: Alignment.centerLeft,
      child: Icon(
        Icons.arrow_back,
        size: 20,
      ),
    ),
  );
}

