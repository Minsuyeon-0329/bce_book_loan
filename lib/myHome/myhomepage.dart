import 'package:bce_app/network_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyPage extends StatelessWidget {
  Widget build(BuildContext context) {
    NetWorkHandler.userget(NetWorkHandler.user_email);
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
              Text('이름: ' + '${NetWorkHandler.user_name}', style: const TextStyle(fontSize: 15)),
              Container(height: 15),
              Text('학번: ' + '${NetWorkHandler.user_num}', style: TextStyle(color: Colors.black, fontSize: 15))
            ])
          ]),
          const SizedBox(height: 15),
          const Divider(),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('My 대출', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text('대여권수: ' + '${NetWorkHandler.borrow_len}', style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
              child: ListView.builder(
                  itemCount: NetWorkHandler.borrow_len,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 150,
                      width: 100,
                      child: Row(children: [
                        Image.network(NetWorkHandler.user_borrow[index * 6 + 5], fit: BoxFit.contain),
                        SizedBox(width: 15),
                        Text('${NetWorkHandler.user_borrow[index * 6 + 2]}' + '~' + '${NetWorkHandler.user_borrow[index * 6 + 3]}',
                            style: const TextStyle(fontSize: 17)),
                        SizedBox(height: 15)
                      ]),
                    );
                  }))
        ],
      ),
    );
  }
}
