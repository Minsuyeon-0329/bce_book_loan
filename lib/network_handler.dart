import 'dart:convert';

import 'package:bce_app/login/login_controller.dart';
import 'package:bce_app/main/main_view.dart';
import 'package:bce_app/register/register_view.dart';
import 'package:bce_app/user/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetWorkHandler {
  static String user_name = "";
  static String user_email = "";
  static int user_num = 0;
  static String user_borrow = "";

  static Future<String> logoutpost(String endpoint) async {
    http.Response response_logout = await http.post(builderUrl(endpoint), headers: {"content-type": "application/json"});
    return response_logout.body;
  }

  static Future<String> loginpost(var body, String endpoint) async {
    var loginController = Get.put(LoginController());
    http.Response response_login = await http.post(builderUrl(endpoint), body: body, headers: {"content-type": "application/json"});

    if (response_login.statusCode == 200) {
      print('response login check:');
      print(response_login.statusCode);
      print(response_login.body);

      userget('get_user/?email=${loginController.emailTextController.text}');
      Get.to(() => MainViewPage());
    } else {
      Get.to(() => RegisterPage());
    }
    return response_login.body;
  }

  static Future<String> registerpost(var body, String endpoint) async {
    http.Response response_register = await http.post(builderUrl(endpoint), body: body, headers: {"content-type": "text/plain"});
    print(response_register.statusCode);
    print(body);
    print(response_register.body);

    if (response_register.statusCode == 201) {
      Get.to(() => MainViewPage());
    } else {
      openSnackbar();
      print('already have an account. please Sign up with a different account');
    }

    return response_register.body;
  }

  static Future<String> userget(String endpoint) async {
    RxList userInfo = <UserModel>[].obs;
    print('in user get-------');

    http.Response response_user = await http.get(builderUrl(endpoint), headers: {"content-type": "application/json"});
    print(response_user.statusCode);
    print(response_user.body);
    if (response_user.statusCode == 200) {
      UserModel _user = UserModel.fromJson(jsonDecode(utf8.decode(response_user.bodyBytes)));
      userInfo.clear();
      userInfo.add(UserModel(usermodel: _user.usermodel));

      user_name = userInfo[0].usermodel[0]['fields']['bce_name'];
      user_email = userInfo[0].usermodel[0]['fields']['email'];
      user_num = userInfo[0].usermodel[0]['fields']['bce_digit'];
      user_borrow = userInfo[0].usermodel[0]['fields']['borrowed_list'];

      print('사용자 정보');
      print(userInfo[0].usermodel[0]['fields']['email']);
    }
    return response_user.body;
  }

  static Uri builderUrl(String endpoint) {
    String host = 'http://10.125.218.14:8088/';
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static void openSnackbar() {
    Get.snackbar('ERROR', 'Already have an account. Please Sign up with a different account!',
        snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 5), backgroundColor: Color.fromRGBO(10, 101, 83, 1), colorText: Colors.white);
  }
}
