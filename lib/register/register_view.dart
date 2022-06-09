import 'package:bce_app/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
        child: Center(
          child: Column(
            children: [
              Text(
                'Register',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Color.fromRGBO(10, 101, 83, 1)),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
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
                  onPressed: () {},
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text('Already have an account?'),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(() => LoginPage());
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
