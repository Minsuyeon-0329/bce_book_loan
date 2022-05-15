import 'package:bce_app/alarm/alarm.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/test.jpg'),
                backgroundColor: Color.fromRGBO(199, 201, 199, 1),
              ),
              otherAccountsPictures: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/test.jpg'),
                  backgroundColor: Color.fromRGBO(199, 201, 199, 1),
                )
              ],
              accountName: const Text('최준영'),
              accountEmail: const Text('chois@naver.com'),
              onDetailsPressed: () {
                const Text('press details');
              },
              decoration: BoxDecoration(
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
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Text('대여 현황'),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(199,201,199, 1),
                borderRadius: BorderRadius.circular(25),
              ),
          ),
        ),),
        Expanded(
          flex: 2,
          child: GridView.count(
            primary: false,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text("Hello"),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(199,201,199, 1),
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Hi'),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(199,201,199, 1),
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Hi'),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(199,201,199, 1),
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Hi'),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(199,201,199, 1),
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Hi'),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(199,201,199, 1),
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Hi'),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(199,201,199, 1),
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Text('행사'),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(199,201,199, 1),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),),
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
