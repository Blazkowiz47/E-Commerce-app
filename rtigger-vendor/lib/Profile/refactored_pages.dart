import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  final String process;
  EditPage({Key key, @required this.process}) : super(key: key);
  @override
  _EditPageState createState() => _EditPageState(process: process);
}

class _EditPageState extends State<EditPage> {
  _EditPageState({Key key, @required this.process});

  File file;

  int show = 0;
  int sign = 0;

  String process;
  String name;
  var user;
  final usernameController = new TextEditingController();
  final key = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    if(process == 'Signature'){
      sign = 1;
    }else{
      getName();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60.0,
            ),
            name == null
                ? Text(
                    'Change the $process',
                    style: TextStyle(fontSize: 22.0),
                  )
                : Text(
                    'Current Name - $name',
                    style: TextStyle(fontSize: 22.0),
                  ),
            SizedBox(
              height: 60.0,
            ),
            sign == 1 ? _uploadWidget() : Container(
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
                  hintText: 'Enter new $process',
                  fillColor: Colors.white,
                  filled: true,
                ),
                controller: usernameController,
                validator: (val) =>
                    val.length == 0 ? '$process can not be empty' : null,
              ),
            ),
            sign == 1 ? Container() : RaisedButton(
              child: Text('Update $process'),
              onPressed: () async {
                usernameController.text == null
                    ? key.currentState.showSnackBar(
                        SnackBar(content: Text('Enter a $process first')))
                    : await updateData();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => EditPage(process: process,)));
              },
            ),
          ],
        ),
      ),
    );
  }

  updateData() async {
    await Firestore.instance
        .collection('ShopKeeperUser')
        .document(user.uid)
        .setData({
      '$process': usernameController.text,
    });
  }

  getName() async {
    try{
user = await FirebaseAuth.instance.currentUser();
    await Firestore.instance
        .collection('user')
        .document(user.uid)
        .get()
        .then((value) {
      setState(() {
        name = value.data['name'];
      });
    });
    }catch(e){
      print(e);
    }
    
  }

  _uploadWidget() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: GestureDetector(
        onTap: () async {
          file = await FilePicker.getFile();
          StorageReference storageReference = FirebaseStorage.instance
              .ref()
              .child('user_signature').child('user');
          StorageUploadTask uploadTask = storageReference.putFile(file);
          await uploadTask.onComplete;
          print('File Uploaded');
          setState(() {
            show = 1;
          });
        },
        child: Container(
          height: height*0.2,
          width: MediaQuery.of(context).size.width / 1.35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.green[200]),
          alignment: Alignment.center,
          child: show == 1 ? Expanded(
            child: Container(
              child: Image.file(file),
            ),
          ) :Text(
            'Click here to upload',
            style: TextStyle(
                fontSize: height*0.02),
          ),
        ),
      ),
    );
  }
}


