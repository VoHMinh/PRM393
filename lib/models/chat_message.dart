/// Model đại diện cho một tin nhắn trong cuộc trò chuyện
class ChatMessage {
  final String id;
  final String contactId;
  final String text;
  final bool isMe;
  final String time;

  const ChatMessage({
    required this.id,
    required this.contactId,
    required this.text,
    required this.isMe,
    required this.time,
  });
}
