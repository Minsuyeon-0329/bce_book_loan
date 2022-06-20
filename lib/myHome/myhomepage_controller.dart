import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../login/login_controller.dart';
import 'myhome_list.dart';

class MyHomeController extends GetxController {
  var homelist = <HomeList>[].obs;
  var isLoading = RxBool(true);
  int leng = 0;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchPost() async {
    var loginController = Get.put(LoginController());
    http.Response response = await http.get(Uri.parse('http://10.125.218.14:8088/get_user/?email=${loginController.emailTextController.text}'));
    print(response.body);
    if (response.statusCode == 200) {
      HomeList _home = HomeList.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      print(_home.home);
      leng = _home.home.length;
      homelist.clear();
      homelist.add(HomeList(home: _home.home));
      isLoading.value = false;
    } else {
      Get.snackbar('Error Loading data!', 'Server responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
