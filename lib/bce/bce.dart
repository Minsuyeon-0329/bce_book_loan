import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../function/qr_code.dart';

class BCEPage extends StatelessWidget {
  const BCEPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    emptyTheTextFormField(){
      textEditingController.clear();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 20, 20, 0),
          child: Row(
            children: [
              Text('My 대출',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(width: 125),
              Text('QR 코드',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: GridView.count(
            primary: false,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Hi'),
                  decoration: BoxDecoration(color: Color.fromRGBO(199, 201, 199, 1), borderRadius: BorderRadius.circular(15)),
                ),

                GestureDetector(
                onTap: () {
    Get.to(() => QR());
    },
    child: Container(
        padding: const EdgeInsets.all(8),
        decoration:  BoxDecoration(
          color: Color.fromRGBO(199, 201, 199, 1),
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage('asset/qr_code.png')
          ))),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 0, 20, 15),
          child: Text('도서 종류',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        ),
        Expanded(
          flex: 2,

          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      cursorColor: Color.fromRGBO(10, 101, 83, 1),
                      controller: textEditingController,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          hintText: '찾는 도서 검색',
                          prefixIcon: Icon(Icons.search,color: Color.fromRGBO(10, 101, 83, 1),size: 30,),
                          suffixIcon: IconButton(icon: Icon(Icons.clear,color: Color.fromRGBO(10, 101, 83, 1),), onPressed: emptyTheTextFormField,)
                      ),
                    ),
                  )
                ],
              ),
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
