import 'dart:convert';

import 'package:bce_app/main/main_view.dart';
import 'package:bce_app/register/register_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetWorkHandler{

  static Future<String> logoutpost(String endpoint) async{
    http.Response response_logout = await http.post(builderUrl(endpoint),headers: {"content-type":"application/json"});

    return response_logout.body;
  }


  static Future<String> loginpost(var body, String endpoint) async{
    String my_access_token = "";
    String my_refresh_token = "";

    http.Response response_login = await http.post(builderUrl(endpoint),body:body,headers: {"content-type":"application/json"});


    if (response_login.statusCode ==200){
      print(response_login.statusCode);
      print(response_login.body);

      my_access_token=jsonDecode(response_login.body)['access_token'];
      my_refresh_token=jsonDecode(response_login.body)['refresh_token'];
      Get.to(() => MainViewPage());
    }else{
      Get.to(()=>RegisterPage());
    }
    return response_login.body;

  }


  static Future<String> registerpost(var body, String endpoint) async{
    http.Response response_register = await http.post(builderUrl(endpoint),body:body,headers: {"content-type":"application/json"});
    print(response_register.statusCode);
    print(body);
    print(response_register.body);

    if (response_register.statusCode == 201){
      Get.to(()=>MainViewPage());
    }else{
      openSnackbar();
      print('alreay have an account. please Sign up with a different account');
    }

    return response_register.body;

  }


  static Uri builderUrl(String endpoint){
    String host = 'http://10.125.218.14:8088/';
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static void openSnackbar(){
    Get.snackbar(
        'ERROR',
        'Already have an account. Please Sign up with a different account!',
        snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      backgroundColor: Color.fromRGBO(10, 101, 83, 1),
      colorText: Colors.white





    );


  }



}
