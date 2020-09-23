import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/widgets/decorated_text_field.dart';
import 'package:flash_chat/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

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
          mainAxisSize: MainAxisSize.max,
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
            ),
            SizedBox(height: 10,),
            DecoratedTextField(
              hintText: 'Senha',
              onChange: (value){
                password = value;
              },
              obscureText: true,
              keyboard: TextInputType.visiblePassword,
            ),
            SizedBox(height: 50,),
            RoundButton(
              color: Colors.blueAccent,
              onPressed: () async {
                final progress = ProgressHUD.of(context);
                progress.showWithText('ENTRANDO');
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  if(newUser != null){
                    Navigator.of(context).pushNamed('/chat');
                  }
                  progress.dismiss();
                } on Exception catch (e) {
                  print(e);
                  progress.dismiss();
                }
              },
              label: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
