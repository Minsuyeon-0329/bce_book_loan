import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:wakelock/wakelock.dart';

class QR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(10, 101, 83, 1),
      ),
      home: QRCode(title: 'QR'),
    );
  }
}

class QRCode extends StatefulWidget {
  QRCode({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _QRCode createState() => _QRCode();
}

class _QRCode extends State<QRCode> {
  String? _qrInfo = '스캔하세요';
  bool _canVibrate = true;
  bool _camState = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  /// 초기화 함수
  _init() async {
    bool canVibrate = await Vibrate.canVibrate;
    setState(() {
      // 화면 꺼짐 방지
      Wakelock.enable();

      // QR 코드 스캔 관련
      _camState = true;

      // 진동 관련
      _canVibrate = canVibrate;
      _canVibrate ? debugPrint('This device can vibrate') : debugPrint('This device cannot vibrate');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// QR/Bar Code 스캔 성공시 호출
  _qrCallback(String? code) {
    setState(() {
      // 동일한걸 계속 읽을 경우 한번만 소리/진동 실행..
      if (code != _qrInfo) {
        FlutterBeep.beep(); // 비프음
        if (_canVibrate) Vibrate.feedback(FeedbackType.heavy); // 진동
      }
      _camState = false;
      _qrInfo = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.8,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: QRBarScannerCamera(
                    // 에러 발생시..
                    onError: (context, error) => Text(
                      error.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                    // QR 이 읽혔을 경우
                    qrCodeCallback: (code) {
                      _qrCallback(code);
                    },
                  ),
                ),
              ),

              /// 사이즈 자동 조절을 위해 FittedBox 사용
              //FittedBox(
              //    fit: BoxFit.fitWidth,
              //    child: Text(
              //      _qrInfo!,
              //      style: const TextStyle(fontWeight: FontWeight.bold),
              //    )),
              SizedBox(height: 15),
              Row(
                children: [
                  Image.asset(
                    'asset/test.jpg',
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.5 * (4 / 3),
                  ),
                  SizedBox(width: 15),
                  Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: const [
                    Text('제목', style: TextStyle(fontSize: 20)),
                    Text('코스모스', style: TextStyle(fontSize: 15)),
                    Text('저자', style: TextStyle(fontSize: 20)),
                    Text('칼 세이건', style: TextStyle(fontSize: 15)),
                    Text('출판일', style: TextStyle(fontSize: 20)),
                    Text('1980', style: TextStyle(fontSize: 15)),
                    Text('재고', style: TextStyle(fontSize: 20)),
                    Text('3', style: TextStyle(fontSize: 15)),
                    Text('대출중', style: TextStyle(fontSize: 20)),
                    Text('No', style: TextStyle(fontSize: 15)),
                    Text('도서정보', style: TextStyle(fontSize: 20)),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        'anything',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            ],
          ),
        ));
  }
}
