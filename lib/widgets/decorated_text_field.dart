import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DecoratedTextField extends StatelessWidget {

  final String hintText;
  final Function (String value) onChange;
  final bool obscureText;
  final TextInputType keyboard;
  DecoratedTextField({
    this.hintText,
    this.onChange,
    this.obscureText = false,
    this.keyboard = TextInputType.emailAddress,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboard,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black54,
        ),
        border: kInputBorder,
        enabledBorder: kInputBorder,
        focusedBorder:kInputBorder.copyWith(
          borderSide: BorderSide(
            width: 2,
            color: Colors.blueAccent
          )
        ),
      ),
      onChanged: onChange,
    );
  }
}
