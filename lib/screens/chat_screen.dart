import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  User loggedInuser;
  TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    messageController = TextEditingController();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if(user != null){
        loggedInuser = user;
        print(loggedInuser.email);
      }else{
        Navigator.of(context).pushReplacementNamed('/login');
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                constraints: BoxConstraints.tightFor(height: 30),
                child: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Text('FlashChat'),
          ],
        ),
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: (){
              _auth.signOut();
              Navigator.of(context).pushReplacementNamed('/login');
            },
            child: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('messages').snapshots(),
              builder: (context, snapshot){
                print(snapshot);
                if(snapshot.hasData){
                  return ListView(
                    reverse: true,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    children: snapshot.data.docs
                      .reversed
                      .map<Widget>((message){
                      return MessageBubble(
                        text: message.data()['text'],
                        sender: message.data()['sender'],
                        time: int.tryParse(message.id)??0,
                        isMe: message.data()['sender'] == loggedInuser.email,
                      );
                    }).toList(),
                  );
                }else{
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
                    ),
                  );
                }
              },
            ),
          ),
          Container(
            decoration: kMessageContainerDecoration,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: kMessageTextFieldDecoration,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.lightBlue,
                  ),
                  onPressed: () async {
                    try {
                      final docRef = await _firestore.collection('messages')
                        .doc(DateTime.now().millisecondsSinceEpoch.toString()).set({
                        'text': messageController.text,
                        'sender': loggedInuser.email,
                      });
                    } on Exception catch (e) {
                      print(e);
                    }
                    finally{
                      messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
