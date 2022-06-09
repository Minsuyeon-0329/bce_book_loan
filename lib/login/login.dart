import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 300, 30,0),
        child: Center(
          child: Column(
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
              ),
              SizedBox(height: 25,),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Enter Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),

                )
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
                  onPressed: (){},
                  child: Text('LOGIN',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
