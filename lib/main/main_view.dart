import 'package:bce_app/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../alarm/alarm.dart';
import '../bce/bce.dart';
import '../home/home.dart';

class MainViewPage extends StatelessWidget {
   List<Widget> _bodyContent = [
    HomePage(),
    BCEPage(),
  ];



  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('asset/test.jpg'),
                backgroundColor: Color.fromRGBO(199, 201, 199, 1),
              ),
              otherAccountsPictures: const [
                CircleAvatar(
                  backgroundImage: AssetImage('asset/test.jpg'),
                  backgroundColor: Color.fromRGBO(199, 201, 199, 1),
                )
              ],
              accountName: const Text('최준영'),
              accountEmail: const Text('chois@naver.com'),
              onDetailsPressed: () {
                const Text('press details');
              },
              decoration: const BoxDecoration(
                color: Color.fromRGBO(10, 101, 83, 1),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Color.fromRGBO(199, 201, 199, 1)),
              title: const Text('Home'),
              onTap: () {
                const Text('Home is clicked');
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Color.fromRGBO(199, 201, 199, 1)),
              title: const Text('Setting'),
              onTap: () {
                const Text('Setting is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color: Color.fromRGBO(199, 201, 199, 1)),
              title: const Text('Q&A'),
              onTap: () {
                const Text('Q&A is clicked');
              },
              trailing: const Icon(Icons.add),
            ),
          ],
        ),
      ),
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
      body: Obx(()=>_bodyContent[mainController.pageIndex]),
      bottomNavigationBar: getFooter(),
    );
  }
  }

  Widget getFooter() {
    MainController mainController = Get.put(MainController());
    List buttomItems=[
      mainController.pageIndex == 0 ? Icon(Icons.home,color: Color.fromRGBO(10, 101, 83, 1)) : Icon(Icons.home,color: Colors.black) ,
      mainController.pageIndex == 1 ? Icon(Icons.add,color: Color.fromRGBO(10, 101, 83, 1)) : Icon(Icons.add,color: Colors.black),
      mainController.pageIndex == 2 ? Icon(Icons.person,color: Color.fromRGBO(10, 101, 83, 1)) : Icon(Icons.person,color: Colors.black)
    ];
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(buttomItems.length,
                    (index) {
              return GestureDetector(
                onTap: (){
                  mainController.pageTab(index);
                  print(mainController.pageIndex);
                },
                child: buttomItems[index],
              );}),
          ),
        ));
  }


