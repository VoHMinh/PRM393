class Contact {
  final String name;
  final String avatarUrl;
  final String lastMessage;
  final String lastTime;
  final bool isOnline;
  final int unreadCount;

  const Contact({
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
    required this.lastTime,
    required this.isOnline,
    required this.unreadCount,
  });

  String get initials {
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[parts.length - 1][0]}';
    }
    return name[0];
  }
}
