import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../address.dart';
import '../main.dart';
import 'login.dart';
import 'login_signup.dart';


bool valid;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formkey = GlobalKey<FormState>();
  bool islogin = true;
  bool checkBoxValue = false;
  bool checkBoxValue1 = false;
  String email = "";
  String username = "";
  String password = "";
  String phone = '';
  String phoneNo, verificationId, smsCode;

  bool codeSent = false;
  final auth = FirebaseAuth.instance;
  var loading = false;

  void submit(String email, String username, String password, bool login,
      String phone, BuildContext ctx) async {
    AuthResult authresult;
    try {
      setState(() {
        loading = true;
      });
      authresult = await auth.createUserWithEmailAndPassword(
          email: phone + "@test.com", password: password);
      mail = email;
      await Firestore.instance
          .collection('users_main')
          .document(authresult.user.uid)
          .setData({
        'username': username,
        'email': email,
        'phone': phone,
        'password': password,
      });


      Firestore.instance.collection('user-activity')
      .document(phone).collection('cart');
      Firestore.instance.collection('user-activity')
      .document(phone).collection('favourites');
      Firestore.instance.collection('user-activity')
      .document(phone).collection('order');
      Firestore.instance.collection('user-activity')
      .document(phone).collection('search');

      user = username;
      phoning = phone;
      currentSelectedIndex = 6;

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => AddressPage()));
    } on PlatformException catch (error) {
      var message = ' An error occured, please check credentials';
      if (error.message != null) {
        message = error.message;
      }

      /*  Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.black,
        duration: Duration(seconds: 5),
      ));
*/

      Alert(
        context: context,
        type: AlertType.error,
        title: "Error",
        buttons: [
          DialogButton(
            child: Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          )
        ],
      ).show();
      setState(() {
        loading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        loading = false;
      });
    }
  }

  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds).then((value) {
      FirebaseAuth.instance.signOut();
      setState(() {
        loading = false;
      });
      trysubmit(context);
    }).catchError((e) {
      error = true;
      setState(() {
        loading = false;
      });
      Alert(
        context: context,
        type: AlertType.error,
        title: "Error",
        buttons: [
          DialogButton(
            child: Text(
              e.message,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          )
        ],
      ).show();
    });
  }

  signInWithOTP(smsCode, verId) {
    setState(() {
      loading = true;
    });
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }

  void show(BuildContext cont) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Verified",
      buttons: [
        DialogButton(
          child: Text(
            "Phone Verifictaion Completed. Otp Not Required.",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        )
      ],
    ).show();
  }

  void trysubmit(BuildContext cont) async {
    valid = formkey.currentState.validate();
    FocusScope.of(cont).unfocus();
    if (smsCode.isNotEmpty && valid && checkBoxValue && checkBoxValue1) {
      formkey.currentState.save();
      submit(email.trim(), username.trim(), password.trim(), islogin,
          phone.trim(), cont);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/background1.png',
              ),
              fit: BoxFit.cover,
            )
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                Image.asset(
                  'images/logo.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                ),
                Container(
                    child: Text('Register',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height*0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                Container(
                  width: 0.8 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      key: ValueKey('name'),

                      //obscureText: true,
                      style: TextStyle(
                          color: Color.fromRGBO(00, 44, 64, 1),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,

                      decoration: InputDecoration(
                        hintText: '  Full name',
                        hintStyle: TextStyle(
                          fontSize: 20.0,
                          color: Color.fromRGBO(00, 44, 64, 1),
                        ),
                        border: InputBorder.none,
                      ),

                      onSaved: (value) {
                        username = value;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                Container(
                  width: 0.8 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      key: ValueKey('email'),

                      //obscureText: true,
                      style: TextStyle(
                          color: Color.fromRGBO(00, 44, 64, 1),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,

                      decoration: InputDecoration(
                        hintText: '  Email ID',
                        hintStyle: TextStyle(
                          fontSize: 20.0,
                          color: Color.fromRGBO(00, 44, 64, 1),
                        ),
                        border: InputBorder.none,
                      ),

                      onSaved: (value) {
                        email = value;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                Container(
                  width: 0.8 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      //obscureText: true,
                      style: TextStyle(
                          color: Color.fromRGBO(00, 44, 64, 1),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,

                      decoration: InputDecoration(
                        hintText: '  Mobile Number',
                        hintStyle: TextStyle(
                          fontSize: 20.0,
                          color: Color.fromRGBO(00, 44, 64, 1),
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (val) {
                        setState(() {
                          phone = val;
                          if (phone.length == 10) {
                            verifyPhone(phone);
                          }
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                Stack(alignment: Alignment(1.0, 0.0), // right & center
                    children: <Widget>[
                      Container(
                        width: 0.8 * MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                              //obscureText: true,
                              style: TextStyle(
                                  color: Color.fromRGBO(00, 44, 64, 1),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                hintText: '  OTP Code',
                                hintStyle: TextStyle(
                                  fontSize: 20.0,
                                  color: Color.fromRGBO(00, 44, 64, 1),
                                ),
                                border: InputBorder.none,
                              ),
                              onChanged: (val) {
                                smsCode = val;
                              }),
                        ),
                      ),
                      FlatButton(
                          onPressed: () {
                            codeSent = false;
                            verifyPhone(phone);
                          },
                          child: Text(
                            "Get OTP Code",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color.fromRGBO(173, 173, 117, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                Container(
                  width: 0.8 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      key: ValueKey('password'),
                      obscureText: true,
                      style: TextStyle(
                          color: Color.fromRGBO(00, 44, 64, 1),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        hintText: '  Set Password',
                        hintStyle: TextStyle(
                          fontSize: 20.0,
                          color: Color.fromRGBO(00, 44, 64, 1),
                        ),
                        border: InputBorder.none,
                      ),
                      onSaved: (value) {
                        password = value;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                Container(
                  width: 0.8 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(173, 173, 117, 1),
                  ),
                  child: FlatButton(
                    color: Color.fromRGBO(173, 173, 117, 1),
                    onPressed: () {
                      signInWithOTP(smsCode, verificationId);
                    },
                    child: loading
                        ? CircularProgressIndicator()
                        : Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      activeColor: Color.fromRGBO(00, 44, 64, 1),
                      value: checkBoxValue1,
                      onChanged: (bool value) {
                        setState(() {
                          checkBoxValue1 = value;
                        });
                      },
                    ),
                    Text(
                      "I Agree all terms and polices",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height*0.02),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      activeColor: Color.fromRGBO(00, 44, 64, 1),
                      value: checkBoxValue,
                      onChanged: (bool value1) {
                        setState(() {
                          checkBoxValue = value1;
                        });
                      },
                    ),
                    Text(
                      "I Agree i have legal Drinking",
                      style: TextStyle(

                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height*0.02),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "as per state domicile",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height*0.02),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already Have An Account?",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height*0.017),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => LogIn()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.017),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      print('Hello Working ??');
      smsCode = '125';
      // FocusScope.of(context).unfocus();
      //show(context);

      //  AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      print(forceResend);

      this.verificationId = verId;
      setState(() {
        codeSent = true;
      });
      print(codeSent);
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91" + phoneNo,
        timeout: const Duration(seconds: 100),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
