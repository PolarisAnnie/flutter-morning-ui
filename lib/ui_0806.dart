import 'package:flutter/material.dart';

class Home0806 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${today.year}년 ${today.month}월 ${today.day}일',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                'Today',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              SizedBox(height: 18),
              SizedBox(
                height: 80,
                child: PageView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    //today라는 변수에 담긴 값을 이용해서 날짜 출력
                    //index == 0이면 오늘 날짜가 포함된 주차
                    //index == 1이면 오늘 날짜가 포함된 주차 + 7일 : 다음주
                    //index == 2이면 오늘 날짜가 포함된 주차 + 14일 : 다다음주

                    //리스트로 오늘 포함 7일 담기
                    List<int> dateList = [];
                    void generateDateList() {
                      for (int i = 0; i < 7; i++) {
                        DateTime date = today.add(Duration(days: i));
                        dateList.add(date.day);
                      }
                    }

                    generateDateList();

                    // index값에 따라서 7*index 각 리스트에 더해주기
                    List<int> resultList = dateList
                        .map((today) => today + (7 * index))
                        .toList();

                    // 날짜 위젯이 오늘일 때는 글자 색상 변경 + 날짜 밑에 .

                    return Row(
                      children: [
                        weekLabel(
                          'Mon',
                          '${resultList[0]}',
                          isToday(resultList[0], index, today),
                        ),
                        weekLabel(
                          'Tue',
                          '${resultList[1]}',
                          isToday(resultList[1], index, today),
                        ),
                        weekLabel(
                          'Wed',
                          '${resultList[2]}',
                          isToday(resultList[2], index, today),
                        ),
                        weekLabel(
                          'Thu',
                          '${resultList[3]}',
                          isToday(resultList[3], index, today),
                        ),
                        weekLabel(
                          'Fri',
                          '${resultList[4]}',
                          isToday(resultList[4], index, today),
                        ),
                        weekLabel(
                          'Sat',
                          '${resultList[5]}',
                          isToday(resultList[5], index, today),
                        ),
                        weekLabel(
                          'Sun',
                          '${resultList[6]}',
                          isToday(resultList[6], index, today),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          TimelineIndex(isSelected: false),
                          SizedBox(height: 10),
                          Container(
                            height: 50,
                            width: 2,
                            decoration: BoxDecoration(color: Colors.blue),
                          ),
                          SizedBox(height: 10),
                          TimelineIndex(isSelected: false),

                          SizedBox(height: 10),
                          Container(
                            height: 50,
                            width: 2,
                            decoration: BoxDecoration(color: Colors.blue),
                          ),
                          SizedBox(height: 10),
                          TimelineIndex(isSelected: true),
                        ],
                      ),

                      TaskBox('Wakeup','2:00 AM', 'Ear'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 오늘 날짜 확인 함수
  bool isToday(int date, int weekIndex, DateTime today) {
    if (weekIndex == 0) {
      return date == today.day;
    }
    return false;
  }

  Widget weekLabel(String text, String date, bool isToday) {
    return Expanded(
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: isToday ? Colors.blue : Colors.grey,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isToday ? Colors.blue : Colors.grey,
            ),
          ),
          Container(height: 5, width: 5),
        ],
      ),
    );
  }
}

class TaskBox extends StatelessWidget {
  const TaskBox({
    super.key,
    required this.title,
    required this.time,
    required this.desc,
  });

  final String title;
  final String time;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: 290,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Spacer(),
                  Text(
                    time,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                desc,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimelineIndex extends StatelessWidget {
  const TimelineIndex({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Row(
          children: [
            Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 2),
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 2),
                      //color: Colors.blue,
                    ),
                  ),
                ],
              ),
              TaskBox(title: title, time: time, desc: desc)
          ],
        )
        : Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 2),
              //color: Colors.blue,
            ),
          );
  }
}
