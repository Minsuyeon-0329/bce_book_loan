import 'package:bce_app/function/askUs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              width: 70,
              height: 70,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30), image: DecorationImage(image: AssetImage('asset/test.jpg'), fit: BoxFit.cover)),
            ),
            Container(
              width: 15,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('이름', style: TextStyle(color: Colors.black, fontSize: 15)),
              Container(height: 15),
              const Text('학번', style: TextStyle(color: Colors.black, fontSize: 15))
            ])
          ]),
          const SizedBox(height: 15),
          const Divider(),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('대여권수', style: TextStyle(color: Colors.black, fontSize: 20)),
          ),
          const SizedBox(height: 15),
          const Divider(),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('학점', style: TextStyle(color: Colors.black, fontSize: 20)),
          ),
          const SizedBox(height: 15),
          const Divider(),
          const SizedBox(height: 15),
          GestureDetector(
              onTap: () {
                Get.to(() => AskUs());
              },
              child: Container(padding: const EdgeInsets.all(8), child: const Text('문의하기', style: TextStyle(color: Colors.black, fontSize: 20))))
        ],
      ),
    );
  }
}
