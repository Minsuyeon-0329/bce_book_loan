import 'package:bce_app/book/detail.dart';
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

  static bool not_loan = true;
  static bool loan_return = true;
  String? _qrInfo = '스캔하세요';
  bool _canVibrate = true;
  bool _camState = false;
  var qr;

  @override
  void initState() {
    super.initState();
    _init();
    qr = qrcontroller.fetchPost();
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
        qrcontroller.qrInfo = _qrInfo;
        qrcontroller.fetchPost();
        not_loan = false;
        qrcontroller.returnState = true ? loan_return = false : loan_return = true;
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
            not_loan
                ? const Center(
                    child: Text(
                    '스캔해주세요.',
                    textAlign: TextAlign.center,
                  ))
                : Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(itemBuilder: (context, index) {
                      itemCount:
                      1.compareTo(0);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: loan_return
                            ? Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                                const Text(
                                  '제목',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text('${qrcontroller.qrlist[0].qrs[index]['fields']['title']}', style: const TextStyle(fontSize: 15)),
                                const SizedBox(height: 10),
                                const Text(
                                  '재고',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text('${qrcontroller.qrlist[0].qrs[index]['fields']['quantity']}', style: const TextStyle(fontSize: 15)),
                                const SizedBox(height: 20),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => DetailPage(), arguments: index);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(color: const Color.fromRGBO(10, 101, 83, 1), borderRadius: BorderRadius.circular(30)),
                                      height: 50,
                                      width: MediaQuery.of(context).size.width * 0.35,
                                      child:
                                          const Center(child: Text('상세 페이지', style: TextStyle(fontSize: 15, color: Colors.white), textAlign: TextAlign.center)),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      qrcontroller.Borrow();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(color: const Color.fromRGBO(10, 101, 83, 1), borderRadius: BorderRadius.circular(30)),
                                      height: 50,
                                      width: MediaQuery.of(context).size.width * 0.35,
                                      child: const Center(child: Text('대출', style: TextStyle(fontSize: 15, color: Colors.white), textAlign: TextAlign.center)),
                                    ),
                                  ),
                                ]),
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      not_loan = false;
                                      loan_return = true;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(30)),
                                    height: 50,
                                    width: MediaQuery.of(context).size.width * 0.35,
                                    child: const Center(child: Text('반납', style: TextStyle(fontSize: 15, color: Colors.white), textAlign: TextAlign.center)),
                                  ),
                                ),
                                SizedBox(height: 1000)
                              ])
                            : GestureDetector(
                                onTap: () {
                                  _camState = false;
                                },
                                child: Container(
                                  decoration: BoxDecoration(color: const Color.fromRGBO(10, 101, 83, 1), borderRadius: BorderRadius.circular(30)),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: const Center(child: Text('반납', style: TextStyle(fontSize: 15, color: Colors.white), textAlign: TextAlign.center)),
                                ),
                              ),
                      );
                    }))
          ],
        )));
  }
}
