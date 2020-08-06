import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import './main.dart';

class AuthService {
  //Handles Auth
  handleAuth() {
  

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  }
  
  //SignIn
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds).then((value) {
          FirebaseAuth.instance.signOut();

    }).catchError((e){
      error=true;
      print(e);
    });

  }

 signInWithOTP(smsCode, verId)  {
    AuthCredential authCreds =PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }
}

class ErrorMessage extends StatelessWidget {
  final String e;
  ErrorMessage(this.e);
  @override
  Widget build(BuildContext context) {
     Alert(
        context: context,
        type: AlertType.error,
        title: "Error",
        buttons: [
          DialogButton(
            child: Text(
              e,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          )
        ],
      ).show();
  }
}