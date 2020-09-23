import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/main_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

void main() {
  runApp(FlashChatApp());
}

class FlashChatApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flash Chat',
      initialRoute: '/',
      routes: {
        '/': (context)=>MainScreen(),
        '/login': (context)=>ProgressHUD(
          child: LoginScreen(),
          textStyle: kProgressHUDTextStyle,
        ),
        '/register': (context)=>ProgressHUD(
          child: RegistrationScreen(),
          textStyle: kProgressHUDTextStyle,
        ),
        '/chat': (context)=>ChatScreen(),
      },
    );
  }
}
