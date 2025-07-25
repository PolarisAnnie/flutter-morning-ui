import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home0724 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numberCircle('1', ' ', null),
                SizedBox(width: 20),
                numberCircle('2', 'ABC', null),
                SizedBox(width: 20),
                numberCircle('3', 'DEF', null),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numberCircle('4', 'GHI', null),
                SizedBox(width: 20),
                numberCircle('5', 'JKL', null),
                SizedBox(width: 20),
                numberCircle('6', 'MNO', null),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numberCircle('7', 'PQRS', null),
                SizedBox(width: 20),
                numberCircle('8', 'TUV', null),
                SizedBox(width: 20),
                numberCircle('9', 'WXYZ', null),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numberCircle('*', '', null),
                SizedBox(width: 20),
                numberCircle('0', '+', null),
                SizedBox(width: 20),
                numberCircle('#', '', null),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numberCircle('', '', Colors.transparent),
                SizedBox(width: 25),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(101, 196, 102, 1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    CupertinoIcons.phone_fill,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                SizedBox(width: 20),
                numberCircle('', '', Colors.transparent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container numberCircle(String number, String alphabet, Color? color) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color ?? Colors.grey[300],
        borderRadius: BorderRadius.circular(40),
      ),
      child: numberText(number, alphabet),
    );
  }

  Column numberText(String number, String alphabet) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w500,
            height: 1.0,
          ),
        ),
        if (alphabet.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              alphabet,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
                height: 1.0,
              ),
            ),
          ),
      ],
    );
  }
}
