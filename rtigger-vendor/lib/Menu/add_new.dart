import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rtiggers/colors.dart';

var user;
int show = 0;
String Category;
String Name;
String Price;
String Description;
String prepTiming;
String availTiming;
File file;
final category = new TextEditingController();
final name = new TextEditingController();
final price = new TextEditingController();
final description = new TextEditingController();
final PrepTiming = new TextEditingController();
final AvailTiming = new TextEditingController();

class addnew extends StatefulWidget {
  @override
  _addnewState createState() => _addnewState();
}
class _addnewState extends State<addnew> {
  upload() async {
    user = await FirebaseAuth.instance.currentUser();
    print(name);
    await Firestore.instance
        .collection('ShopKeeperUser')
        .document(user.uid)
        .collection('product')
        .document(Name)
        .setData({
      'Category': Category,
      'Product Name': Name,
      'Price': Price,
      'Description': Description,
      'Preparation Time': prepTiming,
      'Available Timing': availTiming,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: getBody(),
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
            .child('user_products').child('user').child(Name);
        StorageUploadTask uploadTask = storageReference.putFile(file);
        await uploadTask.onComplete;
        print('File Uploaded');
        setState(() {
          show = 1;
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Product Added'),
            duration: Duration(seconds: 5),
          ));
        });
      },
      child: Container(
        height: height*0.15,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70.0), color: Colors.white),
        alignment: Alignment.center,
        child: show == 1 ? Expanded(
          child: Container(
            child: Image.file(file),
          ),
        ) : Container(
          child: Icon(
            Icons.account_circle,
            size: height*0.1,
          ),
        )
      ),
    );
  }

  getBody() {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(children: [Text("2", style: TextStyle(fontWeight: FontWeight.bold))]),
      Padding(padding: EdgeInsets.only(top: y * 0.026)),
      Padding(
          padding: EdgeInsets.only(left: x * 0.0875, bottom: y * 0.013),
          child: Row(
            children: [blueText('Add New', y * 0.033)],
          )),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _uploadWidget(),
        ],
      ),
      SizedBox(height: y * 0.007),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Add Product Photo', style: TextStyle(fontSize: y * 0.0208)),
        ],
      ),
      SizedBox(height: y * 0.0195),
      addnewrow(
        leading: 'Category',
        controller: category,
      ),
      addnewrow(
        leading: 'Product Name',
        controller: name,
      ),
      addnewrow(
        leading: 'Price',
        controller: price,
      ),
      addnewrow(
        leading: 'Description',
        controller: description,
      ),
      addnewrow(
        leading: 'Preparation Time',
        controller: PrepTiming,
      ),
      addnewrow(
        leading: 'Available Timing',
        controller: AvailTiming,
      ),
      SizedBox(height: y * 0.0195),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: x / 2.5,
            height: y / 20,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: blueColor)),
              onPressed: () {
              upload();
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Product Added'),
                duration: Duration(seconds: 5),
              ));
              },
              color: blueColor,
              textColor: Colors.white,
              child: Text('Done'),
            ),
          ),
        ],
      )
    ]);
  }

  blueText(String txt, [double size = 22]) {
    return Text(
      txt,
      style: TextStyle(
          color: blueColor,
          fontSize: size,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8),
    );
  }
}

class addnewrow extends StatelessWidget {
  const addnewrow({@required this.leading, @required this.controller});

  final String leading;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
          top: y * 0.013, left: x * 0.06, right: x * 0.05, bottom: y * 0.013),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          leading,
          style: TextStyle(fontSize: y * 0.0208),
        ),
        Container(
          height: y * 0.052,
          width: x / 2.38,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.white,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            controller: controller,
            onChanged: (value) {
              switch(leading) {
                case 'Product Name': {
                  Name = value;
                }
                break;

                case 'Description': {
                  Description = value;
                }
                break;

                case 'Price': {
                  Price = value;
                }
                break;

                case 'Category': {
                  Category = value;
                }
                break;

                case 'Preparation Time': {
                  prepTiming = value;
                }
                break;

                case 'Available Timing': {
                  availTiming = value;
                }
                break;

                default: {
                  //statements;
                }
                break;
              }
            },
          ),
        ),
      ]),
    );
  }
}
