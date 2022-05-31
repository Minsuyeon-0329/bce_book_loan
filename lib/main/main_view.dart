import 'package:bce_app/function/settings.dart';
import 'package:bce_app/main/main_controller.dart';
import 'package:bce_app/myhomepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../alarm/alarm.dart';
import '../bce/bce.dart';
import '../function/askUs.dart';
import '../home/home.dart';

class MainViewPage extends StatelessWidget {
  List<Widget> _bodyContent = [
    HomePage(),
    BCEPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
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
      bottomNavigationBar: getFooter(),
    );
  }
}
Widget getDrawer(){
  return Drawer(
    child: ListView(
      children: <Widget>[
        const UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage:  AssetImage('asset/bce_logo.png'),
            backgroundColor: Color.fromRGBO(199, 201, 199, 1),
          ),
          accountName: Text('최준영'),
          accountEmail: Text('chois@naver.com'),
          decoration: BoxDecoration(
            color: Color.fromRGBO(10, 101, 83, 1),
          ),
        ),

        Column(
          children: [
            ListTile(title: Center(child: Text('로그 아웃'))),
            Divider(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  ListTile(
                        leading: Icon(Icons.settings),
                        title: const Text('Setting'),
                        onTap: () {
                          Get.to(() => Setting());
                        },
                      ),
                  ListTile(
                      leading: Icon(Icons.help),
                      title: Text('Help and Feedback'),
                          onTap: () {
                            Get.to(() => AskUs());
                          },
                  )
                ],
              ),

            ),
          ],
        )
      ],
    ),
  );
}

Widget getFooter() {
  MainController mainController = Get.put(MainController());
  List buttomItems = [
    mainController.pageIndex == 0 ? Icon(Icons.home, color: Color.fromRGBO(10, 101, 83, 1)) : Icon(Icons.home, color: Colors.black),
    mainController.pageIndex == 1 ? Icon(Icons.add, color: Color.fromRGBO(10, 101, 83, 1)) : Icon(Icons.add, color: Colors.black),
    mainController.pageIndex == 2 ? Icon(Icons.person, color: Color.fromRGBO(10, 101, 83, 1)) : Icon(Icons.person, color: Colors.black)
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
