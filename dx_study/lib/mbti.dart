import 'dart:math';

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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.maxFinite,
              height: 200,
              color: Colors.white,
              child: Column(
                children: [
                  QCard(
                    "Mir Isaac Kim is the cat living in Mapo,\na.k.a beast in living room.",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Option(-3),
                        Option(-2),
                        Option(-1),
                        Option(-0),
                        Option(1),
                        Option(2),
                        Option(3),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cute',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Handsome",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Divider(thickness: 1, color: Colors.white70),
            ),
            FeatureCard(
              "When I find myself in times of trouble, mother Mary comes to me. Speaking word of wisdom, let it be",
              Icons.add_a_photo,
            ),
            FeatureCard(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
              Icons.leak_add,
            ),
            FeatureCard(
              "Wild felines come in all shapes and sizes and live all over the world plus there are more than half a billion domestic cats.",
              Icons.cabin,
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String content;
  final IconData icon;
  const FeatureCard(this.content, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: Colors.deepPurpleAccent),
          const SizedBox(width: 24),
          Expanded(child: Text(content, style: TextStyle(fontSize: 12))),
        ],
      ),
    );
  }
}

class QCard extends StatelessWidget {
  final String text;
  const QCard(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    );
  }
}

class Option extends StatelessWidget {
  final int val; //-3,-2,-1,0,1,2,3
  const Option(this.val, {super.key});

  @override
  Widget build(BuildContext context) {
    final double size = 20.0 + pow(val, 3).abs();
    final Color color = val > 0
        ? Colors.deepPurple
        : val == 0
        ? Colors.grey
        : Colors.greenAccent;
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
