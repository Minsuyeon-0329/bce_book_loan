import 'package:bce_app/home/schedules.dart';
import 'package:bce_app/network_handler.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import 'notice.dart';

class HomePage extends StatelessWidget {
  ScrollController _scrollController = ScrollController();
  ScheduleController schedulecontroller = Get.put(ScheduleController());
  NoticeController noticeController = Get.put(NoticeController());
  Widget build(BuildContext context) {
    schedulecontroller.fetchPost();
    noticeController.fetchPost();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            children: [
              Text('대여현황', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: NetWorkHandler.borrow_len,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Image.network(NetWorkHandler.user_borrow[index * 6 + 5], height: 150, width: 100, fit: BoxFit.contain),
                    );
                  }),
            ),
          ),
        ),
        Divider(
          thickness: 10,
          color: Color.fromRGBO(230, 230, 230, 1),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('공지사항', style: TextStyle(fontSize: 20)),
              //Container(
              //    child: Row(
              //  children: [
              //    Icon(
              //      Icons.add,
              //      size: 15,
              //    ),
              //    Text('더보기')
              //  ],
              //)),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Scrollbar(
                thumbVisibility: true,
                controller: _scrollController,
                child: ListView.builder(
                    itemCount: noticeController.leng,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5),
                              Text('${noticeController.notlist[0].not[index]['fields']['title']}', style: const TextStyle(fontSize: 13)),
                              const Divider(),
                            ],
                          ));
                    }),
              ),
            ),
          ),
        ),
        Divider(
          thickness: 10,
          color: Color.fromRGBO(230, 230, 230, 1),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('학사일정', style: TextStyle(fontSize: 20)),
              //Container(
              //    child: Row(
              //  children: [
              //    Icon(
              //      Icons.add,
              //      size: 15,
              //    ),
              //    Text('더보기')
              //  ],
              //)),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListView.builder(
                  itemCount: schedulecontroller.leng,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text(
                              '[' +
                                  '${schedulecontroller.schlist[0].sch[index]['fields']['start_at']}' +
                                  ' ~ ' +
                                  '${schedulecontroller.schlist[0].sch[index]['fields']['end_at']}' +
                                  '] ' +
                                  '${schedulecontroller.schlist[0].sch[index]['fields']['title']}',
                              style: const TextStyle(fontSize: 13)),
                          Divider()
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
