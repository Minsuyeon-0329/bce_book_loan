import 'dart:async';
import 'dart:convert';

import 'package:bce_app/home/schedule_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ScheduleController extends GetxController {
  var schlist = <Schedule>[].obs;
  var isLoading = RxBool(true);
  int leng = 0;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchPost() async {
    http.Response response = await http.get(Uri.parse('http://10.125.218.14:8088/get_schedules'));
    if (response.statusCode == 200) {
      Schedule _sch = Schedule.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      leng = _sch.sch.length;
      schlist.clear();
      schlist.add(Schedule(sch: _sch.sch));
      isLoading.value = false;
    } else {
      Get.snackbar('Error Loading data!', 'Server responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
