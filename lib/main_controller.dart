import 'package:get/get.dart';

class MainController extends GetxController {
  final _textSize = ''.obs;
  String get textSize => _textSize.value;

  set textSize(String size) {
    _textSize.value = size;
    update();
  }
}
