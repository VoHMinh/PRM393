import 'package:flutter_test/flutter_test.dart';
import 'package:messenger_clone/main.dart';

void main() {
  testWidgets('App renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MessengerApp());

    // Verify that the Chats title is displayed
    expect(find.text('Chats'), findsWidgets);
  });
}
