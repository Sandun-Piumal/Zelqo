import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  const ChatScreen({super.key, required this.name});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  static const Color zelqoGreen = Color(0xFF1D9E75);
  final TextEditingController _msgController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'text': 'Machan heta free da?', 'me': false},
    {'text': 'Ow, evening free', 'me': true},
  ];

  void _sendMessage() {
    if (_msgController.text.trim().isEmpty) return;
    setState(() {
      _messages.add({'text': _msgController.text.trim(), 'me': true});
      _msgController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 17,
              backgroundColor: zelqoGreen.withOpacity(0.12),
              child: Text(
                widget.name.split(' ').map((e) => e[0]).take(2).join(),
                style: TextStyle(color: zelqoGreen, fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name, style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
                Text('online', style: TextStyle(fontSize: 11, color: zelqoGreen)),
              ],
            ),
          ],
        ),
        actions: const [
          Padding(padding: EdgeInsets.only(right: 12), child: Icon(Icons.videocam_outlined, color: Colors.black54)),
          Padding(padding: EdgeInsets.only(right: 16), child: Icon(Icons.call_outlined, color: Colors.black54, size: 20)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, i) {
                final msg = _messages[i];
                final isMe = msg['me'] as bool;
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 260),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isMe ? zelqoGreen.withOpacity(0.12) : const Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(14),
                        topRight: const Radius.circular(14),
                        bottomLeft: Radius.circular(isMe ? 14 : 4),
                        bottomRight: Radius.circular(isMe ? 4 : 14),
                      ),
                    ),
                    child: Text(
                      msg['text'] as String,
                      style: TextStyle(fontSize: 14, color: isMe ? zelqoGreen : Colors.black87),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 6, 10, 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.black12),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6)],
                    ),
                    child: TextField(
                      controller: _msgController,
                      decoration: const InputDecoration(
                        hintText: 'Message',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 19,
                  backgroundColor: zelqoGreen,
                  child: IconButton(
                    icon: const Icon(Icons.send, size: 17, color: Colors.white),
                    onPressed: _sendMessage,
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
