import 'package:bce_app/login/login_controller.dart';
import 'package:bce_app/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  var loginController = Get.put(LoginController());
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30,0,30,0),
        child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('LOGIN',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color:Color.fromRGBO(10, 101, 83, 1)
                  ),),
                  SizedBox(height: 25,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        focusColor: Color.fromRGBO(10, 101, 83, 1),
                        labelText: "Enter your University email",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                    ),
                    controller: loginController.emailTextController,
                  ),
                  SizedBox(height: 25,),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                        labelText: "Enter Password",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                          onTap: (){},
                            child: Icon(hidePassword? Icons.visibility_off: Icons.visibility)),
                    ),
                    controller: loginController.pwdTextController,
                  ),
                  SizedBox(height: 25,),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(colors: [Color.fromRGBO(10, 101, 83, 1),Colors.green])
                    ),
                    child: MaterialButton(
                      onPressed: (){
                        loginController.login();
                        },
                      child: Text('LOGIN',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text('Dont have an account?'),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => RegisterPage());
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
      ),



    );
  }
}
