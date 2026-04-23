import 'package:flutter/material.dart';

class TanosGame extends StatefulWidget {
  const TanosGame({super.key});

  @override
  State<TanosGame> createState() => _TanosGameState();
}

class _TanosGameState extends State<TanosGame> {
  bool _toggle = false;

  List<String> _names = [
    "강현석",
    "강현지",
    "구기민",
    "권수현",
    "김도연",
    "김민진",
    "김성은",
    "김세연",
    "김원탁",
    "김지윤",
    "김형진",
    "박상언",
    "박시하",
    "박지후",
    "송유진",
    "이동욱",
    "이서현",
    "이수진",
    "전다나",
    "정솔잎",
    "조연희",
    "조유현",
    "최은혁",
    "최혜원",
    "황정하",
    "권혜성",
  ];
  void _removeName(String name) {
    setState(() {
      if (_names.length <= 1) return;
      _names.remove(name);
    });
  }

  void _friskNShuffle() async {
    if (_names.length <= 1) return;
    setState(() {
      _toggle = true;
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _names.shuffle();
      _names = _names.take(_names.length ~/ 2).toList();
      _toggle = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Isaac Game"),
              centerTitle: true,
              backgroundColor: Colors.amberAccent,
            ),
            body: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 2,
              ),
              children: _names
                  .map(
                    (name) => Card(
                      shadowColor: Colors.amberAccent.withAlpha(50),
                      color: Colors.amberAccent.withAlpha(50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(name),
                          IconButton(
                            onPressed: () => _removeName(name),
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _friskNShuffle,
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              child: Icon(Icons.shuffle),
            ),
          ),
          if (_toggle) ModalBarrier(dismissible: false, color: Colors.black38),
          if (_toggle)
            Center(
              child: Image.asset(
                'assets/isaac_cute.jpeg',
                width: 400,
                height: 600,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}
