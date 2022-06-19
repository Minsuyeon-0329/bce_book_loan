import 'dart:async';
import 'dart:convert';

import 'package:bce_app/function/qr_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class QrCodeController extends GetxController {
  var qrlist = <QRs>[].obs;
  var qrInfo;
  var photo;
  var isLoading = RxBool(true);
  var notice;
  bool returnState = false;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchPost() async {
    Map<String, dynamic> data = {"url": qrInfo};
    Uri url = Uri(scheme: 'http', host: '10.125.218.14', port: 8088, path: 'book/QrDecode/', queryParameters: data);
    http.Response response = await http.get(Uri.parse("$url"));
    if (response.statusCode == 200) {
      QRs _qrs = QRs.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      qrlist.clear();
      qrlist.add(QRs(qrs: _qrs.qrs));
      isLoading.value = false;
    } else {
      print(returnState);
      if (qrlist[0].qrs[0]['Return']) {
        returnState = true;
      } else {
        returnState = false;
      }
    }
  }

  Future<void> Borrow() async {
    Map<String, dynamic> data = {"url": qrInfo};
    Uri url = Uri(scheme: 'http', host: '10.125.218.14', port: 8088, path: 'book/QrDecode/', queryParameters: data);
    http.Response response = await http.get(Uri.parse("$url"));
    if (response.statusCode == 200) {
      notice = '성공';
      isLoading.value = false;
    } else {
      notice = '실패';
      Get.snackbar('Error Loading data!', 'Server responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
