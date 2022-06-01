import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get.dart';
import 'package:wakelock/wakelock.dart';

class QRController extends GetxController {
  String? _qrInfo = '스캔하세요';
  bool _canVibrate = true;
  bool _camState = false;

  bool get init => init;

  String get qrCallback => qrCallback;

  set init(bool state) {
    Future<bool> canVibrate = Vibrate.canVibrate;
    Wakelock.enable();
    _camState = true;
    _canVibrate = canVibrate as bool;
  }

  set qrCallback(String? code) {
    if (code != _qrInfo) {
      FlutterBeep.beep();
      if (_canVibrate) Vibrate.feedback(FeedbackType.heavy);
    }
    _camState = false;
    _qrInfo = code;
  }
}
