import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/people_list_item.dart';

/// Màn hình danh sách People - tab People
class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Chia contacts thành 2 nhóm: online trước, offline sau
    final onlineContacts =
        sampleContacts.where((c) => c.isOnline).toList();
    final offlineContacts =
        sampleContacts.where((c) => !c.isOnline).toList();

    return CustomScrollView(
      slivers: [
        // Header People
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Row(
              children: [
                const Text(
                  'People',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1C1E21),
                    letterSpacing: -0.5,
                  ),
                ),
                const Spacer(),
                // Icon contacts
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF0F2F5),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.person_add_outlined,
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

        // Search box
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F2F5),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm bạn bè',
                hintStyle: TextStyle(
                  color: Color(0xFF8E8E93),
                  fontSize: 15,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF8E8E93),
                  size: 22,
                ),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
        ),

        // Tiêu đề "Đang hoạt động"
        if (onlineContacts.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Color(0xFF31A24C),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'ĐANG HOẠT ĐỘNG (${onlineContacts.length})',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF8E8E93),
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),

        // Danh sách online contacts
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return PeopleListItem(contact: onlineContacts[index]);
            },
            childCount: onlineContacts.length,
          ),
        ),

        // Divider
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child:
                Divider(height: 1, thickness: 0.5, color: Color(0xFFE4E6EB)),
          ),
        ),

        // Tiêu đề "Tất cả bạn bè"
        if (offlineContacts.isNotEmpty)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Text(
                'KHÔNG HOẠT ĐỘNG',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF8E8E93),
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),

        // Danh sách offline contacts
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return PeopleListItem(contact: offlineContacts[index]);
            },
            childCount: offlineContacts.length,
          ),
        ),

        // Padding cuối
        const SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),
      ],
    );
  }
}
