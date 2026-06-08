import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/search_box.dart';
import '../widgets/story_contact_item.dart';
import '../widgets/chat_list_item.dart';
import 'chat_detail_screen.dart';

/// Màn hình danh sách chat chính - tab Chats
class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Header Chats
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Row(
              children: [
                // Avatar user hiện tại
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF0084FF).withValues(alpha: 0.3),
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0xFF0084FF),
                    child: Text(
                      'M',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Tiêu đề
                const Text(
                  'Chats',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1C1E21),
                    letterSpacing: -0.5,
                  ),
                ),
                const Spacer(),
                // Icon tạo tin nhắn mới
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF0F2F5),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: Color(0xFF1C1E21),
                      size: 22,
                    ),
                    onPressed: () {},
                    splashRadius: 22,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Ô tìm kiếm
        const SliverToBoxAdapter(
          child: SearchBox(),
        ),

        // Horizontal contact/story list
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              itemCount: sampleContacts.length > 8
                  ? 8
                  : sampleContacts.length,
              itemBuilder: (context, index) {
                return StoryContactItem(contact: sampleContacts[index]);
              },
            ),
          ),
        ),

        // Divider
        const SliverToBoxAdapter(
          child: Divider(height: 1, thickness: 0.5, color: Color(0xFFE4E6EB)),
        ),

        // Danh sách cuộc trò chuyện
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final contact = sampleContacts[index];
              return ChatListItem(
                contact: contact,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChatDetailScreen(contact: contact),
                    ),
                  );
                },
              );
            },
            childCount: sampleContacts.length,
          ),
        ),

        // Padding cuối danh sách
        const SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),
      ],
    );
  }
}
