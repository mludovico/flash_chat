import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/widgets/decorated_text_field.dart';
import 'package:flash_chat/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class LoginScreen extends StatelessWidget {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                constraints: BoxConstraints.tightFor(height: 150),
                child: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(height: 50,),
            DecoratedTextField(
              hintText: 'Email',
              onChange: (value){
                email = value;
              },
              keyboard: TextInputType.emailAddress,
            ),
            SizedBox(height: 10,),
            DecoratedTextField(
              hintText: 'Senha',
              onChange: (value){
                password = value;
              },
              obscureText: true,
            ),
            SizedBox(height: 50,),
            RoundButton(
              onPressed: () async {
                ProgressHUD.of(context).showWithText('ENTRANDO');
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  if(user != null){
                    Navigator.of(context).pushNamed('/chat');
                  }
                  ProgressHUD.of(context).dismiss();
                } on Exception catch (e) {
                  print(e);
                  ProgressHUD.of(context).dismiss();
                }
              },
              label: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
