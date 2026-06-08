import 'package:flutter/material.dart';

import '../models/contact.dart';
import 'contact_avatar.dart';

class PeopleTile extends StatelessWidget {
  final Contact contact;
  final VoidCallback onMessageTap;

  const PeopleTile({
    super.key,
    required this.contact,
    required this.onMessageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      child: Row(
        children: [
          ContactAvatar(contact: contact, size: 52),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF1C1E21),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  contact.isOnline ? 'Active now' : 'Offline',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: contact.isOnline
                        ? const Color(0xFF31A24C)
                        : const Color(0xFF65676B),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.message_outlined),
            color: const Color(0xFF0084FF),
            onPressed: onMessageTap,
          ),
        ],
      ),
    );
  }
}
