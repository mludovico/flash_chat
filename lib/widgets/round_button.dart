import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final Color color;
  final String label;
  final Function ()onPressed;
  RoundButton({this.color = Colors.lightBlue, this.label = '', this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 5,
      padding: EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(30),
      ),
      color: color,
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
