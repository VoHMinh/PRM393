import 'package:flutter/material.dart';

/// Widget ô tìm kiếm với giao diện giống Messenger
class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2F5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Tìm kiếm',
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
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
