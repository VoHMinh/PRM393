import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../data/mock_data.dart';

/// Widget hiển thị một item trong danh sách People
class PeopleListItem extends StatelessWidget {
  final Contact contact;

  const PeopleListItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final statusText = getStatusText(contact);
    final isActive = contact.isOnline;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          // Avatar với online indicator
          Stack(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: const Color(0xFFE4E6EB),
                backgroundImage: NetworkImage(contact.avatarUrl),
                onBackgroundImageError: (exception, stackTrace) {},
                child: Text(
                  contact.initials,
                  style: const TextStyle(
                    color: Color(0xFF0084FF),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
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
          // Tên và trạng thái
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: const TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1C1E21),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    // Chấm xanh nhỏ cho user online
                    if (isActive)
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: const BoxDecoration(
                          color: Color(0xFF31A24C),
                          shape: BoxShape.circle,
                        ),
                      ),
                    Expanded(
                      child: Text(
                        statusText,
                        style: TextStyle(
                          fontSize: 13,
                          color: isActive
                              ? const Color(0xFF31A24C)
                              : const Color(0xFF8E8E93),
                          fontWeight: isActive
                              ? FontWeight.w500
                              : FontWeight.normal,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
