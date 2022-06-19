import 'package:bce_app/bce/bce_controller.dart';
import 'package:bce_app/bce/search_controller.dart';
import 'package:bce_app/book/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class BCEPage extends StatelessWidget {
  List? data;
  String result = '';

  @override
  Widget build(BuildContext context) {
    final stc = Get.put(SearchController());
    SearchController _searchcontroller = Get.put(SearchController());


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            onFieldSubmitted: (val)=> _searchcontroller.fetchSearchData(),
            cursorColor: Color.fromRGBO(10, 101, 83, 1),
            controller: stc.controllersearch,
            decoration: InputDecoration(
                fillColor: Colors.white,
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(10, 101, 83, 1)), borderRadius: BorderRadius.all(Radius.circular(10))),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: '찾는 도서 검색',
                prefixIcon: IconButton(
                  onPressed: () {
                    _searchcontroller.fetchSearchData();
                    },
                  icon: Icon(
                    Icons.search,
                    color: Color.fromRGBO(10, 101, 83, 1),
                    size: 30,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Color.fromRGBO(10, 101, 83, 1),
                  ),
                  onPressed: (){
                    stc.controllersearch.clear();
                    _searchcontroller.searchList.clear();
                  },
                )),
            // onFieldSubmitted: ,
          ),
        ),
        Expanded(
            flex: 2,
            child: Obx(()=> _searchcontroller.searchList.length != 0 ?  displayBookListScreen(): displayNoSearchResultScreen())
            //const CircularProgressIndicator()

        )],
    );
  }

}

displayNoSearchResultScreen() {
  BCEController _bcecontroller = Get.put(BCEController());

  return ListView.builder(
    itemCount: 11,
      itemBuilder: (context, index) {

        return GestureDetector(
      onTap: (){Get.to(()=>DetailPage(),arguments: index);},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Image.network(_bcecontroller.photoList[0].books[index]['imange_url'],height: 150,width: 100,fit: BoxFit.contain),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width-170,
                      child: Text('${_bcecontroller.photoList[0].books[index]['title']}',
                          textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('저자: ${_bcecontroller.photoList[0].books[index]['author']}'),
                    Text('출판사: ${_bcecontroller.photoList[0].books[index]['publisher']}'),
                    // Text('${_bcecontroller.photoList[0].books[index]['qr_code']}'),
                    // Text('${_bcecontroller.photoList[0].books[index]['content']}'),
                    Text('출판 연도: ${_bcecontroller.photoList[0].books[index]['published_at']}'),
                    Text('대여 가능 도서: ${_bcecontroller.photoList[0].books[index]['quantity']}'),
                    Text('대출 중인 도서: ${_bcecontroller.photoList[0].books[index]['taken']}'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  });


}

displayBookListScreen() {
  SearchController _searchcontroller = Get.put(SearchController());

  return ListView.builder(
    itemCount: _searchcontroller.length,
      itemBuilder: (context, index) {
    return GestureDetector(
      onTap: (){Get.to(()=>DetailPage(),arguments: index);},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Image.network(_searchcontroller.searchList[0].fields[index]['fields']['imange_url'],height: 150,width: 100,fit: BoxFit.contain),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width-170,
                      child: Text('${_searchcontroller.searchList[0].fields[index]['fields']['title']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('저자: ${_searchcontroller.searchList[0].fields[index]['fields']['author']}'),
                    Text('출판사: ${_searchcontroller.searchList[0].fields[index]['fields']['publisher']}'),
                    Text('출판 연도: ${_searchcontroller.searchList[0].fields[index]['fields']['published_at']}'),
                    Text('대여 가능 도서: ${_searchcontroller.searchList[0].fields[index]['fields']['quantity']}'),
                    Text('대출 중인 도서: ${_searchcontroller.searchList[0].fields[index]['fields']['taken']}'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  });



}

