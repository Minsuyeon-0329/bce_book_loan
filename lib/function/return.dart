import 'package:bce_app/function/return_controller.dart';
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
  ReturnController returnController = Get.put(ReturnController());

  static bool returning = true;
  String? _qrInfo = '스캔하세요';
  bool _canVibrate = true;
  bool _camState = false;
  var qr;

  @override
  void initState() {
    super.initState();
    _init();
    qr = returnController.fetchPost();
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
      _camState = false;
      if (code != _qrInfo) {
        _qrInfo = code;
        returnController.qrInfo = _qrInfo;
        returnController.fetchPost();
        FlutterBeep.beep();
        if (_canVibrate) Vibrate.feedback(FeedbackType.heavy);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('QR_scanner'),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(10, 101, 83, 1),
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
                    style: const TextStyle(color: Colors.red),
                  ),
                  qrCodeCallback: (code) {
                    _qrCallback(code);
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
            returning
                ? const Center(
                    child: Text(
                    '스캔해주세요.',
                    textAlign: TextAlign.center,
                  ))
                : Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(itemBuilder: (context, index) {
                      itemCount:
                      2.compareTo(0);
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                            const Text(
                              '제목',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text('${returnController.qrlist[0].qrs[index]['fields']['title']}', style: const TextStyle(fontSize: 15)),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                returnController.Back();
                              },
                              child: Container(
                                decoration: BoxDecoration(color: const Color.fromRGBO(10, 101, 83, 1), borderRadius: BorderRadius.circular(30)),
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: const Center(child: Text('반납', style: TextStyle(fontSize: 15, color: Colors.white), textAlign: TextAlign.center)),
                              ),
                            ),
                          ]));
                    }))
          ],
        )));
  }
}
