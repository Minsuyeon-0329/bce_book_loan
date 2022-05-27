import 'package:flutter/material.dart';

class AskUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('의생명융합공학부', style: TextStyle(color: Colors.black, fontSize: 30)),
            Container(height: 15),
            Text('데이터사이언스', style: TextStyle(color: Colors.black, fontSize: 30)),
            Container(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text('유닉스 기초', style: TextStyle(color: Colors.black, fontSize: 30)),
              Container(width: 15),
              Text('Daaam', style: TextStyle(color: Colors.black, fontSize: 30))
            ]),
            Container(height: 15),
            Text('민수연, 박지우, 이재강', style: TextStyle(color: Colors.black, fontSize: 30))
          ],
        ));
  }
}
