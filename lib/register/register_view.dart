import 'package:bce_app/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  var registerController = Get.put(RegisterController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Color.fromRGBO(10, 101, 83, 1)),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: registerController.nameTextController,
                decoration: InputDecoration(
                  focusColor: Color.fromRGBO(10, 101, 83, 1),
                  labelText: "Name*",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: registerController.studnumTextController,
                decoration: InputDecoration(
                  focusColor: Color.fromRGBO(10, 101, 83, 1),
                  labelText: "Student Number*",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: registerController.emailTextController,
                decoration: InputDecoration(
                  focusColor: Color.fromRGBO(10, 101, 83, 1),
                  labelText: "Email*",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: registerController.pswTextController,
                decoration: InputDecoration(
                  focusColor: Color.fromRGBO(10, 101, 83, 1),
                  labelText: "Password*",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: registerController.checkpswTextController,
                decoration: InputDecoration(
                  focusColor: Color.fromRGBO(10, 101, 83, 1),
                  labelText: "Confirm Password*",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 60,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100), gradient: LinearGradient(colors: [Color.fromRGBO(10, 101, 83, 1), Colors.green])),
                child: MaterialButton(
                  onPressed: () {
                    if (registerController.pswTextController.text == registerController.checkpswTextController.text){
                      registerController.register();
                    }else{
                      ShowAlertMethod(context);
                    }

                  },
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),

            ],
          ),

      ),
    );
  }
  void ShowAlertMethod(BuildContext context){
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
