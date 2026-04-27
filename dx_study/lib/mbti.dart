import 'package:flutter/material.dart';

class Mbti extends StatelessWidget {
  const Mbti({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreenAccent,
        appBar: AppBar(
          title: Text("MBTI", style: TextStyle(fontWeight: FontWeight.w900)),
          backgroundColor: Colors.transparent,
        ),

        body: Column(
          children: [
            const SizedBox(width: double.infinity),
            Text(
              "MBTI TEST",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            Text(
              'MBTI TESTING APP',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
