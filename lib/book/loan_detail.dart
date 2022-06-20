import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../function/qr_code_controller.dart';

class LoanDetailPage extends StatelessWidget {
  QrCodeController _qrtroller = Get.put(QrCodeController());

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
                Image.network(_qrtroller.qrlist[0].qrs[0]['fields']['imange_url'], height: 240, width: 160, fit: BoxFit.contain),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 220,
                        child: Text(
                          '${_qrtroller.qrlist[0].qrs[0]['fields']['title']}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '저자: ${_qrtroller.qrlist[0].qrs[0]['fields']['author']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text('출판사: ${_qrtroller.qrlist[0].qrs[0]['fields']['publisher']}', style: TextStyle(fontSize: 16)),
                      Text('출판 연도: ${_qrtroller.qrlist[0].qrs[0]['fields']['published_at']}', style: TextStyle(fontSize: 16)),
                      Text('대여 가능 도서: ${_qrtroller.qrlist[0].qrs[0]['fields']['quantity']}', style: TextStyle(fontSize: 16)),
                      Text('대출 중인 도서: ${_qrtroller.qrlist[0].qrs[0]['fields']['taken']}', style: TextStyle(fontSize: 16)),
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
                    child: SingleChildScrollView(child: Text('${_qrtroller.qrlist[0].qrs[0]['fields']['content']}', style: TextStyle(fontSize: 17)))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
