import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rtiggers/Registration/signature.dart';
import 'package:rtiggers/colors.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool canProceed = false;
  int _businessRadioValue = 0;
  var _bankRadioValue;
  final gstINController = new TextEditingController();
  final holdernameController = new TextEditingController();
  final accountController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: new Column(
          children: [
            SizedBox(
              height: y*0.065,
            ),
            businessDetails(),
            SizedBox(
              height: y*0.065,
            ),
            bankDetails(),
            SizedBox(
              height: y*0.065,
            ),
            continueButton(),
            SizedBox(
              height: y*0.065,
            ),
          ],
        ),
      ),
    );
  }

  bankDetails() {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Give your Bank Details',
              style: TextStyle(
                fontSize: y*0.035,
                fontWeight: FontWeight.bold,
              )),
          Padding(
            padding: EdgeInsets.only(top: y*0.013),
          ),
          RadioListTile(
            title: Text('I have a bank account in my registered business name',
            style: TextStyle(fontSize: y*0.018),),
            value: 1,
            groupValue: _bankRadioValue,
            onChanged: (val) {
              setState(() {
                _bankRadioValue = val;
              });
            },
            activeColor: Colors.black,
          ),
          RadioListTile(
            title: Text(
                'I have applied/will apply for bank account in my registered business',
              style: TextStyle(
                  fontSize: y*0.018
              ),),
            value: 2,
            groupValue: _bankRadioValue,
            onChanged: (val) {
              setState(() {
                print(val);
                _bankRadioValue = val;
              });
            },
            activeColor: Colors.black,
          ),
          SizedBox(
            height: y*0.026,
          ),
          Container(
            height: y*0.05,
            width: x / 1.35,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: new TextFormField(
              textAlign: TextAlign.justify,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 1.8,
                  ),
                ),
                hintText: 'Enter account holder\'s name',
                hintStyle: TextStyle(
                  color: Colors.grey[700],
                  fontSize: y*0.02
                ),
                fillColor: Colors.grey[100],
                filled: true,
              ),
              controller: holdernameController,
              validator: (val) =>
                  val.length == 0 ? 'Name can not be empty' : null,
            ),
          ),
          SizedBox(
            height: y * 0.026,
          ),
          Container(
            height: y*0.05,
            width: x / 1.35,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: TextFormField(
              textAlign: TextAlign.justify,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 1.8,
                  ),
                ),
                hintText: 'Enter bank account number',
                hintStyle: TextStyle(
                  color: Colors.grey[700],
                    fontSize: y*0.02
                ),
                fillColor: Colors.grey[100],
                filled: true,
              ),
              controller: accountController,
              validator: (val) =>
                  val.length == 0 ? 'Account number can not be empty' : null,
            ),
          ),
        ],
      ),
    );
  }

  continueButton() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45.0)),
      onPressed: () async {
        if(!canProceed) {
          setData();
          Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => Signature()));
        }
      },
      minWidth: MediaQuery.of(context).size.width / 1.35,
      color: blueColor,
      child: Text("Continue",
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, letterSpacing: 1.1)),
      height: height*0.08,
    );
  }

  businessDetails() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Give your Business Details',
              style: TextStyle(
                fontSize: height*0.035,
                fontWeight: FontWeight.bold,
              )),
          Padding(
            padding: EdgeInsets.only(top: height*0.013),
          ),
          RadioListTile(
            title: Text('I have a GSTIN',
              style: TextStyle(
                  fontSize: height*0.018
              ),),
            value: 1,
            groupValue: _businessRadioValue,
            onChanged: (val) {
              setState(() {
                _businessRadioValue = val;
              });
            },
            activeColor: Colors.black,
          ),
          RadioListTile(
            title:
                Text('I will only sell in GSTIN exempt categories like books',
                  style: TextStyle(
                      fontSize: height*0.018
                  ),),
            value: 2,
            groupValue: _businessRadioValue,
            onChanged: (val) {
              setState(() {
                // print(val);
                _businessRadioValue = val;
              });
            },
            activeColor: Colors.black,
          ),
          RadioListTile(
            title: Text('I have applied/will apply for a GSTIN',
              style: TextStyle(
                  fontSize: height*0.018
              ),),
            value: 3,
            groupValue: _businessRadioValue,
            onChanged: (val) {
              setState(() {
                _businessRadioValue = val;
              });
            },
            activeColor: Colors.black,
          ),
          SizedBox(
            height: height*0.026,
          ),
          Container(
            height: height*0.05,
            width: MediaQuery.of(context).size.width / 1.35,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: TextFormField(
              textAlign: TextAlign.justify,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 1.8,
                  ),
                ),
                hintText: 'GSTIN Number',
                hintStyle: TextStyle(
                  color: Colors.grey[700],
                  fontSize: height*0.02
                ),
                fillColor: Colors.grey[100],
                filled: true,
              ),
              controller: gstINController,
              validator: (val) =>
                  val.length < 6 ? 'GSTIN can not be less than 6 chars' : null,
            ),
          ),
        ],
      ),
    );
  }

  void setData() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user = await _auth.currentUser();
    if(gstINController!=null && accountController!=null && holdernameController!=null) {
      await Firestore.instance
          .collection('ShopKeeperUser')
          .document(user.uid)
          .updateData({
        "GSTIN": gstINController.text,
        "Account Number": accountController.text,
        "holdername": holdernameController.text,
      });
      setState(() {
        canProceed = true;
      });

    }else{
      //implement error message
    }
  }
}
