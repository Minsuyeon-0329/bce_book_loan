import 'package:bce_app/main/main_view_controller.dart';
import 'package:bce_app/myhomepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../alarm/alarm.dart';
import '../bce/bce.dart';
import '../function/askUs.dart';
import '../function/qr_code.dart';
import '../home/home.dart';

class MainViewPage extends StatelessWidget {
  List<Widget> _bodyContent = [
    HomePage(),
    BCEPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    MainViewController mainController = Get.put(MainViewController());
    return Scaffold(
      drawer: getDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text('의생명융합공학부')),
        backgroundColor: const Color.fromRGBO(10, 101, 83, 1),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => AlarmPage());
              },
              icon: const Icon(Icons.alarm))
        ],
      ),
      body: Obx(() => _bodyContent[mainController.pageIndex]),
      bottomNavigationBar: Obx(() => getFooter()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(10, 101, 83, 1),
        onPressed: () {
          Get.to(() => QRCode());
        },
        child: Icon(Icons.qr_code_scanner),
      ),
    );
  }
}

Widget getDrawer() {
  return Drawer(
    child: Column(
      children: <Widget>[
        const UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('asset/bce_logo.png'),
            backgroundColor: Color.fromRGBO(199, 201, 199, 1),
          ),
          accountName: Text('최준영'),
          accountEmail: Text('chois@naver.com'),
          decoration: BoxDecoration(
            color: Color.fromRGBO(10, 101, 83, 1),
          ),
        ),
        ListTile(title: Center(child: Text('로그 아웃'))),
        Divider(),
        Expanded(child: SizedBox()),
        ListTile(
          leading: Icon(Icons.help),
          title: Text(
            'Help and Feedback',
            style: TextStyle(color: Colors.grey),
          ),
          onTap: () {
            Get.to(() => AskUs());
          },
        )
      ],
    ),
  );
}

Widget getFooter() {
  MainViewController mainController = Get.put(MainViewController());
  List buttomItems = [
    mainController.pageIndex == 0 ? Icon(Icons.home, color: Color.fromRGBO(10, 101, 83, 1)) : Icon(Icons.home, color: Color.fromRGBO(170, 170, 170, 1)),
    mainController.pageIndex == 1 ? Icon(Icons.book, color: Color.fromRGBO(10, 101, 83, 1)) : Icon(Icons.book, color: Color.fromRGBO(170, 170, 170, 1)),
    mainController.pageIndex == 2 ? Icon(Icons.person, color: Color.fromRGBO(10, 101, 83, 1)) : Icon(Icons.person, color: Color.fromRGBO(170, 170, 170, 1))
  ];
  return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(buttomItems.length, (index) {
            return GestureDetector(
              onTap: () {
                mainController.pageTab(index);
                print(mainController.pageIndex);
              },
              child: buttomItems[index],
            );
          }),
        ),
      ));
}
