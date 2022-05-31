import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 20, 20, 20),
          child: Text('대여현황',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(199, 201, 199, 1),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 20, 20, 20),
          child: Text('공지사항',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(199, 201, 199, 1),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 20, 20, 20),
          child: Text('학사일정',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(199, 201, 199, 1),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
