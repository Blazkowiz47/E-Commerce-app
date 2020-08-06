import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rtrigger/admin_chat.dart';
import './message.dart';
import './new_message.dart';
import 'Authentication/login_signup.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();

    final fbm = FirebaseMessaging();
    fbm.requestNotificationPermissions();
    fbm.configure(onMessage: (msg) {
      print(msg);
      return;
    }, onResume: (message) {
      print(message);
      return;
    }, onLaunch: (message) {
      print(message);
      return;
    });
    fbm.subscribeToTopic('chat');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(
            color: Color.fromRGBO(00, 44, 64, 1),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: 
       Column(

          children: <Widget>[
            Expanded(

              child: Messages(),
            ),
        NewMessage(),
          ],
        ),
      
    );
  }
}
