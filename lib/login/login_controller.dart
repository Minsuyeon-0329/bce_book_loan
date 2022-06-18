import 'package:bce_app/login/login_model.dart';
import 'package:bce_app/network_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class LoginController extends GetxController{

   TextEditingController emailTextController = TextEditingController();
   TextEditingController pwdTextController = TextEditingController();
   void login()async{
      LoginModel loginModel= LoginModel(
          email: emailTextController.text,
          password: pwdTextController.text
      );

      var response = await NetWorkHandler.loginpost(loginModelToJson(loginModel), "accounts/login/");
      print(loginModelToJson(loginModel));
   }
}