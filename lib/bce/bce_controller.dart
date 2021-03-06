import 'dart:convert';
import 'package:get/get.dart';
import '../book/book_lists.dart';
import 'package:http/http.dart'as http;

class BCEController extends GetxController{
  RxList photoList = <Books>[].obs;
  var isLoading = RxBool(true);
  int len = 0;


  @override
  void onInit(){
    super.onInit();
    fetchBookData();
  }

  Future<void> fetchBookData() async{
    var url = 'http://10.125.218.14:8088/Books/';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode==200){
      Books _books = Books.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      print('response:');
      print(response.body);
      photoList.clear();
      photoList.add(Books(books: _books.books));
      len=_books.books.length;
      isLoading.value =false;
    }else{
      Get.snackbar(
          'Error Loading data!',
          'Server responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }




}
