import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_morning_ui/colog.dart';

class Home0820 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            color: Colors.green[100],
            child: CustomPaint(painter: _MyPainter()),
          ),
        ],
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // canvas => 그리기 위한 메서드들이 존재하는 객체
    // size => CustomPaint가 가지고 있는 크기 => 부모 위젯으로부터 물려받은 크기

    // Paint 객체 = 붓 ex) 색상, 두께, 끝 둥글게 처리, ...
    Paint brush = Paint();
    brush.color = Colors.pinkAccent;

    // 원을 그릴 수 있는 메서드
    // canvas.drawCircle(Offset(150, 150), 50, p1);

    // 호를 그릴 때 사용하는 메서드
    // 15% 10% 20% 18% 7% 30%
    // 핑크, 주황, 초록, 청록, 파랑, 인디고
    final center = Offset(size.width / 2, size.height / 2);

    final values = [15, 10, 20, 18, 7, 30];
    final colors = [
      Colors.pink,
      Colors.orange,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.indigo,
    ];

    double startAngle = -90.toRadian();
    double radius = size.width / 3;

    for (var i = 0; i < values.length; i++) {
      final percentage = values[i];
      final color = colors[i];

      double sweepAngle = percentage.percentageToRadian();

      Rect rect2 = Rect.fromCircle(center: center, radius: radius);
      brush.color = color;
      canvas.drawArc(rect2, startAngle, sweepAngle, true, brush);
      startAngle += sweepAngle;
      radius += 5;
    }

    // Rect rect6 = Rect.fromCircle(center: center, radius: 130);
    // brush.color = Colors.indigo;
    // startAngle = startAngle + sweepAngle;
    // sweepAngle = 30.percentageToRadian();
    // canvas.drawArc(rect6, startAngle, sweepAngle, true, brush);
  }

  // _MyPainter 객체의 속성이 바뀌었을 때 호출되는 함수
  // 반환되는 값이
  // > true이면 다시 그림
  // > false이면 다시 그리지 않음
  // 다시 그릴지 여부
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

extension DoubleExt on double {
  /// 파이를 각도로 변환하는 함수
  /// `angle / 360 * 2 * pi`
  double toRadian() {
    return this / 360 * 2 * pi;
  }

  /// 백분율을 호도법(각도)로 변환하는 함수
  ///
  /// percentage / 100 * 2 * pi
  ///
  /// ex)
  ///
  /// - 25.percentageToRadian() => pi / 2
  /// - 50.percentageToRadian() => pi
  double percentageToRadian() {
    return this / 100 * 2 * pi;
  }
}

extension IntExt on int {
  /// 파이를 각도로 변환하는 함수
  /// `angle / 360 * 2 * pi`
  double toRadian() {
    return this / 360 * 2 * pi;
  }

  /// ### 백분율을 호도법(각도)로 변환하는 함수
  ///
  /// `percentage / 100 * 2 * pi`
  ///
  /// ex)
  ///
  /// - 25.percentageToRadian() => pi / 2
  /// - 50.percentageToRadian() => pi
  double percentageToRadian() {
    return this / 100 * 2 * pi;
  }
}
