import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Authentication/login_signup.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final controller = TextEditingController();
  String message = "";
  void sendmessage() async {
    FocusScope.of(context).unfocus();
    final user1 = await FirebaseAuth.instance.currentUser();
    final name =
        await Firestore.instance.collection('users').document(user1.uid).get();
    await Firestore.instance.collection('chat').add({
      'text': message,
      'createdAt': Timestamp.now(),
      'username': name['username'],
    });
    controller.clear();
  }

  void display() {
    print(message.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              autocorrect: true,
              textCapitalization: TextCapitalization.sentences,
              enableSuggestions: true,
              decoration: InputDecoration(labelText: "New Message..."),
              controller: controller,
              onChanged: (value) {
                setState(() {
                  message = value;
                });
              },
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.black,
            ),
            color: Colors.black,
            onPressed: message.trim().isEmpty ? display : sendmessage,
          ),
        ],
      ),
    );
  }
}
