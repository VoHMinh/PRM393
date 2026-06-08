import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set thanh status bar trong suốt cho giao diện đẹp hơn
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MessengerApp());
}

/// Root widget của ứng dụng Messenger clone
class MessengerApp extends StatelessWidget {
  const MessengerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Màu chính xanh Messenger
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0084FF),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        // Font mặc định
        fontFamily: 'Roboto',
        // Splash effect nhẹ nhàng
        splashFactory: InkSparkle.splashFactory,
      ),
      home: const HomeScreen(),
    );
  }
}
