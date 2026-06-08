import '../models/contact.dart';
import '../models/chat_message.dart';

/// Danh sách 10 contacts mẫu với dữ liệu hardcode
final List<Contact> sampleContacts = [
  const Contact(
    id: '1',
    name: 'Nguyễn Minh Anh',
    avatarUrl: 'https://i.pravatar.cc/150?img=1',
    lastMessage: 'Hẹn gặp lại nhé! 👋',
    lastMessageTime: '2 phút',
    isOnline: true,
    isUnread: true,
  ),
  const Contact(
    id: '2',
    name: 'Trần Gia Huy',
    avatarUrl: 'https://i.pravatar.cc/150?img=3',
    lastMessage: 'Tối nay đi ăn không?',
    lastMessageTime: '15 phút',
    isOnline: true,
    isUnread: true,
  ),
  const Contact(
    id: '3',
    name: 'Lê Hoàng Nam',
    avatarUrl: 'https://i.pravatar.cc/150?img=5',
    lastMessage: 'Ok bạn, mình hiểu rồi',
    lastMessageTime: '1 giờ',
    isOnline: false,
    isUnread: false,
  ),
  const Contact(
    id: '4',
    name: 'Phạm Khánh Linh',
    avatarUrl: 'https://i.pravatar.cc/150?img=9',
    lastMessage: 'Bạn gửi file cho mình nhé',
    lastMessageTime: '2 giờ',
    isOnline: true,
    isUnread: true,
  ),
  const Contact(
    id: '5',
    name: 'Võ Thanh Tùng',
    avatarUrl: 'https://i.pravatar.cc/150?img=11',
    lastMessage: 'Haha đúng rồi 😂',
    lastMessageTime: '3 giờ',
    isOnline: false,
    isUnread: false,
  ),
  const Contact(
    id: '6',
    name: 'Đặng Bảo Ngọc',
    avatarUrl: 'https://i.pravatar.cc/150?img=16',
    lastMessage: 'Cuối tuần rảnh không?',
    lastMessageTime: '5 giờ',
    isOnline: true,
    isUnread: false,
  ),
  const Contact(
    id: '7',
    name: 'Hồ Quốc Việt',
    avatarUrl: 'https://i.pravatar.cc/150?img=12',
    lastMessage: 'Mình đã hoàn thành project rồi',
    lastMessageTime: 'Hôm qua',
    isOnline: false,
    isUnread: false,
  ),
  const Contact(
    id: '8',
    name: 'Nguyễn Nhật Khang',
    avatarUrl: 'https://i.pravatar.cc/150?img=14',
    lastMessage: 'Cảm ơn bạn nhiều!',
    lastMessageTime: 'Hôm qua',
    isOnline: false,
    isUnread: false,
  ),
  const Contact(
    id: '9',
    name: 'Mai Phương Thảo',
    avatarUrl: 'https://i.pravatar.cc/150?img=20',
    lastMessage: 'Để mình check lại nhé',
    lastMessageTime: 'T2',
    isOnline: true,
    isUnread: false,
  ),
  const Contact(
    id: '10',
    name: 'Trương Đức Anh',
    avatarUrl: 'https://i.pravatar.cc/150?img=15',
    lastMessage: 'Oke, mai gặp 🤝',
    lastMessageTime: 'T2',
    isOnline: false,
    isUnread: false,
  ),
];

