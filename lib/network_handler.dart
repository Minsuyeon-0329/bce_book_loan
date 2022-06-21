import 'dart:convert';

import 'package:bce_app/login/login.dart';
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
  static List<String> user_borrow = [];
  static List<String> subBorrow = [];
  static List<String> subBorrow1 = [];
  static List<String> subBorrow2 = [];
  static List<String> subBorrow3 = [];
  static List<String> subBorrow4 = [];
  static int borrow_len = 0;

  static Future<String> logoutpost(String endpoint) async {
    http.Response response_logout = await http.post(builderUrl(endpoint), headers: {"content-type": "application/json"});
    return response_logout.body;
  }

  static Future<String> loginpost(var body, String endpoint) async {
    var loginController = Get.put(LoginController());
    http.Response response_login = await http.post(builderUrl(endpoint), body: body, headers: {"content-type": "application/json"});

    if (response_login.statusCode == 200) {
      userget('get_user/?email=${loginController.emailTextController.text}');
      Get.to(() => MainViewPage());
    } else {
      Get.to(() => RegisterPage());
    }
    return response_login.body;
  }

  static Future<String> registerpost(var body, String endpoint) async {
    http.Response response_register = await http.post(builderUrl(endpoint), body: body, headers: {"content-type": "application/json"});

    if (response_register.statusCode == 201) {
      Get.to(() => LoginPage());
    } else {
      openSnackbar();
      print('already have an account. please Sign up with a different account');
    }

    return response_register.body;
  }

  static Future<String> userget(String endpoint) async {
    RxList userInfo = <UserModel>[].obs;

    http.Response response_user = await http.get(builderUrl(endpoint), headers: {"content-type": "application/json"});
    if (response_user.statusCode == 200) {
      UserModel _user = UserModel.fromJson(jsonDecode(utf8.decode(response_user.bodyBytes)));
      userInfo.clear();
      userInfo.add(UserModel(usermodel: _user.usermodel));

      subBorrow = [];
      subBorrow1 = [];
      subBorrow2 = [];
      subBorrow3 = [];
      subBorrow4 = [];
      user_name = userInfo[0].usermodel[0]['fields']['bce_name'];
      user_email = userInfo[0].usermodel[0]['fields']['email'];
      user_num = userInfo[0].usermodel[0]['fields']['bce_digit'];
      subBorrow = (userInfo[0].usermodel[0]['fields']['borrowed_list'].split('['));
    }
    for (int i = 0; i < subBorrow.length; i++) {
      if (subBorrow[i].length >= 2) {
        subBorrow1.insert(0, subBorrow[i]);
      }
    }

    for (int i = 0; i < subBorrow1.length; i++) {
      subBorrow2.insertAll(0, subBorrow1[i].split(']'));
    }
    for (int i = 0; i < subBorrow2.length; i++) {
      if (subBorrow2[i].length >= 5) {
        subBorrow3.insertAll(0, subBorrow2[i].split(','));
      }
    }
    for (int i = 0; i < subBorrow3.length; i++) {
      if (subBorrow3[i].length >= 5) {
        subBorrow4.insertAll(0, subBorrow3[i].split('"'));
      }
    }

    for (int i = 0; i < subBorrow4.length; i++) {
      if (subBorrow4[i].length >= 2) {
        user_borrow.insert(0, subBorrow4[i]);
      }
    }
    borrow_len = user_borrow.length ~/ 6;

    /*List<String> sub1 = [];
    List<String> sub2 = [];
    List<String> sub3 = [];
    List<String> sub4 = [];
    print(user_borrow);
    print('testingggggggggg');
    var test = jsonDecode('"\" + ${user_borrow[0]}\${user_borrow[4]}');
    print(test);
    for (int k = 0; k < borrow_len; k++) {
      sub1.insertAll(0, user_borrow[k * 6].split("\\"));
      sub2.insertAll(0, user_borrow[k * 6 + 4].split('\\'));
      for (int i = 0; i < sub1.length; i++) {
        if (sub1[i].length >= 2) {
          sub3.insert(0, sub1[i]);
        }
      }
      for (int i = 0; i < sub2.length; i++) {
        if (sub2[i].length >= 2) {
          sub4.insert(0, sub2[i]);
        }
      }
      print('---------------');
      print(sub1);
      print(sub2);
      print(sub3);
      List<int> lint1 = sub3.map(int.parse).toList();
      List<int> lint2 = sub4.map(int.parse).toList();
      user_borrow[k * 6] = utf8.decode(Uint8List.fromList(lint1));
      user_borrow[k * 6 + 4] = utf8.decode(Uint8List.fromList(lint2));
    }
    print(user_borrow);*/

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
