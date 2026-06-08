import 'package:flutter/material.dart';

import '../models/contact.dart';
import 'contact_avatar.dart';

class ChatTile extends StatelessWidget {
  final Contact contact;
  final VoidCallback onTap;

  const ChatTile({super.key, required this.contact, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final hasUnread = contact.unreadCount > 0;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        child: Row(
          children: [
            ContactAvatar(contact: contact, size: 56),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color(0xFF1C1E21),
                      fontSize: 16,
                      fontWeight: hasUnread ? FontWeight.w700 : FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          contact.lastMessage,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: hasUnread
                                ? const Color(0xFF1C1E21)
                                : const Color(0xFF65676B),
                            fontSize: 14,
                            fontWeight: hasUnread
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        contact.lastTime,
                        style: TextStyle(
                          color: hasUnread
                              ? const Color(0xFF1C1E21)
                              : const Color(0xFF65676B),
                          fontSize: 13,
                          fontWeight: hasUnread
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (hasUnread) ...[
              const SizedBox(width: 10),
              Container(
                constraints: const BoxConstraints(minWidth: 22, minHeight: 22),
                padding: const EdgeInsets.symmetric(horizontal: 7),
                decoration: const BoxDecoration(
                  color: Color(0xFF0084FF),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    contact.unreadCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
