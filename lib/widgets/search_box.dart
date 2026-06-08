import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const SearchBox({super.key, required this.hintText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2F5),
        borderRadius: BorderRadius.circular(22),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFF8E8E93), fontSize: 15),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF8E8E93),
            size: 22,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 11),
        ),
      ),
    );
  }
}
