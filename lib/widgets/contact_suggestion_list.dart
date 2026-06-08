import 'package:flutter/material.dart';

import '../models/contact.dart';
import 'contact_avatar.dart';

class ContactSuggestionList extends StatelessWidget {
  final List<Contact> contacts;
  final ValueChanged<Contact> onContactSelected;

  const ContactSuggestionList({
    super.key,
    required this.contacts,
    required this.onContactSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(10, 4, 10, 8),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return InkWell(
            onTap: () => onContactSelected(contact),
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 76,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContactAvatar(contact: contact, size: 54),
                  const SizedBox(height: 6),
                  Text(
                    contact.name.split(' ').first,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF1C1E21),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
