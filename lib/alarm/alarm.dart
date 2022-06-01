import 'package:flutter/material.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({Key? key}) : super(key: key);
  static const bool alarmExist = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('알람'),
          backgroundColor: const Color.fromRGBO(10, 101, 83, 1),
        ),
        body: getBody());
  }

  Widget getBody() {
    return Container(
        child: alarmExist
            ? ListView(children: [
                Center(
                  child: Text('알림이 없습니다.'),
                )
              ])
            : ListView(
                children: [Card(child: Text('코스모스(칼 세이건)이/가 3일 뒤 반납일입니다.')), Card(child: Text('예약한 총, 균, 쇠(제레..이/가 대출 가능합니다.'))],
              ));
  }
}
