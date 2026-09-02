import 'package:flutter/material.dart';
import 'chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color zelqoGreen = Color(0xFF1D9E75);

  @override
  Widget build(BuildContext context) {
    final chats = [
      {'name': 'Kasun Perera', 'msg': 'Hodin! Api heta hamuvemu', 'time': '9:14', 'initials': 'KP'},
      {'name': 'Nimali Fernando', 'msg': 'Superb, mama enawa', 'time': '9:02', 'initials': 'NF'},
      {'name': 'Team group', 'msg': 'Ruwan: Meet eka 3ta', 'time': 'Yday', 'initials': 'TG'},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Zelqo',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.camera_alt_outlined, color: Colors.black54),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, size: 18, color: Colors.black45),
                  SizedBox(width: 8),
                  Text('Ask Zelqo or search', style: TextStyle(color: Colors.black45, fontSize: 13)),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, i) {
                final chat = chats[i];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(name: chat['name']!),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    radius: 22,
                    backgroundColor: zelqoGreen.withOpacity(0.12),
                    child: Text(
                      chat['initials']!,
                      style: TextStyle(color: zelqoGreen, fontWeight: FontWeight.w500),
                    ),
                  ),
                  title: Text(chat['name']!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  subtitle: Text(chat['msg']!, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                  trailing: Text(chat['time']!, style: const TextStyle(fontSize: 11, color: Colors.black38)),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.black12),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 2)),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(Icons.chat_bubble_outline_rounded, 'Chats', zelqoGreen, true),
              _navItem(Icons.groups_outlined, 'Groups', Colors.black38, false),
              _navItem(Icons.call_outlined, 'Calls', Colors.black38, false),
              _navItem(Icons.person_outline_rounded, 'Profile', Colors.black38, false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, Color color, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 21),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: color,
            fontWeight: active ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
