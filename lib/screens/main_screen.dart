import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/widgets/round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin{

  AnimationController controller;
  CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.bounceOut
    );
    controller.forward();
    controller.addListener(() {
      setState(() {

      });
    });
    Firebase.initializeApp();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    constraints: BoxConstraints.tightFor(height: animation.value * 100),
                    child: Image.asset(
                      'images/logo.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Expanded(
                  child: TypewriterAnimatedTextKit(
                    text: ['Flash Chat'],
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.black54
                    ),
                    speed: Duration(milliseconds: 500),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
            RoundButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/login');
              },
              label: 'Login',
            ),
            SizedBox(height: 20,),
            RoundButton(
              color: Colors.blueAccent,
              onPressed: (){
                Navigator.of(context).pushNamed('/register');
              },
              label: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
