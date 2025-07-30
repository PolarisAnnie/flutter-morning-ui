import 'package:flutter/material.dart';

class Home0729 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('달력')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            weekLabel(),
            SizedBox(height: 10),
            startWeek(),
            SizedBox(height: 10),
            dayRow(7),
            SizedBox(height: 10),
            dayRow(14),
            SizedBox(height: 10),
            dayRow(21),
            SizedBox(height: 10),
            lastWeek(),
          ],
        ),
      ),
    );
  }

  Row dayRow(int startDate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        dayNum('${startDate}', true, false, false),
        dayNum('${startDate + 1}', true, false, false),
        dayNum('${startDate + 2}', true, false, false),
        dayNum('${startDate + 3}', true, false, false),
        dayNum('${startDate + 4}', true, false, false),
        dayNum('${startDate + 5}', true, false, false),
        dayNum('${startDate + 6}', true, false, false),
      ],
    );
  }

  Row startWeek() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        dayNum('31', false, false, false),
        dayNum('1', true, false, false),
        dayNum('2', true, false, false),
        dayNum('3', true, true, false),
        dayNum('4', true, false, false),
        dayNum('5', true, false, false),
        dayNum('6', true, false, false),
      ],
    );
  }

  Row lastWeek() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        dayNum('28', true, false, false),
        dayNum('29', true, false, false),
        dayNum('30', true, false, true),
        dayNum('31', true, false, false),
        dayNum('1', false, false, false),
        dayNum('2', false, false, false),
        dayNum('3', false, false, false),
      ],
    );
  }

  Container dayNum(String text, bool thisMonth, bool isToday, bool isSelected) {
    return thisMonth == true
        ? Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.deepOrange
                  : isToday
                  ? Colors.deepOrange[200]
                  : Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: (isSelected || isToday) ? Colors.white : Colors.black,
                ),
              ),
            ),
          )
        : Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[300],
                ),
              ),
            ),
          );
  }

  Row weekLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        weekName("M"),
        weekName("T"),
        weekName("W"),
        weekName("T"),
        weekName("F"),
        weekName("S"),
        weekName("S"),
      ],
    );
  }

  SizedBox weekName(String text) {
    return SizedBox(
      width: 30,
      height: 30,
      child: Center(
        child: Text(text, style: TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
