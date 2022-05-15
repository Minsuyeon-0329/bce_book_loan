import 'package:bce_app/alarm/alarm.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: const Text(
                  '최준영',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: const Text(
                  'chois@naver.com',
                  style: TextStyle(color: Colors.black),
                ),
                onDetailsPressed: () {
                  const Text('press details');
                },
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage('assets/test.jpg'),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.grey[850]),
                title: const Text('Home'),
                onTap: () {
                  const Text('Home is clicked');
                },
                trailing: const Icon(Icons.add),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.grey[850]),
                title: const Text('Setting'),
                onTap: () {
                  const Text('Setting is clicked');
                },
                trailing: Icon(Icons.add),
              ),
              ListTile(
                leading: Icon(Icons.question_answer, color: Colors.grey[850]),
                title: const Text('Q&A'),
                onTap: () {
                  const Text('Q&A is clicked');
                },
                trailing: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Center(child: Text('의생명융합공학부♡')),
        backgroundColor: const Color.fromRGBO(10, 101, 83, 1),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => AlarmPage());
              },
              icon: const Icon(Icons.alarm))
        ],
      ),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(color: const Color.fromRGBO(10, 101, 83, 1)),
          ),
        ),
        Expanded(
          child: GridView.count(
            primary: false,
            padding: EdgeInsets.all(20),
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text("Hello"),
                color: Color.fromRGBO(10, 101, 83, 1),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Hi'),
                color: Color.fromRGBO(10, 101, 83, 1),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Hi'),
                color: Color.fromRGBO(10, 101, 83, 1),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Hi'),
                color: Color.fromRGBO(10, 101, 83, 1),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Hi'),
                color: Color.fromRGBO(10, 101, 83, 1),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Hi'),
                color: Color.fromRGBO(10, 101, 83, 1),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getFooter() {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Icon(Icons.home), Icon(Icons.add), Icon(Icons.person)],
          ),
        ));
  }
}
