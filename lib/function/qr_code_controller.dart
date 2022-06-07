import 'dart:async';
import 'dart:convert';

import 'package:bce_app/function/qr_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Post {
  final String code;

  Post({required this.code});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      code: json['code'],
    );
  }
}

class QrCodeController extends GetxController {
  var qrlist = <QRs>[].obs;
  var qrInfo;
  Future<Post> fetchPost() async {
    final response = await http.get(Uri.parse(qrInfo));

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  var photo;
  late int quantity;
  late String title;
  var isLoading = RxBool(true);

  @override
  void onInit() {
    super.onInit();
    fetchQR();
  }

  Future<void> fetchQR() async {
    var url = 'https://m.site.naver.com/qrcode/view.naver?v=0Yioo'; //get (QR보내고 받는 data)
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      QRs _qrs = QRs.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      qrlist.clear();
      qrlist.add(QRs(qrs: _qrs.qrs));
      isLoading.value = false;
    } else {
      Get.snackbar('Error Loading data!', 'Server responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
