import 'package:flutter/material.dart';

/// Widget hiển thị bong bóng tin nhắn kiểu Messenger
class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String time;
  final bool showTime;

  const MessageBubble({
    super.key,
    required this.text,
    required this.isMe,
    required this.time,
    this.showTime = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Bong bóng tin nhắn
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.72,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: isMe
                  ? const Color(0xFF0084FF)
                  : const Color(0xFFE4E6EB),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(18),
                topRight: const Radius.circular(18),
                bottomLeft: Radius.circular(isMe ? 18 : 4),
                bottomRight: Radius.circular(isMe ? 4 : 18),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                color: isMe ? Colors.white : const Color(0xFF1C1E21),
                height: 1.35,
              ),
            ),
          ),
          // Thời gian (chỉ hiện khi showTime = true)
          if (showTime)
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
              child: Text(
                time,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF8E8E93),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
