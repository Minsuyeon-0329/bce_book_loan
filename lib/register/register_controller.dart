import 'package:bce_app/register/register_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../network_handler.dart';


class RegisterController extends GetxController{
  TextEditingController nameTextController = TextEditingController();
  TextEditingController studnumTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController pswTextController = TextEditingController();
  TextEditingController checkpswTextController = TextEditingController();

  void register()async{
    RegisterModel registerModel= RegisterModel(
      bceName: nameTextController.text,
      bceDigit: int.parse(studnumTextController.text),
      email: emailTextController.text,
      password: pswTextController.text
    );

    var response = await NetWorkHandler.registerpost(registerModelToJson(registerModel), "accounts/signup/");
    print(response);


  }
}