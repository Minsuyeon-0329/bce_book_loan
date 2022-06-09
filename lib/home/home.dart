import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  ScrollController _scrollController = ScrollController();
  Widget build(BuildContext context) {
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
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text('[도서] 리액트를 다루는 기술 (반납일 2022-06-12)'),
                          Divider(),
                          Text('[도서] 파이썬 알고리즘 인터뷰 (반납일 2022-06-10)'),
                          Divider(),
                        ],
                      ),
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
              Container(
                  child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 15,
                  ),
                  Text('더보기')
                ],
              )),
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
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text('제54기(여름학기) 한국어교원양성과정 수강생 모집'),
                            Divider(),
                            Text('2022학년도 하계 계절학기,어학연수 자비 프로그램 선발 안내'),
                            Divider(),
                            Text('[취업전략과] 2022학년도 중견기업 바로알기 특강 안내'),
                            Divider(),
                            Text('[REN] 2022학년도 SAM분야 융합연구회(PNU-Junior) 지원 사'),
                            Divider(),
                            Text('22년 6월 교수 학습 프로그램 안내'),
                            Divider(),
                            Text('[REN] 2022학년도 1학기 인문대학 동아시아지식학 사진, 영상 콘'),
                            Divider(),
                            Text('2022학년도 1학기 경제사정 곤란 대학생 국가장학금 지원 신청'),
                            Divider(),
                          ],
                        ),
                      );
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
              Container(
                  child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 15,
                  ),
                  Text('더보기')
                ],
              )),
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
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text('[2022/06/13 ~ 2022/06/18] 1학기 기말고사'),
                          Divider(),
                          Text('[2022/06/14 ~ 2022/06/16] 여름계절수업 등록금납부'),
                          Divider(),
                          Text('[2022/06/20 ~ 2022/07/01] 2학기 휴,복학기간'),
                          Divider(),
                          Text('[2022/06/22 ~ 2022/07/19] 여름계절수업'),
                          Divider(),
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
