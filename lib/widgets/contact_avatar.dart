import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactAvatar extends StatelessWidget {
  final Contact contact;
  final double size;
  final bool showOnlineStatus;

  const ContactAvatar({
    super.key,
    required this.contact,
    this.size = 52,
    this.showOnlineStatus = true,
  });

  @override
  Widget build(BuildContext context) {
    final dotSize = size * 0.25;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          ClipOval(
            child: Container(
              width: size,
              height: size,
              color: const Color(0xFFE4E6EB),
              child: Image.network(
                contact.avatarUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(
                      contact.initials,
                      style: TextStyle(
                        color: const Color(0xFF0084FF),
                        fontSize: size * 0.28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          if (showOnlineStatus && contact.isOnline)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: dotSize,
                height: dotSize,
                decoration: BoxDecoration(
                  color: const Color(0xFF31A24C),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
