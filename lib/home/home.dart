import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('대여현황',style: TextStyle(fontSize: 20)),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
        Divider(thickness: 10,color: Color.fromRGBO(230,230,230, 1),),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('공지사항',style: TextStyle( fontSize: 20)),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,0),
            child: Container(
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
        Divider(thickness: 10,color: Color.fromRGBO(230,230,230, 1),),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('학사일정',style: TextStyle( fontSize: 20)),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,0),
            child: Container(
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
