import 'package:bce_app/alarm/alarm.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.jpeg'),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profilejpeg'),
                  )
                ],
                //accountEmail: Text('@gamil.com'),
                //accountName: Text('daaam'),
                onDetailsPressed: () {
                  print('press details');
                },
                decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )), accountName: null, accountEmail: null,
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.grey[850]),
                title: Text('Home'), onTap: () { print('Home is clicked'); },
                trailing: Icon(Icons.add),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.grey[850]),
                title: Text('Setting'), onTap: () { print('Setting is clicked'); },
                trailing: Icon(Icons.add),
              ),
              ListTile(
                leading: Icon(Icons.question_answer, color: Colors.grey[850]),
                title: Text('Q&A'), onTap: () { print('Q&A is clicked'); },
                trailing: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Center(child: Text('의생명융합공학부')),
        backgroundColor: Color.fromRGBO(10, 101, 83, 1),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => AlarmPage());
              },
              icon: Icon(Icons. alarm))
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
            child: Container(
                color: Color.fromRGBO(10, 101, 83, 1)
              
            ),
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