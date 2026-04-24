import 'package:flutter/material.dart';

class Chatgpt extends StatefulWidget {
  const Chatgpt({super.key});

  @override
  State<Chatgpt> createState() => _ChatgptState();
}

class _ChatgptState extends State<Chatgpt> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text("ChatGPT"),
          backgroundColor: Colors.amberAccent,
        ),
        body: Column(
          children: [
            Expanded(child: Placeholder()),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Type your message here",
                contentPadding: const EdgeInsets.all(16),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Send button action
                    String message = _controller.text;
                    print("Message sent: $message");
                    _controller.clear();
                  },
                ),
                filled: true,
                fillColor: Colors.amberAccent.withAlpha(120),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
