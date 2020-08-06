import 'package:flutter/material.dart';
import 'package:rtrigger/Authentication/signup.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';


String user='Mike';
String phoning="7902472359";
String mail='test@test.com';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
    final auth = FirebaseAuth.instance;
  var loading = false;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Center(
          child: Image.asset(
            'images/background.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,

          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2-MediaQuery.of(context).size.width / 4,
          top: MediaQuery.of(context).size.height/10,
          child: Image.asset(
            'images/logo.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width/2,
            height: MediaQuery.of(context).size.width/2,
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height / 2 +MediaQuery.of(context).size.height / 20,
          left: MediaQuery.of(context).size.width / 2-MediaQuery.of(context).size.width / 4,
          width: MediaQuery.of(context).size.width / 2,
          child: Container(
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                 color:Color.fromRGBO(173, 173, 117, 1),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SignUp()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20,),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height / 2 -MediaQuery.of(context).size.height / 12,
          left: MediaQuery.of(context).size.width / 2-MediaQuery.of(context).size.width / 4,
          width: MediaQuery.of(context).size.width / 2,
          child: Container(
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                 color:Color.fromRGBO(173, 173, 117, 1),
              ),
              child: FlatButton(
                onPressed: () {
                     Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => LogIn()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Log In",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold,fontSize:20),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
        ),
      ],
    ));
  }
}
