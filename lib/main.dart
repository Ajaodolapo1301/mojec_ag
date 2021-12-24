

import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:mojec_agent/core/GlobalState/app_state.dart';
import 'package:provider/provider.dart';

import 'core/GlobalState/base_state.dart';
import 'core/utils/navigation/route_generator.dart';
import 'injection_containter/injection.dart' as di;

final sl = GetIt.instance;
Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();


  runZonedGuarded<Future<void>>(()async {
    runApp(

        DevicePreview(
          enabled: false,
          builder: (context) =>   MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => BaseViewModel()),
              ChangeNotifierProvider(create: (_) => AppState()),

            ],
            child: const MyApp(

            ),
          ),

        )

    );

  }, (error, stackTrace) async{


  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mojec',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'HUM777',

          ),
          initialRoute: '/',

          onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        )
    );
  }
}