import 'package:flutter/material.dart';

import '../data/mock_contacts.dart';
import '../models/contact.dart';
import '../widgets/people_tile.dart';
import '../widgets/search_box.dart';
import 'chat_detail_screen.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
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
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 6),
          child: Row(
            children: [
              Text(
                'People',
                style: TextStyle(
                  color: Color(0xFF1C1E21),
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        SearchBox(
          hintText: 'Search people',
          onChanged: (value) {
            setState(() {
              _query = value;
            });
          },
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 6),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return PeopleTile(
                contact: contact,
                onMessageTap: () => _openChat(contact),
              );
            },
          ),
        ),
      ],
    );
  }
}
