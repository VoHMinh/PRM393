/// Model đại diện cho một contact/người dùng trong app
class Contact {
  final String id;
  final String name;
  final String avatarUrl;
  final String lastMessage;
  final String lastMessageTime;
  final bool isOnline;
  final bool isUnread;

  const Contact({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.isOnline,
    this.isUnread = false,
  });

  /// Lấy chữ cái đầu tiên của tên để làm fallback avatar
  String get initials {
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[parts.length - 1][0]}';
    }
    return name[0];
  }
}
