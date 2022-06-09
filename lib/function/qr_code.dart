import 'package:bce_app/function/qr_code_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get.dart';
import 'package:wakelock/wakelock.dart';

class QRCode extends StatefulWidget {
  @override
  _QRCode createState() => _QRCode();
}

class _QRCode extends State<QRCode> {
  QrCodeController qrcontroller = Get.put(QrCodeController());
  String? _qrInfo = '스캔하세요';
  bool _canVibrate = true;
  bool _camState = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    bool canVibrate = await Vibrate.canVibrate;
    setState(() {
      Wakelock.enable();
      _camState = true;
      _canVibrate = canVibrate;
      _canVibrate ? debugPrint('This device can vibrate') : debugPrint('This device cannot vibrate');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  _qrCallback(String? code) {
    setState(() {
      if (code != _qrInfo) {
        FlutterBeep.beep();
        if (_canVibrate) Vibrate.feedback(FeedbackType.heavy);
      }
      _camState = false;
      _qrInfo = code;
      qrcontroller.qrInfo = _qrInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('OR_scanner'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(10, 101, 83, 1),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.width * 0.15),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.7,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: QRBarScannerCamera(
                    onError: (context, error) => Text(
                      error.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                    qrCodeCallback: (code) {
                      _qrCallback(code);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  //Image.network(qrcontroller.photo,height: 100,width: 100,fit: BoxFit.contain),
                  SizedBox(height: 10),
                  const Text(
                    '제목',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  const Text(
                    '리액트를 다루는 기술',
                    style: TextStyle(fontSize: 15),
                  ),
                  //Text('${qrcontroller.qrlist[0].qrs[index]['title']}', style: TextStyle(fontSize: 15)),
                  SizedBox(height: 10),
                  const Text(
                    '재고',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  const Text(
                    '1',
                    style: TextStyle(fontSize: 15),
                  ),
                  //Text('${qrcontroller.qrlist[0].qrs[index]['quantity']}', style: TextStyle(fontSize: 15)),
                  SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    GestureDetector(
                      onTap: () {
                        qrcontroller.qrInfo = _qrInfo;
                      },
                      child: Container(
                        decoration: BoxDecoration(color: Color.fromRGBO(10, 101, 83, 1), borderRadius: BorderRadius.circular(30)),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Center(child: Text('상세 페이지', style: TextStyle(fontSize: 15, color: Colors.white), textAlign: TextAlign.center)),
                        //이거는 대출할때만 뜨게
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        qrcontroller.qrInfo = _qrInfo;
                      },
                      child: Container(
                        decoration: BoxDecoration(color: Color.fromRGBO(10, 101, 83, 1), borderRadius: BorderRadius.circular(30)),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Center(child: Text('대출', style: TextStyle(fontSize: 15, color: Colors.white), textAlign: TextAlign.center)),
                        //이거는 대출할때만 뜨게. 반납할때는 반납이라고 뜨게
                      ),
                    ),
                  ]),
                ]),
              ),
            ],
          ),
        ));
  }
}