/// Dữ liệu tin nhắn mẫu cho từng cuộc trò chuyện
final Map<String, List<ChatMessage>> sampleMessages = {
  '1': const [
    ChatMessage(id: 'm1', contactId: '1', text: 'Hey, bạn khỏe không?', isMe: false, time: '10:00'),
    ChatMessage(id: 'm2', contactId: '1', text: 'Mình khỏe, cảm ơn bạn! Còn bạn?', isMe: true, time: '10:02'),
    ChatMessage(id: 'm3', contactId: '1', text: 'Mình cũng ổn nè 😊', isMe: false, time: '10:03'),
    ChatMessage(id: 'm4', contactId: '1', text: 'Cuối tuần này có plan gì chưa?', isMe: true, time: '10:05'),
    ChatMessage(id: 'm5', contactId: '1', text: 'Chưa có gì, bạn rủ đi đâu đó đi!', isMe: false, time: '10:06'),
    ChatMessage(id: 'm6', contactId: '1', text: 'Ok đi cà phê nhé, quán quen mình 👌', isMe: true, time: '10:08'),
    ChatMessage(id: 'm7', contactId: '1', text: 'Hẹn gặp lại nhé! 👋', isMe: false, time: '10:10'),
  ],
  '2': const [
    ChatMessage(id: 'm1', contactId: '2', text: 'Ê bạn', isMe: false, time: '14:00'),
    ChatMessage(id: 'm2', contactId: '2', text: 'Gì bạn?', isMe: true, time: '14:01'),
    ChatMessage(id: 'm3', contactId: '2', text: 'Tối nay đi ăn lẩu không?', isMe: false, time: '14:02'),
    ChatMessage(id: 'm4', contactId: '2', text: 'Đi chứ! Mấy giờ?', isMe: true, time: '14:03'),
    ChatMessage(id: 'm5', contactId: '2', text: '7h nhé, quán lẩu Hải Đặng', isMe: false, time: '14:04'),
    ChatMessage(id: 'm6', contactId: '2', text: 'Ok mình sẽ tới đúng giờ 👍', isMe: true, time: '14:05'),
    ChatMessage(id: 'm7', contactId: '2', text: 'Tối nay đi ăn không?', isMe: false, time: '14:10'),
  ],
  '3': const [
    ChatMessage(id: 'm1', contactId: '3', text: 'Bạn ơi, bài tập nhóm nộp khi nào?', isMe: true, time: '09:00'),
    ChatMessage(id: 'm2', contactId: '3', text: 'Thứ 6 tuần này bạn', isMe: false, time: '09:15'),
    ChatMessage(id: 'm3', contactId: '3', text: 'Mình đã làm phần mình rồi', isMe: true, time: '09:20'),
    ChatMessage(id: 'm4', contactId: '3', text: 'Ok bạn, mình hiểu rồi', isMe: false, time: '09:25'),
  ],
  '4': const [
    ChatMessage(id: 'm1', contactId: '4', text: 'Chào bạn!', isMe: false, time: '11:00'),
    ChatMessage(id: 'm2', contactId: '4', text: 'Chào Linh! Có gì không?', isMe: true, time: '11:02'),
    ChatMessage(id: 'm3', contactId: '4', text: 'Bạn có file slide buổi họp hôm qua không?', isMe: false, time: '11:03'),
    ChatMessage(id: 'm4', contactId: '4', text: 'Có nè, để mình gửi', isMe: true, time: '11:05'),
    ChatMessage(id: 'm5', contactId: '4', text: 'Bạn gửi file cho mình nhé', isMe: false, time: '11:06'),
  ],
  '5': const [
    ChatMessage(id: 'm1', contactId: '5', text: 'Mình mới xem phim đó', isMe: true, time: '20:00'),
    ChatMessage(id: 'm2', contactId: '5', text: 'Phim nào vậy?', isMe: false, time: '20:05'),
    ChatMessage(id: 'm3', contactId: '5', text: 'Phim mới ra nè, hay lắm!', isMe: true, time: '20:06'),
    ChatMessage(id: 'm4', contactId: '5', text: 'Haha đúng rồi 😂', isMe: false, time: '20:10'),
  ],
  '6': const [
    ChatMessage(id: 'm1', contactId: '6', text: 'Cuối tuần rảnh không bạn?', isMe: false, time: '16:00'),
    ChatMessage(id: 'm2', contactId: '6', text: 'Rảnh nè, sao?', isMe: true, time: '16:10'),
    ChatMessage(id: 'm3', contactId: '6', text: 'Đi hiking nha!', isMe: false, time: '16:12'),
    ChatMessage(id: 'm4', contactId: '6', text: 'Nghe hay đó, mấy giờ xuất phát?', isMe: true, time: '16:15'),
    ChatMessage(id: 'm5', contactId: '6', text: 'Cuối tuần rảnh không?', isMe: false, time: '16:20'),
  ],
  '7': const [
    ChatMessage(id: 'm1', contactId: '7', text: 'Project đến đâu rồi bạn?', isMe: true, time: '08:00'),
    ChatMessage(id: 'm2', contactId: '7', text: 'Gần xong rồi, đang fix bug cuối', isMe: false, time: '08:30'),
    ChatMessage(id: 'm3', contactId: '7', text: 'Nice! Cố lên nha', isMe: true, time: '08:32'),
    ChatMessage(id: 'm4', contactId: '7', text: 'Mình đã hoàn thành project rồi', isMe: false, time: '09:00'),
  ],
  '8': const [
    ChatMessage(id: 'm1', contactId: '8', text: 'Cảm ơn bạn đã giúp mình hôm qua', isMe: false, time: '12:00'),
    ChatMessage(id: 'm2', contactId: '8', text: 'Không có gì đâu 😄', isMe: true, time: '12:05'),
    ChatMessage(id: 'm3', contactId: '8', text: 'Cảm ơn bạn nhiều!', isMe: false, time: '12:06'),
  ],
  '9': const [
    ChatMessage(id: 'm1', contactId: '9', text: 'Thảo ơi, report gửi chưa?', isMe: true, time: '15:00'),
    ChatMessage(id: 'm2', contactId: '9', text: 'Chưa bạn, đang hoàn thiện', isMe: false, time: '15:10'),
    ChatMessage(id: 'm3', contactId: '9', text: 'Để mình check lại nhé', isMe: false, time: '15:15'),
  ],
  '10': const [
    ChatMessage(id: 'm1', contactId: '10', text: 'Mai họp lúc mấy giờ vậy?', isMe: true, time: '18:00'),
    ChatMessage(id: 'm2', contactId: '10', text: '9h sáng bạn', isMe: false, time: '18:10'),
    ChatMessage(id: 'm3', contactId: '10', text: 'Ok, mình sẽ chuẩn bị slide', isMe: true, time: '18:12'),
    ChatMessage(id: 'm4', contactId: '10', text: 'Oke, mai gặp 🤝', isMe: false, time: '18:15'),
  ],
};

/// Trạng thái hoạt động cho People Screen
String getStatusText(Contact contact) {
  if (contact.isOnline) {
    return 'Đang hoạt động';
  }
  // Tạo trạng thái giả khác nhau dựa trên contact
  switch (contact.id) {
    case '3':
      return 'Hoạt động 1 giờ trước';
    case '5':
      return 'Hoạt động 3 giờ trước';
    case '7':
      return 'Hoạt động hôm qua';
    case '8':
      return 'Hoạt động hôm qua';
    case '10':
      return 'Hoạt động 2 ngày trước';
    default:
      return 'Không hoạt động';
  }
}
