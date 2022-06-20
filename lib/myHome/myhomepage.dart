import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'myhomepage_controller.dart';

class MyPage extends StatelessWidget {
  MyHomeController homecontroller = Get.put(MyHomeController());
  Widget build(BuildContext context) {
    homecontroller.fetchPost();
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
                  BoxDecoration(borderRadius: BorderRadius.circular(30), image: DecorationImage(image: AssetImage('asset/bce_logo.png'), fit: BoxFit.cover)),
            ),
            Container(
              width: 15,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('이름: 최준영', style: TextStyle(color: Colors.black, fontSize: 15)),
              Container(height: 15),
              const Text('학번: 202055179', style: TextStyle(color: Colors.black, fontSize: 15))
            ])
          ]),
          const SizedBox(height: 15),
          const Divider(),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('My 대출', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text('대여권수: 2', style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          const SizedBox(height: 15),

          //https://stackoverflow.com/questions/53071451/how-to-specify-listtile-height-in-flutter
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Image.asset('asset/react.jpg'),
                  title: Text('리액트를 다루는 기술 (김민준)'),
                  subtitle: Text('2022-06-12'),
                ),
                ListTile(
                  leading: Image.asset('asset/python_al.jpg'),
                  title: Text('파이썬 알고리즘 인터뷰 (박상길)'),
                  subtitle: Text('2022-06-10'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
