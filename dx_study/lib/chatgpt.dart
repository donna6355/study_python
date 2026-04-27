import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

const _key = String.fromEnvironment("gemini");

class Chatgpt extends StatefulWidget {
  const Chatgpt({super.key});

  @override
  State<Chatgpt> createState() => _ChatgptState();
}

class _ChatgptState extends State<Chatgpt> {
  final TextEditingController _controller = TextEditingController();
  Gemini? gemini;

  ChatRoom _room = ChatRoom(chats: [], createdAt: DateTime.now());
  @override
  void initState() {
    Gemini.init(apiKey: _key);
    gemini = Gemini.instance;
    super.initState();
  }

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
            Expanded(
              child: _room.chats.isEmpty
                  ? Center(
                      child: Image.asset("assets/isaac_yarn.jpeg", width: 400),
                    )
                  : ListView.builder(
                      itemCount: _room.chats.length,
                      itemBuilder: (context, index) {
                        ChatMessage message = _room.chats[index];
                        return Align(
                          alignment: message.isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 300),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: message.isMe
                                  ? Colors.grey[300]
                                  : Colors.amberAccent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(message.text),
                          ),
                        );
                      },
                    ),
            ),
            TextField(
              onSubmitted: (_) => onSubmit(),
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Type your message here",
                contentPadding: const EdgeInsets.all(16),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: onSubmit,
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

  void onSubmit() async {
    String message = _controller.text;
    setState(() {
      _room.chats.add(
        ChatMessage(isMe: true, text: message, sentAt: DateTime.now()),
      );
    });
    gemini
        ?.prompt(parts: [Part.text(message)])
        .then((val) {
          setState(() {
            _room.chats.add(
              ChatMessage(
                isMe: false,
                text: val?.output ?? "FAILED",
                sentAt: DateTime.now(),
              ),
            );
          });
        })
        .catchError((e) {
          debugPrint('chat gpt error $e');
        });
    _controller.clear();
  }
}

class ChatMessage {
  final bool isMe;
  String text;
  final DateTime sentAt;

  ChatMessage({required this.isMe, required this.text, required this.sentAt});
}

class ChatRoom {
  List<ChatMessage> chats;
  final DateTime createdAt;

  ChatRoom({required this.chats, required this.createdAt});
}
