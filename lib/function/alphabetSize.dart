import 'package:bce_app/main.dart';
import 'package:bce_app/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class alphabetSize extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  final MainController mainController = MainController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('글씨 크기 설정'),
        backgroundColor: const Color.fromRGBO(10, 101, 83, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Flexible(
                child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder(), labelText: '글씨 크기 입력'),
              onChanged: (v) => textEditingController.text = v,
            )),
            GestureDetector(
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => mainController.textSize = textEditingController.text,
                ),
              ),
              onTap: () {
                Get.to(() => main());
              },
            )
          ],
        ),
      ),
    );
  }
}
