import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:rtiggers/Registration/email_verification.dart';
import 'package:rtiggers/Registration/take_signature.dart';
import 'package:rtiggers/colors.dart';

// android:requestLegacyExternalStorage="true"  to be added in ANdroidManifest for file_picker

class Signature extends StatefulWidget {
  @override
  _SignatureState createState() => _SignatureState();
}

class _SignatureState extends State<Signature> {
  int radioVal = 0;
  File file;
  int show = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: getBody(),
    );
  }

  getBody() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: height*0.2,
            width: width*0.4,
            child: Image.asset('assets/logo.png'),
          ),
        ),
        new Text('Signature',
            style: TextStyle(fontSize: height*0.05, color: Colors.white)),
        Padding(
          padding: EdgeInsets.all(height*0.013),
        ),
        RadioListTile(
            value: 0,
            groupValue: radioVal,
            activeColor: brownColor,
            title: Text('I want to draw my signature on the screen',
                style: TextStyle(color: Colors.white,
                fontSize: height*0.02)),
            onChanged: (val) {
              setState(() {
                radioVal = val;
                print(val);
              });
            }),
        RadioListTile(
            value: 1,
            groupValue: radioVal,
            activeColor: brownColor,
            title: Text('I want to upload an image of my signature',
                style: TextStyle(color: Colors.white,
                    fontSize: height*0.02)),
            onChanged: (val) {
              setState(() {
                radioVal = val;
                print(val);
              });
            }),
        Padding(padding: EdgeInsets.symmetric(vertical: height * 0.015, horizontal: width * 0.028)),
        radioVal == 0 ? _signatureWidget() : _uploadWidget(),
        Padding(padding: EdgeInsets.symmetric(vertical: height * 0.015, horizontal: width * 0.028)),
        Padding(
          padding: EdgeInsets.only(right: width * 0.0875),
          child: Align(
            child: Text(
              'Skip',
              style: TextStyle(color: brownColor,
              fontSize: height*0.02),
            ),
            alignment: Alignment.centerRight,
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: height * 0.015, horizontal: width * 0.028)),
        continueButton(),
      ],
    );
  }

  continueButton() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
      onPressed: () async {
        if(show == 1) {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => EmailVerification()));
        }
      },
      minWidth: MediaQuery.of(context).size.width / 1.35,
      color: brownColor,
      child: Text("Continue",
          style: TextStyle(
              color: Colors.white, fontSize: height*0.04, letterSpacing: 1.1)),
      height: height*0.08,
    );
  }

  _uploadWidget() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () async {
        file = await FilePicker.getFile();
        //final path = await FlutterDocumentPicker.openDocument();
        //print(path.toString() + "**********************************8");
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
            borderRadius: BorderRadius.circular(10.0), color: Colors.white),
        alignment: Alignment.center,
        child: show == 1 ? Expanded(
          child: Container(
            child: Image.file(file),
          ),
        ) :Text(
          'Click here to upload',
          style: TextStyle(color: brownColor,
          fontSize: height*0.02),
        ),
      ),
    );
  }

  _signatureWidget() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignApp())),
      child: Container(
        height: height*0.2,
        width: MediaQuery.of(context).size.width / 1.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Colors.white),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.edit,
              color: brownColor,
            ),
            Text(
              'Click here to sign !',
              style: TextStyle(color: brownColor,
                  fontSize: height*0.02),
            ),
          ],
        ),
      ),
    );
  }
}
