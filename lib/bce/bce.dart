import 'package:bce_app/bce/bce_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BCEPage extends StatelessWidget {
  List? data;
  String result = '';

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    BCEController _bcecontroller = Get.put(BCEController());


    emptyTheTextFormField() {
      textEditingController.clear();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            cursorColor: Color.fromRGBO(10, 101, 83, 1),
            controller: textEditingController,
            decoration: InputDecoration(
                fillColor: Colors.white,
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(10, 101, 83, 1)), borderRadius: BorderRadius.all(Radius.circular(10))),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: '찾는 도서 검색',
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromRGBO(10, 101, 83, 1),
                  size: 30,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Color.fromRGBO(10, 101, 83, 1),
                  ),
                  onPressed: emptyTheTextFormField,
                )),
            // onFieldSubmitted: ,
          ),
        ),
        Expanded(
            flex: 2,
            child: Obx(()=> _bcecontroller.isLoading.isTrue? const CircularProgressIndicator(): displayNoSearchResultScreen())

        )],
    );
  }
}

displayNoSearchResultScreen() {
  BCEController _bcecontroller = Get.put(BCEController());

  return ListView.builder(itemBuilder: (context, index) {
    print(index);
    return Card(
      child: Row(
        children: <Widget>[
          Image.network(_bcecontroller.photoList[0].books[index]['imange_url'],height: 100,width: 100,fit: BoxFit.contain),
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width-150,
                child: Text('${_bcecontroller.photoList[0].books[index]['title']}',
                    textAlign: TextAlign.center),
              ),
              Text('${_bcecontroller.photoList[0].books[index]['author']}'),
              Text('${_bcecontroller.photoList[0].books[index]['qr_code']}'),
              // Text('${_bcecontroller.photoList[0].books[index]['content']}'),
              Text('${_bcecontroller.photoList[0].books[index]['published_at']}'),
              Text('Quality: ${_bcecontroller.photoList[0].books[index]['quantity']}'),
              Text('Number of Books: ${_bcecontroller.photoList[0].books[index]['taken']}'),
            ],
          )
        ],
      ),
    );
  });


}

displayBookListScreen() {
  return Container(
    child: Text('Book'),
  );
  // return FutureBuilder(
  //     future: futureSearchResults,
  //     builder: (context,snapshot){
  //       if (!snapshot.hasData){
  //         return circularProcess();
  //       }
  //     }
  // );
}
