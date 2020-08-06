import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rtiggers/LoginScreen/registration.dart';

import '../HomeScreen/HomeScreen.dart';
import 'package:rtiggers/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool checkBox = false;
  String phoneNo, verificationId, smsCode;
  bool codeSent = false;
  bool verified = false;
  final idController = TextEditingController();
  final passwordController = new TextEditingController();
  final key = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();
  bool canLogin = false;
  String _userNumber="", _password="";

  @override
  void initState() {
    getVerified();
    super.initState();
 }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/background1.png",
              fit: BoxFit.fill,
            ),
          ),
          Form(
            key: formKey,
            child: getContents(),  
          ),
          
        ],
      ),
    );
  }

  getContents() {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.2,
            width: MediaQuery.of(context).size.width / 2,
            child: Center(
                child: new Image.asset('assets/logo.png')
                ),
          ),
          SizedBox(
            height: y*0.02,
          ),
          Container(
            height: y*0.052,
            width: MediaQuery.of(context).size.width / 1.35,
            child: Center(
                child:  Text('Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: y*0.028,
                        fontWeight: FontWeight.bold))),
          ),
          SizedBox(
            height: y*0.02,
          ),
          Container(
            height: y*0.06,
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
                hintText: 'Enter Your ID',
                fillColor: Colors.grey[200],
                filled: true,
              ),
              controller: idController,
              keyboardType: TextInputType.number,
              validator: (val) => val.isEmpty ? 'ID can\'t be empty' : null,
            ),
          ),
          SizedBox(
            height: y*0.04,
          ),
          Container(
            height: y*0.06,
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
                
                hintText: 'Enter Your Password',
                fillColor: Colors.grey[200],
                filled: true,
              ),
              controller: passwordController,
              validator: (val) => val.length <  6 ? 'Enter a valid minimum 6 chars long password' : null,
            ),
          ),
          SizedBox(
            height: y*0.06,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            onPressed: () {
               canLogin ? Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())) : key.currentState.showSnackBar(SnackBar(content: Text('Something went wrong !')));
            },
            minWidth: MediaQuery.of(context).size.width / 1.35,
            color: brownColor,
            child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 18.0, letterSpacing: 1.2)),
            height: y*0.06,
          ),
          SizedBox(
            height: y*0.06,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text('Don\'t have an account ? ', style: TextStyle(color: Colors.white),),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen())) ;
                   
                },
                child: Text('Register', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              )
            ],
          )
        ],
      ),
    );
  }



  getVerified() async {
    
     Firestore.instance.collection('users').getDocuments().then((doc) {
       doc.documents.forEach((element) {
         print(element.data['phone'] + "****************" + idController.text);
       print(idController.text.compareTo(element.data['phone']));
        if(idController.text.compareTo(element.data['phone']) == 0){
          
          
          
          if(passwordController.text.compareTo(element.data['password']) == 0){
             Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
           }else{
            key.currentState.showSnackBar(SnackBar(content: Text('Invalid password'),));
           }
          
         }
       });
     });

    var user = await FirebaseAuth.instance.currentUser();
    await Firestore.instance.collection('users').document(user.uid).get().then((value) {
        print(value.data['password'] + " : - Password of the user");
        if(passwordController.text == value.data['password']){
          setState(() {
            canLogin = true;
          });
        }
    });

    
  }
}
