import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                  leading: Image.asset('asset/book_example.jpg'),
                  title: Text('코스모스(칼 세이건)'),
                  subtitle: Text('2022-06-06'),
                ),
                ListTile(
                  leading: Image.asset('asset/guns_germs_steel.jpg'),
                  title: Text('총, 균, 쇠(제레미 다이아몬드)'),
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
