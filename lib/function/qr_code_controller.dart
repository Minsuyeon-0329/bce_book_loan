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
  bool returnState = false;
  bool loan = false;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchPost() async {
    Map<String, dynamic> data = {"url": qrInfo};
    Uri url = Uri(scheme: 'http', host: '10.125.218.14', port: 8088, path: 'book/QrDecode/', queryParameters: data);
    http.Response response = await http.get(Uri.parse("$url"));
    if ((response.body.length == 20) & (response.statusCode == 200)) {
      returnState = true;
      loan = false;
    } else if (response.statusCode == 200) {
      QRs _qrs = QRs.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      loan = true;
      returnState = false;
      qrlist.clear();
      qrlist.add(QRs(qrs: _qrs.qrs));
      isLoading.value = false;
    }
  }

  Future<void> Borrow() async {
    Map<String, dynamic> data = {"url": qrInfo};
    Uri url = Uri(scheme: 'http', host: '10.125.218.14', port: 8088, path: 'book/Borrow/', queryParameters: data);
    http.Response response = await http.get(Uri.parse("$url"));
    if (response.statusCode == 200) {
      isLoading.value = false;
    } else {
      Get.snackbar('Error Loading data!', 'Server responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }

  Future<void> Return() async {
    Map<String, dynamic> data = {"url": qrInfo};
    Uri url = Uri(scheme: 'http', host: '10.125.218.14', port: 8088, path: 'book/Return/', queryParameters: data);
    http.Response response = await http.get(Uri.parse("$url"));
    if (response.statusCode == 200) {
      isLoading.value = false;
    } else {
      Get.snackbar('Error Loading data!', 'Server responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
