import 'package:flutter/material.dart';
import 'Authentication/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rtrigger/profile.dart';
import 'Authentication/login_signup.dart';

class Edit extends StatefulWidget {
  final String title;
  final int index;
  Edit(this.title, this.index);
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  String id = user;
  Future<void> update(var data) async {
    final user = await FirebaseAuth.instance.currentUser();
    return Firestore.instance
        .collection('users')
        .document(user.uid)
        .updateData(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.white, title: Text("Edit Details")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[300],
              ),
              child: TextFormField(
                initialValue: widget.title,
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(0, 44, 64, 1),
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
                decoration: InputDecoration(border: InputBorder.none),
                onChanged: (val) {
                  id = val;
                },
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: RaisedButton(
              onPressed: () {
                if (widget.index == 0) {
                  update({'username': id});
                  user = id;
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Profile()));
                } else if (widget.index == 2) {
                  update({'email': id});
                  mail = id;
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Profile()));
                }
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50.0),
                child: Text("Save Changes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    )),
              ),
              color: Color.fromRGBO(00, 44, 64, 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
