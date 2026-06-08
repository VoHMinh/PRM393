import 'package:flutter/material.dart';
import '../models/contact.dart';

/// Widget hiển thị một item trong danh sách chat
class ChatListItem extends StatelessWidget {
  final Contact contact;
  final VoidCallback onTap;

  const ChatListItem({
    super.key,
    required this.contact,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            // Avatar với online indicator
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: const Color(0xFFE4E6EB),
                  backgroundImage: NetworkImage(contact.avatarUrl),
                  onBackgroundImageError: (exception, stackTrace) {},
                  child: Text(
                    contact.initials,
                    style: const TextStyle(
                      color: Color(0xFF0084FF),
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
                if (contact.isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: const Color(0xFF31A24C),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.5),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 14),
            // Thông tin chat: tên, tin nhắn cuối, thời gian
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: TextStyle(
                      fontSize: 15.5,
                      fontWeight: contact.isUnread
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: const Color(0xFF1C1E21),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          contact.lastMessage,
                          style: TextStyle(
                            fontSize: 13.5,
                            color: contact.isUnread
                                ? const Color(0xFF1C1E21)
                                : const Color(0xFF8E8E93),
                            fontWeight: contact.isUnread
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        ' · ${contact.lastMessageTime}',
                        style: TextStyle(
                          fontSize: 13,
                          color: contact.isUnread
                              ? const Color(0xFF1C1E21)
                              : const Color(0xFF8E8E93),
                          fontWeight: contact.isUnread
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Chấm xanh unread indicator
            if (contact.isUnread)
              Container(
                margin: const EdgeInsets.only(left: 8),
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFF0084FF),
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
