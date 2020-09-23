import 'package:flash_chat/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {

  final String text;
  final String sender;
  final int time;
  final bool isMe;
  MessageBubble({this.text, this.sender, this.time, this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w300
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2),
            child: Material(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
                topRight: isMe ? Radius.zero : Radius.circular(30),
                topLeft: isMe ? Radius.circular(30) : Radius.zero
              ),
              elevation: 5,
              color: isMe ? Colors.lightBlue : Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Text(
                  text,
                  style: TextStyle(
                    color: isMe ? Colors.white : Colors.black,
                    fontSize: 15
                  ),
                ),
              ),
            ),
          ),
          Text(
            DateTime.fromMillisecondsSinceEpoch(time).toString().split('.')[0],
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w100
            ),
          ),
        ],
      ),
    );
  }
}
