import 'package:bce_app/main/main_view.dart';
import 'package:bce_app/register/register_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetWorkHandler{


  static Future<String> loginpost(var body, String endpoint) async{
    http.Response response_login = await http.post(builderUrl(endpoint),body:body,headers: {"content-type":"application/json"});
    print(response_login.statusCode);
    print(body);
    print(response_login.body);
    if (response_login.statusCode ==200){
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
      print('alreay have an account. please Sign up with a different account');
    }

    return response_register.body;

  }

  static Uri builderUrl(String endpoint){
    String host = 'http://10.125.218.14:8088/';
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static void ShowAlertMethod(BuildContext context) {
     var alert =AlertDialog(
      title: Center(child: Text('Warning',style: TextStyle(color: Colors.red),)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Passwords Dont Match!'),
          Text('Please enter Confirm Password again')
        ],
      ),
      actions: <Widget>[
        TextButton(onPressed: (){
          Get.back();
        }, child: Text('Ok',style: TextStyle(color: Color.fromRGBO(10, 101, 83, 1)),))
      ],
    );
    showDialog(context: context, builder: (BuildContext context){return alert;});
  }



}
