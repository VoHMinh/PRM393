import '../models/chat_message.dart';

List<ChatMessage> getMockMessagesFor(String contactName) {
  return [
    ChatMessage(
      text: 'Hi $contactName, are you free now?',
      time: '09:00',
      isMe: true,
    ),
    ChatMessage(
      text: 'Yes, I just finished my class.',
      time: '09:02',
      isMe: false,
    ),
    const ChatMessage(
      text: 'Can you review the Messenger UI with me?',
      time: '09:03',
      isMe: true,
    ),
    const ChatMessage(
      text: 'Sure. The chat list and people tab look clear.',
      time: '09:05',
      isMe: false,
    ),
    const ChatMessage(
      text: 'Great, I will add the message input too.',
      time: '09:06',
      isMe: true,
    ),
    const ChatMessage(
      text: 'Nice. Send it when you are done.',
      time: '09:08',
      isMe: false,
    ),
  ];
}
