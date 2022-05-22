import 'package:bce_app/alarm/qr_code.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Text('대여 현황'),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(199, 201, 199, 1),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GridView.count(
            primary: false,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => QR());
                },
                child: Container(
                    width: 500.0,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('asset/test.jpg'),
                      ),
                    )),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Hi'),
                decoration: BoxDecoration(color: Color.fromRGBO(199, 201, 199, 1), borderRadius: BorderRadius.circular(15)),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Hi'),
                decoration: BoxDecoration(color: Color.fromRGBO(199, 201, 199, 1), borderRadius: BorderRadius.circular(15)),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Hi'),
                decoration: BoxDecoration(color: Color.fromRGBO(199, 201, 199, 1), borderRadius: BorderRadius.circular(15)),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Hi'),
                decoration: BoxDecoration(color: Color.fromRGBO(199, 201, 199, 1), borderRadius: BorderRadius.circular(15)),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Hi'),
                decoration: BoxDecoration(color: Color.fromRGBO(199, 201, 199, 1), borderRadius: BorderRadius.circular(15)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Text('행사'),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
