import 'package:get/get.dart';

class MainViewController extends GetxController {
  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  set pageIndex(int index) {
    _pageIndex.value = index;
    update();
  }

  pageTab(int index) {
    _pageIndex.value = index;
    update();
  }
}
