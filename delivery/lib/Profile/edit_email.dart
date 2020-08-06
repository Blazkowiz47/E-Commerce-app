import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditEmail extends StatefulWidget {
  @override
  _EditEmailState createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
  String name;
  var user;
  final usernameController = new TextEditingController();
  final key = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    getName();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
      appBar: AppBar(),
      body: new Center(
        child: Column(
          children: [
            SizedBox(
              height: 60.0,
            ),
            name == null
                ? Text(
                    'Loading...',
                    style: TextStyle(fontSize: 22.0),
                  )
                : Text(
                    '\t\t\t\t\t\t\t\tEmail Address\n  $name',
                    style: TextStyle(fontSize: 22.0),
                  ),
            SizedBox(
              height: 60.0,
            ),
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 1.35,
              child: new TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey[200],
                      width: 1.8,
                    ),
                  ),
                  hintText: 'Enter new email address',
                  fillColor: Colors.white,
                  filled: true,
                ),
                controller: usernameController,
                validator: (val) =>
                    val.length < 10 ? 'Invalid email' : null,
              ),
            ),
            RaisedButton(
              child: Text('Update Email'),
              onPressed: () async {
                usernameController.text == null
                    ? key.currentState.showSnackBar(
                        SnackBar(content: Text('Enter a name first')))
                    : await updateData();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => EditEmail()));
              },
            ),
          ],
        ),
      ),
    );
  }

  updateData() async {
    await Firestore.instance
        .collection('delivery-users')
        .document(user.uid)
        .updateData({
      'email': usernameController.text,
    });
  }

  getName() async {
    user = await FirebaseAuth.instance.currentUser();
    await Firestore.instance
        .collection('delivery-users')
        .document(user.uid)
        .get()
        .then((value) {
      setState(() {
        name = value.data['email'];
      });
    });
  }
}
