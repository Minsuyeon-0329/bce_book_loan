import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//https://uaremine.tistory.com/22

class AlarmPage extends StatelessWidget {
  const AlarmPage({Key? key}) : super(key: key);
  static const bool alarmExist = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('알림'),
          backgroundColor: const Color.fromRGBO(10, 101, 83, 1),
        ),
        body: Container(
            child: alarmExist
                ? const Center(
                    child: Text(
                      '알림이 없습니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : ListView(
                    padding: const EdgeInsets.all(10),
                    children: const [
                      Card(
                        child: ListTile(
                            leading: Icon(Icons.timer, size: 40),
                            title: Text(
                              '반납',
                            ),
                            subtitle: Text(
                              '리액트를 다루는 기술 (김민준)',
                            )),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.timer, size: 40),
                          title: Text('반납'),
                          subtitle: Text(
                            '파이썬 알고리즘 인터뷰 (박상길)',
                          ),
                        ),
                      ),
                    ],
                  )));
  }
}
