import 'package:flutter/material.dart';

class BCEPage extends StatelessWidget {
  const BCEPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: TabBar(
          labelColor: Color.fromRGBO(10, 101, 83, 1),
          indicatorColor: Color.fromRGBO(10, 101, 83, 1),
              tabs: [
                Tab(text: '도서'),
                Tab(text: '공간'),
                Tab(text:'행사'),
                Tab(text: '기기')
              ],
            ),

    );
  }
}
