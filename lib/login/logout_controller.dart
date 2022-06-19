import 'package:bce_app/network_handler.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController{
  void logout()async{
    var response = NetWorkHandler.logoutpost('accounts/logout/');
  }
}