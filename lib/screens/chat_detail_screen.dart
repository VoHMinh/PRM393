import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../data/mock_data.dart';
import '../widgets/message_bubble.dart';

/// Màn hình chi tiết cuộc trò chuyện
class ChatDetailScreen extends StatelessWidget {
  final Contact contact;

  const ChatDetailScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final messages = sampleMessages[contact.id] ?? [];

    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar với avatar và tên người chat
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF0084FF),
            size: 26,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            // Avatar
            Stack(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: const Color(0xFFE4E6EB),
                  backgroundImage: NetworkImage(contact.avatarUrl),
                  onBackgroundImageError: (exception, stackTrace) {},
                  child: Text(
                    contact.initials,
                    style: const TextStyle(
                      color: Color(0xFF0084FF),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
                if (contact.isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF31A24C),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 10),
            // Tên và trạng thái
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1C1E21),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    contact.isOnline ? 'Đang hoạt động' : 'Không hoạt động',
                    style: TextStyle(
                      fontSize: 12,
                      color: contact.isOnline
                          ? const Color(0xFF31A24C)
                          : const Color(0xFF8E8E93),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          // Icon gọi điện
          IconButton(
            icon: const Icon(
              Icons.call_outlined,
              color: Color(0xFF0084FF),
              size: 24,
            ),
            onPressed: () {},
            splashRadius: 22,
          ),
          // Icon video call
          IconButton(
            icon: const Icon(
              Icons.videocam_outlined,
              color: Color(0xFF0084FF),
              size: 26,
            ),
            onPressed: () {},
            splashRadius: 22,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: const Color(0xFFE4E6EB),
            height: 0.5,
          ),
        ),
      ),
      body: Column(
        children: [
          // Danh sách tin nhắn
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                // Reverse để tin nhắn mới nhất ở dưới
                final message = messages[messages.length - 1 - index];
                final isLastInGroup = index == 0 ||
                    messages[messages.length - index].isMe !=
                        message.isMe;

                return MessageBubble(
                  text: message.text,
                  isMe: message.isMe,
                  time: message.time,
                  showTime: isLastInGroup,
                );
              },
            ),
          ),
          // Divider
          const Divider(height: 1, thickness: 0.5, color: Color(0xFFE4E6EB)),
          // Input bar giả
          _buildMessageInput(),
        ],
      ),
    );
  }

  /// Widget thanh nhập tin nhắn phía dưới
  Widget _buildMessageInput() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        color: Colors.white,
        child: Row(
          children: [
            // Icon thêm (camera, ảnh, ...)
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF0084FF),
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(6),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Icon camera
            IconButton(
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Color(0xFF0084FF),
                size: 24,
              ),
              onPressed: () {},
              splashRadius: 20,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minWidth: 36,
                minHeight: 36,
              ),
            ),
            // Icon gallery
            IconButton(
              icon: const Icon(
                Icons.photo_outlined,
                color: Color(0xFF0084FF),
                size: 24,
              ),
              onPressed: () {},
              splashRadius: 20,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minWidth: 36,
                minHeight: 36,
              ),
            ),
            const SizedBox(width: 4),
            // Text input
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F2F5),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Aa',
                    hintStyle: TextStyle(
                      color: Color(0xFF8E8E93),
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            // Icon gửi
            IconButton(
              icon: const Icon(
                Icons.thumb_up_rounded,
                color: Color(0xFF0084FF),
                size: 26,
              ),
              onPressed: () {},
              splashRadius: 22,
            ),
          ],
        ),
      ),
    );
  }
}
