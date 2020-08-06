import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rtiggers/Authentication/authentication.dart';
import 'package:rtiggers/LoginScreen/login.dart';
import 'package:rtiggers/colors.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final key = GlobalKey<ScaffoldState>();
  final nameController = new TextEditingController();
  final emailController = new TextEditingController();
  final mobileController = new TextEditingController();
  final otpController = new TextEditingController();
  final dobController = new TextEditingController();
  final addressController = new TextEditingController();
  final stateController = new TextEditingController();
  final cityController = new TextEditingController();
  final pinCodeController = new TextEditingController();

  bool privacyCheck = false;
  bool drinkingCheck = false;

  // Registration variables
  String smsCode, verificationId;
  bool codeSent = false;
  bool verified = false;
  bool registered = false;

  final OTPSnackBar = SnackBar(
    content: Text("OTP Sent !"),
  );
  final OTPVerifiedSnackBar = SnackBar(
    content: Text("Phone Number Verified!"),
  );
  AuthCredential loginKey;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: blueColor,
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: blueColor,
              child: Image.asset(
                "assets/background1.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: getContents(),
          )
        ],
      ),
    );
  }

  getContents() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 8.0,
          ),
          Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width / 2,
            child: Center(child: new Image.asset('assets/logo.png')),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: Center(
                child: new Text('Register',
                    style: TextStyle(
                        color: brownColor,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold))),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: new TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  hintText: 'Full Name',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  disabledBorder: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
              controller: nameController,
              validator: (val) => val.isEmpty ? 'Name can not be empty' : null,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: new TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  hintText: 'E-Mail Id',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  disabledBorder: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
              controller: emailController,
              validator: (val) => val.isEmpty ? 'Name can not be empty' : null,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: new TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  hintText: 'Mobile Number',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  disabledBorder: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
              keyboardType: TextInputType.number,
              controller: mobileController,
              validator: (val) => val.isEmpty ? 'Name can not be empty' : null,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: new TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  hintText: 'DOB',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  disabledBorder: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
              controller: dobController,
              validator: (val) => val.isEmpty ? 'Name can not be empty' : null,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: new TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  hintText: 'Address',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  disabledBorder: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
              controller: addressController,
              validator: (val) => val.isEmpty ? 'Name can not be empty' : null,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: new TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  hintText: 'State',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  disabledBorder: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
              controller: stateController,
              validator: (val) => val.isEmpty ? 'Name can not be empty' : null,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: new TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  hintText: 'City',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  disabledBorder: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
              controller: cityController,
              validator: (val) => val.isEmpty ? 'Name can not be empty' : null,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: new TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  hintText: 'Pin Code',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  disabledBorder: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
              controller: pinCodeController,
              validator: (val) => val.isEmpty ? 'Name can not be empty' : null,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: new TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  disabledBorder: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: 'OTP Code',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  suffix: FlatButton(
                      onPressed: () {
                        mobileController.text = mobileController.text.trim();
                        codeSent
                            ? AuthService().signWithOTP(smsCode, verificationId)
                            : verifyPhone("+91" + mobileController.text);

                        if (verified) {
                          setState(() {
                            key.currentState.showSnackBar(OTPVerifiedSnackBar);
                          });
                        }
                      },
                      child: codeSent
                          ? Text("Submit the OTP Code",
                              style: TextStyle(color: Colors.white))
                          : Text("Get OTP Code",
                              style: TextStyle(color: Colors.white)))),
              controller: otpController,
              keyboardType: TextInputType.number,

              // validator: (val) => val.isEmpty ? 'Enter ' : null,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            onPressed: () async {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));

              if (_formKey.currentState.validate()) {
                if (verified) {
                  print('verified man !');
                  if (privacyCheck && drinkingCheck) {
                    print('starting........................................' +
                        smsCode.toString());
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  } else {
                    key.currentState.showSnackBar(SnackBar(
                      content: new Text('Please agree to our policies'),
                    ));
                  }
                } else {
                  key.currentState.showSnackBar(SnackBar(
                      content: new Text(
                          'Something Went Wrong !! Please try again later'),
                      duration: Duration(
                        seconds: 10,
                      )));
                }
              }
            },
            minWidth: MediaQuery.of(context).size.width / 1.35,
            color: brownColor,
            child: Text("Send",
                style: TextStyle(color: Colors.white, fontSize: 22.0)),
            height: 43.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: CheckboxListTile(
              value: privacyCheck,
              onChanged: (newValue) {
                setState(() {
                  privacyCheck = newValue;
                });
              },
              title: Text('I Agree all Terms & Policies',
                  style: TextStyle(fontSize: 12.5, color: Colors.white)),
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.white,
              activeColor: Colors.blueGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: CheckboxListTile(
              value: drinkingCheck,
              onChanged: (newValue) {
                setState(() {
                  drinkingCheck = newValue;
                });
              },
              title: Text(
                  'I Agree that I have legal drinking age\nas per state domocile',
                  style: TextStyle(fontSize: 12.5, color: Colors.white)),
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.white,
              activeColor: Colors.blueGrey,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account ?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.8,
                      color: Colors.white)),
              GestureDetector(
                child: Text('Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.8,
                        color: Colors.white)),
                onTap: () => Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => LoginPage())),
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(15.0)),
        ],
      ),
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified =
        (AuthCredential authResult) async {
      // AuthService().signIn(authResult);
      FirebaseAuth.instance.signInWithCredential(authResult).then((user) async {
        await FirebaseAuth.instance.currentUser();
        await Firestore.instance
            .collection('delivery-users')
            .document(user.user.uid)
            .setData({
          "name": nameController.text,
          "email": emailController.text,
          "phone": mobileController.text,
          "dob": dobController.text,
          "address": addressController.text,
          "state": stateController.text,
          "city": cityController.text,
          "pin": pinCodeController.text,
          "id": mobileController.text,
          "password": 'test123',
          "status": '',
          "notifications": false,
        });
      });
      setState(() async {
        this.verified = true;
        this.loginKey = authResult;
        otpController.text = smsCode;
      });
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');

      if (registered)
        key.currentState.showSnackBar(SnackBar(
          content: new Text('Already Registered please try Login'),
        ));

      registered = true;
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 60),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
