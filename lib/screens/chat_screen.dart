import 'package:flutter/material.dart';

import '../data/mock_contacts.dart';
import '../models/contact.dart';
import '../widgets/chat_tile.dart';
import '../widgets/contact_suggestion_list.dart';
import '../widgets/search_box.dart';
import 'chat_detail_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String _query = '';

  List<Contact> get _filteredContacts {
    final keyword = _query.trim().toLowerCase();
    if (keyword.isEmpty) {
      return mockContacts;
    }
    return mockContacts
        .where((contact) => contact.name.toLowerCase().contains(keyword))
        .toList();
  }

  void _openChat(Contact contact) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatDetailScreen(contact: contact),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final contacts = _filteredContacts;

    return Column(
      children: [
        _ChatHeader(),
        SearchBox(
          hintText: 'Search',
          onChanged: (value) {
            setState(() {
              _query = value;
            });
          },
        ),
        ContactSuggestionList(
          contacts: mockContacts,
          onContactSelected: _openChat,
        ),
        const Divider(height: 1, color: Color(0xFFE4E6EB)),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 6),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return ChatTile(
                contact: contact,
                onTap: () => _openChat(contact),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ChatHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 12, 6),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFF0084FF),
            child: Text(
              'Me',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Chats',
            style: TextStyle(
              color: Color(0xFF1C1E21),
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(),
          _HeaderButton(icon: Icons.camera_alt_outlined, onPressed: () {}),
          const SizedBox(width: 8),
          _HeaderButton(icon: Icons.edit_outlined, onPressed: () {}),
        ],
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _HeaderButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: const Color(0xFFF0F2F5),
          foregroundColor: const Color(0xFF1C1E21),
        ),
        icon: Icon(icon, size: 21),
        onPressed: onPressed,
      ),
    );
  }
}
