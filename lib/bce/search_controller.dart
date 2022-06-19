import 'dart:convert';
import 'package:bce_app/book/search_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class SearchController extends GetxController{
  static SearchController get i => Get.find();
  var controllersearch = TextEditingController();
  RxList searchList = <Fields>[].obs;
  var isLoading = RxBool(true);
  int length = 0;

  @override
  void onInit(){
    super.onInit();
    fetchSearchData();
  }

  Future<void> fetchSearchData() async {
    http.Response searchresponse = await http.get(Uri.parse('http://10.125.218.14:8088/book/search/?keyword=${controllersearch.text}'));

    if (searchresponse.statusCode == 200) {
      print(controllersearch.text);
      Fields _search = Fields.fromJson(jsonDecode(utf8.decode(searchresponse.bodyBytes)));
      print(searchresponse.body);
      searchList.clear();
      searchList.add(Fields(fields: _search.fields));
      length = _search.fields.length;
      isLoading.value =true;
    } else {
      Get.snackbar('Error Loading data!', 'Server responded: ${searchresponse.statusCode}:${searchresponse.reasonPhrase.toString()}');
    }
  }
}