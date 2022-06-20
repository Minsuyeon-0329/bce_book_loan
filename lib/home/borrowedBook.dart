import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'borrowed_book_list.dart';

class borrowbookController extends GetxController {
  var schlist = <BBook>[].obs;
  var isLoading = RxBool(true);
  int leng = 0;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchPost() async {
    http.Response response = await http.get(Uri.parse('http://10.125.218.14:8088/get_schedules'));
    if (response.statusCode == 200) {
      BBook _bbo = BBook.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      leng = _bbo.bbo.length;
      schlist.clear();
      schlist.add(BBook(bbo: _bbo.bbo));
      isLoading.value = false;
    } else {
      Get.snackbar('Error Loading data!', 'Server responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
