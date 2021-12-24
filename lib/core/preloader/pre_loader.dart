
import 'package:flutter/material.dart';


class PreLoader extends StatelessWidget {
  const PreLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
      // Spacer(),

      CircularProgressIndicator(),
      // Spacer(),

    ],);

    // Center(
    //   child: Container(
    //     width: 90.0,
    //     alignment: Alignment.center,
    //     child: Image(
    //       image: AssetImage('assets/images/logo_animation.gif'),
    //     ),
    //   ));
  }
}