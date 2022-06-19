import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'notice_list.dart';

class NoticeController extends GetxController {
  var notlist = <Notice>[].obs;
  var isLoading = RxBool(true);
  int leng = 0;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchPost() async {
    http.Response response = await http.get(Uri.parse('http://10.125.218.14:8088/get_notice'));
    if (response.statusCode == 200) {
      Notice _not = Notice.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      leng = _not.not.length;
      notlist.clear();
      notlist.add(Notice(not: _not.not));
      isLoading.value = false;
    } else {
      Get.snackbar('Error Loading data!', 'Server responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
