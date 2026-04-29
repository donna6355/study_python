import 'dart:math';

import 'package:flutter/material.dart';

class Mbti extends StatefulWidget {
  const Mbti({super.key});

  @override
  State<Mbti> createState() => _MbtiState();
}

class _MbtiState extends State<Mbti> {
  List<int> currentVal = List.generate(10, (_) => 0);

  void _valSelected(int val, int idx) => setState(() => currentVal[idx] = val);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreenAccent,
        appBar: AppBar(
          title: Text("MBTI", style: TextStyle(fontWeight: FontWeight.w900)),
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),

        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
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
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Divider(thickness: 1, color: Colors.white70),
                    ),
                    QaTile(
                      "Mir Isaac Kim is the cat living in Mapo,\na.k.a beast in living room.",
                      currentVal[0],
                      0,
                      _valSelected,
                    ),
                    QaTile(
                      "Mir Isaac Kim has tiny head\n and big chubby butt.",
                      currentVal[1],
                      1,
                      _valSelected,
                    ),
                    QaTile(
                      "Mir Isaac Kim loves chicken\nbut hates fish and beef.",
                      currentVal[2],
                      2,
                      _valSelected,
                    ),
                    QaTile(
                      "Mir Isaac Kim likes string toys\nbut not that likes feather toys.",
                      currentVal[3],
                      3,
                      _valSelected,
                    ),
                    QaTile(
                      "Mir Isaac Kim likes to rub and bunt his head to the butler,\nbut dislikes the butler hugs him.",
                      currentVal[4],
                      4,
                      _valSelected,
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Calculate Result')),
          ],
        ),
      ),
    );
  }
}

class QaTile extends StatelessWidget {
  final String question;
  final int currentVal;
  final int idx;
  final Function(int, int) _valSelected;
  const QaTile(
    this.question,
    this.currentVal,
    this.idx,
    this._valSelected, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.maxFinite,
      height: 200,
      color: Colors.white,
      child: Column(
        children: [
          QCard(question),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Option(-3, currentVal, (val) => _valSelected(val, idx)),
                Option(-2, currentVal, (val) => _valSelected(val, idx)),
                Option(-1, currentVal, (val) => _valSelected(val, idx)),
                Option(-0, currentVal, (val) => _valSelected(val, idx)),
                Option(1, currentVal, (val) => _valSelected(val, idx)),
                Option(2, currentVal, (val) => _valSelected(val, idx)),
                Option(3, currentVal, (val) => _valSelected(val, idx)),
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
  final int currentVal;
  final int val; //-3,-2,-1,0,1,2,3
  final Function(int) onSelect;
  const Option(this.val, this.currentVal, this.onSelect, {super.key});

  @override
  Widget build(BuildContext context) {
    final double size = 20.0 + pow(val, 3).abs();
    final Color color = val > 0
        ? Colors.deepPurple
        : val == 0
        ? Colors.grey
        : Colors.greenAccent;

    final Color? selected = val == currentVal ? color : null;
    return InkWell(
      onTap: () => onSelect(val),
      child: Center(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            border: Border.all(color: color, width: 2),
            shape: BoxShape.circle,
            color: selected,
          ),
        ),
      ),
    );
  }
}
