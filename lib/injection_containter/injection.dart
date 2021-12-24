
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mojec_agent/core/network/network_info.dart';



final locator = GetIt.instance;

Future <void> init() async{





  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  locator.registerLazySingleton(() => Hive);

  locator.registerLazySingleton(() => InternetConnectionChecker());
}
