import 'package:flutter/material.dart';
import 'package:rtiggers/LoginScreen/login.dart';
import 'package:rtiggers/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class EmailVerification extends StatefulWidget {
  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState()  {
    super.initState();
    verify();
  }

  void verify() async {
    user = await _auth.currentUser();
    try {
      await user.sendEmailVerification();
    } catch (e) {
      print("An error occurred while trying to send email verification");
      print(e.message);
    }
  }


  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: getBody(),
    );
  }

  getBody() {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: y*0.039, bottom: y*0.007),
          child: logo(),
        ),
        verificationCard(),
        detailsCard(),
        continueButton(),
      ],
    );
  }

  detailsCard() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height/2,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        margin: EdgeInsets.symmetric(vertical: height * 0.013, horizontal: width * 0.05),
        child: Padding(
          padding: EdgeInsets.only(top: height*0.025, right: width*0.075, left: width*0.075),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: Text('Your store name will appear here',
                  style: TextStyle(
                      fontSize: height*0.02
                  ),),
                alignment: Alignment.center,
              ),
              Row(
                children: [
                  Container(
                    height: height*0.052,
                    width: width*0.1,
                    child: Image.asset('assets/1.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width*0.025),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      height: height*0.02,
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(greenColor),
                        value: 0.8,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.006, horizontal: width * 0.012)
              ),
              Text(
                'Account Details',
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: height*0.02),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width*0.05,
                  top: height*0.013,
                ),
                child: twoCheckRows('Email Verification', 'Phone Verification'),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.013, horizontal: width * 0.025)
              ),
              Text(
                'Business Details',
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: height*0.02),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width*0.05,
                  top: height*0.013,
                ),
                child: twoCheckRows('GSTIN', 'Signature Verification'),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.013, horizontal: width * 0.025)
              ),
              Text(
                'Bank Account Details',
                style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: height*0.02
                  ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width*0.05,
                  top: height*0.013,
                ),
                child: twoCheckRows(
                    'Bank Account Verification', 'Cancelled Cheque',
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.013, horizontal: width * 0.025)
              ),
              Text(
                'Product Details',
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: height*0.02),
              ),
              Padding(
                padding:  EdgeInsets.only(
                  left: width*0.05,
                  top: height*0.013,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 15.0,
                      width: 15.0,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width*0.05),
                    ),
                    Text('Listing Created',
                    style: TextStyle(
                      fontSize: height*0.02
                    ),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  continueButton() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
      onPressed: () async {
        if(user.isEmailVerified) {
          Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => LoginPage()));
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

  twoCheckRows(String v1, String v2) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: height*0.015,
              width: width*0.032,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
            ),
            Text('$v1',
              style: TextStyle(
                  fontSize: height*0.02
              ),),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(2.0),
        ),
        Row(
          children: [
            Container(
              height: height*0.015,
              width: width*0.032,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
            ),
            Text('$v2',
              style: TextStyle(
                  fontSize: height*0.02
              ),),
          ],
        ),
      ],
    );
  }

  verificationCard() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height/4.2,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        margin: EdgeInsets.symmetric(vertical: height * 0.013, horizontal: width * 0.05),
        child: Padding(
          padding: EdgeInsets.only(top: height*0.025, right: width*0.070, left: width*0.075),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email Verification',
                  style:
                      TextStyle(fontSize: height*0.027, fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.all(height*0.007),
              ),
              Text(
                  'We have sent an email with subject line : (Dello MarketPlcae) - Account Verification to your registered email address',
                style: TextStyle(
                    fontSize: height*0.017
                ),),
              Text(
                  '\"xxxxxx@gmail.com\" please open the mail and click on verification link',
                style: TextStyle(
                    fontSize: height*0.017
                ),),
              Padding(
                padding: EdgeInsets.all(height*0.007),
              ),
              Text('Verification link expires in 24 hrs. If it is expired ',
                style: TextStyle(
                    fontSize: height*0.017
                ),),
              Row(
                children: <Widget>[
                  Text(
                    'click here',
                    style: TextStyle(color: greenColor,
                        fontSize: height*0.017),
                  ),
                  Text(' to resend the verification link',
                  style: TextStyle(
                    fontSize: height*0.017
                  ),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  logo() {
    return Center(
      child: Container(
          height: 120.0, width: 120.0, child: Image.asset('assets/logo.png')),
    );
  }
}
