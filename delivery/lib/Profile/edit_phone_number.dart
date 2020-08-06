import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditPhoneNumber extends StatefulWidget {
  @override
  _EditPhoneNumberState createState() => _EditPhoneNumberState();
}

class _EditPhoneNumberState extends State<EditPhoneNumber> {
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
                    'Mobile Number - $name',
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
                  hintText: 'Enter new Mobile Number',
                  fillColor: Colors.white,
                  filled: true,
                ),
                keyboardType: TextInputType.number,
                controller: usernameController,
                validator: (val) =>
                    val.length != 10 ? 'Invalid Number' : null,
              ),
            ),
            RaisedButton(
              child: Text('Update Number'),
              onPressed: () async {
                if(usernameController.text.length != 10)
                  key.currentState.showSnackBar(SnackBar(content: Text('Enter a valid number')));
                else{
                  await updateData();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => EditPhoneNumber()));
                }
                    
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
      'phone': usernameController.text,
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
        name = value.data['phone'];
      });
    });
  }
}
