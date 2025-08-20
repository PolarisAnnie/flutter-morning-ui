import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_morning_ui/colog.dart';

class Home0819 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            margin: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.green[100],
            child: CustomPaint(
              painter: MyPainter(),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text("안녕하세요"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  /// 직접 뭔가 그릴 때!
  @override
  void paint(Canvas canvas, Size size) {
    // Size 객체 : 가로(width), 세로(height) 정보만 담고있는 객체
    print(size);

    // Canvas : 할당받은 크기의 영역 내에서 자유롭게 그릴수 있는 객체. 그리기 위한 여러가지 메서드가 포함!
    // canvas.drawArc : 원을 그릴 때
    // canvas.drawLine : 선을 그릴 때
    // drawLine : 시작점, 끝점, 그릴 페인트 => 파라미터
    // 시작점 & 끝점 => Offset 객체 => x,y 좌표 가지고 있는 객체!
    final p1 = Paint();
    // Paint : 붓 => 색상, 끝을 둥굴게 할 지, 두께
    p1.strokeWidth = 5;
    p1.color = Colors.amber;

    final maxX = size.width;
    final maxY = size.height;
    // canvas.drawLine(Offset(0, 0), Offset(maxX, 0), p1);
    // canvas.drawLine(Offset(maxX, 0), Offset(maxX, maxY), p1);
    // canvas.drawLine(Offset(maxX, maxY), Offset(50, maxY), p1);
    // canvas.drawLine(Offset(50, maxY), Offset(50, 50), p1);
    // canvas.drawLine(Offset(50, 50), Offset(0, 0), p1);

    // Path 그릴 때, 도형이 아닌 선을 그리고 싶을 때 PaintingStyle.stroke 사용!
    p1.style = PaintingStyle.fill;

    final path = Path();
    // 9개의 숫자를 일일히 바꿔주지 않고 변수 하나만 수정해서 사용하고 싶어서!
    double radius = 30;
    // 그리는 점을 이동! => 그림그릴 때, 그리기 전 손을 이동하는것과 같은 행동
    path.moveTo(0, 0);
    path.lineTo(maxX - radius, 0);
    // 현재 위치는 maxX - 50, 0
    // x2,y2(maxX, 50) 까지 선을 그릴건데
    // x1,y1(maxX, 0) 을 기준으로 선을 왜곡(휘게) 시켜줌
    path.quadraticBezierTo(maxX, 0, maxX, radius);

    path.lineTo(maxX, maxY - radius);
    path.quadraticBezierTo(maxX, maxY, maxX - radius, maxY);
    path.lineTo(radius * 2, maxY);
    path.quadraticBezierTo(radius, maxY, radius, maxY - radius);
    path.lineTo(radius, radius);
    path.lineTo(0, 0);

    canvas.drawPath(path, p1);
  }

  /// MyPainter 의 속성이 바뀌었을 때
  ///
  /// 다시 그릴지 여부
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}





  // void paintCircle(){
  //    final paint1 = Paint();
  //   paint1.color = Colors.blue;

  //   final path1 = Path();
  //   path1.moveTo(150, 150);
  //   path1.arcTo(
  //     Rect.fromCircle(center: Offset(150, 150), radius: 50),
  //     startPoint(0), // 시작 각도 (12시 방향에서 시작)
  //     percentToAngle(20),
  //     false,
  //   );
  //   canvas.drawPath(path1, paint1);
  // }

  // double percentToAngle(double percent) {
  //   return 2 * pi * (percent / 100);
  // }

  // double startPoint(double accumulatedPercent) {
  //   return -pi / 2 + percentToAngle(accumulatedPercent);
  // }