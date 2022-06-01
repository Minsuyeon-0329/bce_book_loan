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
        Container(
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: '찾는 도서 검색',
                        prefixIcon: Icon(Icons.search,color: Color.fromRGBO(10, 101, 83, 1),size: 30,),
                        suffixIcon: IconButton(icon: Icon(Icons.clear,color: Color.fromRGBO(10, 101, 83, 1),), onPressed: emptyTheTextFormField,)
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Card(

                        );
                      },
                      separatorBuilder: (context,index)=> Divider(),
                      itemCount: 10),
                )
              ],
            ),
          ),

        Divider(thickness: 10,color: Color.fromRGBO(230,230,230, 1),),

        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child:
              Text('My 대출',style: TextStyle( fontSize: 20)),
        ),
      ],
    );
  }
}
