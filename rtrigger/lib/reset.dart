import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import './main.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Authentication/login_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './profile.dart';

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  bool loading = false;
  String current = "";
  String reset = "";
  AuthResult authresult;
  final auth = FirebaseAuth.instance;
  void submit(BuildContext context) async {
    setState(() {
      loading = true;
    });
    final media = await Firestore.instance.collection('users_main').getDocuments();
    print(user);
    print(phoning);
    int i;
    for (i = 0; i < media.documents.length; i++)
      if (media.documents[i]['email'] == mail) {
        pass = media.documents[i]['password'];
        mobile = media.documents[i]['phone'];
        ema = media.documents[i]['email'];
        phoning = media.documents[i]['phone'];
        mail = ema;
        name = media.documents[i]['username'];
        user = name;

        id = media.documents[i].documentID;
        print(id);
      }
    if (pass != current)
      Alert(
        context: context,
        type: AlertType.error,
        title: "Error",
        buttons: [
          DialogButton(
            child: Text(
              "Current Password is Not Correct",
              style: TextStyle(color: Colors.black, fontSize: 10),
            ),
            color: Colors.white,
            onPressed: () async {
              Navigator.pop(context);
            },
          )
        ],
      ).show();
    else {
      authresult = await auth.signInWithEmailAndPassword(
          email: mobile + "@test.com", password: current);
      Firestore.instance.collection('users').document(id).delete();
      authresult.user.delete();

      authresult = await auth.createUserWithEmailAndPassword(
          email: mobile + "@test.com", password: reset);
      await Firestore.instance
          .collection('users_main')
          .document(authresult.user.uid)
          .setData({
        'username': user,
        'email': mail,
        'phone': phoning,
        'password': reset,
      });
      setState(() {
        loading = false;
      });
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Profile()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset Password",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(00, 44, 64, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: new BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.rectangle,
                border: new Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Current Password',
                      labelStyle: TextStyle(color: Colors.black)),
                  onChanged: (value) {
                    current = value;
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: new BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.rectangle,
                border: new Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintText: 'New Password',
                      hintStyle: TextStyle(color: Colors.black)),
                  onChanged: (value) {
                    reset = value;
                  },
                ),
              ),
            ),
          ),
          Container(
            height: 30,
            child: RaisedButton(
              onPressed: () {
                if (current.isNotEmpty && reset.isNotEmpty) submit(context);
              },
              child: loading
                  ? CircularProgressIndicator()
                  : Text("Save Password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      )),
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
