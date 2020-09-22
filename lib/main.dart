import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/main_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlashChatApp());
}

class FlashChatApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.black54
          )
        )
      ),
      title: 'Flash Chat',
      initialRoute: '/',
      routes: {
        '/': (context)=>MainScreen(),
        '/login': (context)=>LoginScreen(),
        '/register': (context)=>RegistrationScreen(),
        '/chat': (context)=>ChatScreen(),
      },
    );
  }
}
