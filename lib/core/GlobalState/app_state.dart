
import 'package:mojec_agent/core/GlobalState/base_state.dart';


class AppState extends BaseViewModel{





  // timeoutDialog(context){
  //   Platform.isIOS ?
  //   MyUtils.showIosAlerDialog(text: "Service Timeout",context: context,  onClose: (){
  //     final box = Hive.box("user");
  //
  //     box.put('user',null);
  //     pop(context);
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => LoginPage()),
  //             (Route<dynamic> route) => false);
  //   }) :
  //   MyUtils.showAlertDialog(text: "Service Timeout",context: context,  onClose: (){
  //     final box = Hive.box("user");
  //
  //     box.put('user',null);
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => LoginPage()),
  //             (Route<dynamic> route) => false);
  //   });
  // }
  //
  //
  //
  //
  // successDialog(context, message, VoidCallback onclose){
  //   Platform.isIOS ?
  //   MyUtils.showIosAlerDialog(text: message,context: context,  onClose: onclose) :
  //   MyUtils.showAlertDialog(text: message,context: context,  onClose: onclose);
  // }
}