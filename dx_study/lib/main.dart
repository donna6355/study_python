// import 'tanos.dart';
// import 'chatgpt.dart';

import 'mbti.dart';

import 'package:flutter/material.dart';

void main() {
  // print("Hello, Isaac:)");
  // runApp(TanosGame());
  runApp(Mbti());
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Mir Isaac Cafe"),
          backgroundColor: Colors.amber,
        ),
        body: Column(
          children: [
            Text(
              'MENU',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              color: Colors.black,
              child: MenuCard(
                first: "Coffee",
                second: "Hot",
                third: "Ice",
                isBlack: false,
              ),
            ),
            MenuCard(first: "Espresso", second: "3.0", third: "3.5"),
            MenuCard(first: "Americano", second: "4.0", third: "4.5"),
            MenuCard(first: "Caffe Latte", second: "4.5", third: "5.0"),
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String first;
  final String second;
  final String third;
  final bool isBlack;
  const MenuCard({
    required this.first,
    required this.second,
    required this.third,
    this.isBlack = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              first,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isBlack ? null : Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(
              second,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isBlack ? null : Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(
              third,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isBlack ? null : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
