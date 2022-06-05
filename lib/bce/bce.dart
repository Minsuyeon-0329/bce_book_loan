import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BCEPage extends StatelessWidget {
  List? data;
  String result ='';

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
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            cursorColor: Color.fromRGBO(10, 101, 83, 1),
            controller: textEditingController,
            decoration: InputDecoration(
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(10, 101, 83, 1)),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: '찾는 도서 검색',
                prefixIcon: Icon(Icons.search,color: Color.fromRGBO(10, 101, 83, 1),size: 30,),
                suffixIcon: IconButton(icon: Icon(Icons.clear,color: Color.fromRGBO(10, 101, 83, 1),), onPressed: emptyTheTextFormField,)
            ),
            // onFieldSubmitted: ,
          ),
        ),
        IconButton(onPressed: ()async{
          var url ="http://10.125.218.14:8090/books/";
          var response = await http.get(Uri.parse(url));
          setState(){
            result=response.body;
          }
          print(result);
        }, icon: Icon(Icons.file_download)),
        Expanded(
          flex: 2,
          // child: Text('$result'),
          child: displayNoSearchResultScreen()
                      // child: futureSearchResults==null? displayNoSearchResultScreen():displayBookListScreen(),
             ),

        // Divider(thickness: 10,color: Color.fromRGBO(230,230,230, 1),),
        //
        // Expanded(
        //   flex: 1,
        //   child: Padding(
        //     padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        //     child:
        //         Text('My 대출',style: TextStyle( fontSize: 20)),
        //   ),
        // ),
      ],
    );
  }
}

displayNoSearchResultScreen(){
  return Center(
      child:ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                child: Row(
                  children: <Widget>[

                  ],
                ),
              ),);
          })
      );
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   // shrinkWrap: true,
      //   children: <Widget>[
      //     Icon(Icons.book, color: Colors.grey, size: 100,),
      //     Text('Search Book',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 40),)
      //   ],
      // ),

}

displayBookListScreen(){
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