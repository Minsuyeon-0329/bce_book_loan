import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bce/bce_controller.dart';

class DetailPage extends StatelessWidget {
  BCEController _bcecontroller = Get.put(BCEController());

  int index = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('도서 정보'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(10, 101, 83, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Image.network(_bcecontroller.photoList[0].books[index]['imange_url'], height: 240, width: 160, fit: BoxFit.contain),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 220,
                        child: Text(
                          '${_bcecontroller.photoList[0].books[index]['title']}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '저자: ${_bcecontroller.photoList[0].books[index]['author']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text('출판사: ${_bcecontroller.photoList[0].books[index]['publisher']}', style: TextStyle(fontSize: 16)),
                      // Text('${_bcecontroller.photoList[0].books[index]['qr_code']}'),
                      // Text('${_bcecontroller.photoList[0].books[index]['content']}'),
                      Text('출판 연도: ${_bcecontroller.photoList[0].books[index]['published_at']}', style: TextStyle(fontSize: 16)),
                      Text('대여 가능 도서: ${_bcecontroller.photoList[0].books[index]['quantity']}', style: TextStyle(fontSize: 16)),
                      Text('대출 중인 도서: ${_bcecontroller.photoList[0].books[index]['taken']}', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                )
              ],
            ),
            Divider(),
            Column(
              children: [
                Text(
                  '줄거리',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                Divider(),
                Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: SingleChildScrollView(child: Text('${_bcecontroller.photoList[0].books[index]['content']}', style: TextStyle(fontSize: 17)))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
