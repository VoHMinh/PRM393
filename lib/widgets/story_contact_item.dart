import 'package:flutter/material.dart';
import '../models/contact.dart';

/// Widget hiển thị avatar + tên trong horizontal story list
class StoryContactItem extends StatelessWidget {
  final Contact contact;

  const StoryContactItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar với indicator online
          Stack(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: const Color(0xFFE4E6EB),
                backgroundImage: NetworkImage(contact.avatarUrl),
                onBackgroundImageError: (exception, stackTrace) {},
                child: Text(
                  contact.initials,
                  style: const TextStyle(
                    color: Color(0xFF0084FF),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              // Chấm xanh online indicator
              if (contact.isOnline)
                Positioned(
                  right: 2,
                  bottom: 2,
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
          const SizedBox(height: 6),
          // Tên contact
          Text(
            contact.name.split(' ').last,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1C1E21),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
