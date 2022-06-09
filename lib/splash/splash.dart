import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 101, 83, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage('asset/bce_logo.png'),color: Colors.white,height: 120,width: 120,),
            SizedBox(height: 15,),
            Text('의생명융합공학부',
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
