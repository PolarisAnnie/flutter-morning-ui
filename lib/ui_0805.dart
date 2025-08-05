import 'package:flutter/material.dart';

class Home0805 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("막대그래프")),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mingguan',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '막대그래프 예제입니다',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      barGraph(200, 0.5, Colors.deepOrange, 'M'),
                      barGraph(200, 0.8, Colors.pink, 'T'),
                      barGraph(200, 0.2, Colors.purple, 'W'),
                      barGraph(200, 0.1, Colors.green, 'T'),
                      barGraph(200, 0.7, Colors.red, 'F'),
                      barGraph(200, 0.65, Colors.blue, 'S'),
                      barGraph(200, 0.35, Colors.indigo, 'S'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center barGraph(double total, double percent, Color color, String text) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Opacity(
                opacity: 0.3,
                child: Container(
                  height: total,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: total * percent,
                  width: 25,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

/* 튜터님의 해설코드 : Layout Builder 활용
import 'package:flutter/material.dart';

class Home0805 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("막대그래프")),
      body: Column(
        children: [
          // 컨테이너 안에서
          // 월~일 막대 출력
          // 막대하나당 0.0~1.0 사이 값
          Container(
            width: double.infinity,
            height: 400,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "막대그래프",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "월화수목금토일",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Bar(ratio: .5, label: "월", color: Colors.red),
                      Bar(ratio: .2, label: "화", color: Colors.orange),
                      Bar(ratio: .7, label: "수", color: Colors.yellow),
                      Bar(ratio: .34, label: "목", color: Colors.green),
                      Bar(ratio: .12, label: "금", color: Colors.blue),
                      Bar(ratio: 1, label: "토", color: Colors.indigo),
                      Bar(ratio: .5, label: "일", color: Colors.purple),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  Bar({
    super.key,
    required this.ratio,
    required this.label,
    required this.color,
  });

  double ratio;
  String label;
  Color color;

  @override
  Widget build(BuildContext context) {
    final width = 30.0;

    return Column(
      children: [
        SizedBox(height: 20),
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: width,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  BoxConstraints;
                  return Container(
                    height: constraints.maxHeight * ratio,
                    width: width,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(label),
      ],
    );
  }
}
*/