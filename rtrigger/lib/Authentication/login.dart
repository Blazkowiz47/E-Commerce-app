import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rtrigger/Authentication/signup.dart';
import '../main.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../address.dart';
import '../main_tabs.dart';
import 'login_signup.dart';

bool passnew = false;
bool valid;

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  AuthResult authresult;

  final formkey = GlobalKey<FormState>();
  bool islogin = true;
  String email = "";
  String password = "";

  final auth = FirebaseAuth.instance;
  var loading = false;

  void submitting(String email, String username, String password, String phone,
      BuildContext ctx) async {
    AuthResult authresult;
    try {
      setState(() {
        loading = true;
      });
      authresult = await auth.createUserWithEmailAndPassword(
          email: phone + "@test.com", password: password);
      await Firestore.instance
          .collection('users_main')
          .document(authresult.user.uid)
          .setData({
        'username': username,
        'email': email,
        'phone': phone,
        'password': password,
      });
      user = username;
      phoning = phone;
      mail = email;
      currentSelectedIndex = 6;

      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Homepage()));
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

  void submit(
      String phone, String password, bool login, BuildContext ctx) async {
    try {
      setState(() {
        loading = true;
      });

      authresult = await auth.signInWithEmailAndPassword(
          email: phone + "@test.com", password: password);
      final media =
          await Firestore.instance.collection('users_main').getDocuments();
      final orders =
          await Firestore.instance.collection('orders_cod').getDocuments();

      int i;
      for (i = 0; i < media.documents.length; i++)
        if (media.documents[i]['phone'] == email) {
          user = media.documents[i]['username'];
          phoning = media.documents[i]['phone'];
          mail = media.documents[i]['email'];

          break;
        }
      for (int j = 0; j < orders.documents.length; j++) {
        if (orders.documents[j]['mobile phone number'] == phoning ||
            orders.documents[j]['alternate number'] == phoning) {
          Meals_list_ordered.add({
            'id': 'Order ${orders.documents.length + 1}',
            'loc': 'images/pp.png',
            'status': 'ordered',
            'amount': orders.documents[j]['total'],
            'mode': 7,
          });
        }
      }
      currentSelectedIndex = 6;
      print(user);
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Homepage()));
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
              style: TextStyle(color: Colors.black, fontSize: 10),
            ),
            color: Colors.white,
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

  void trysubmit() async {
    valid = formkey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (valid) {
      formkey.currentState.save();
      submit(email.trim(), password.trim(), islogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'images/rtigger2.png',
            ),
            fit: BoxFit.cover,
          )),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 10.0),
                  child: Image.asset(
                    'images/logo.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.width / 2.5,
                  ),
                ),
                Container(
                    child: Text('Login',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
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
                      key: ValueKey('email'),

                      style: TextStyle(
                          color: Color.fromRGBO(00, 44, 64, 1),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,

                      decoration: InputDecoration(
                        hintText: '  Enter Mobile Number',
                        hintStyle: TextStyle(
                          fontSize: 20.0,
                          color: Color.fromRGBO(00, 44, 64, 1),
                        ),
                        border: InputBorder.none,
                      ),

                      onChanged: (val) {
                        email = val.trim();
                      },
                      onSaved: (value) {
                        email = value.trim();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                if (!passnew)
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
                          hintText: '  Enter Your Password',
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromRGBO(00, 44, 64, 1),
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                        onSaved: (value) {
                          password = value;
                        },
                      ),
                    ),
                  ),
                if (!passnew)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: width * 0.4,
                      ),
                      FlatButton(
                          onPressed: () async {
                            final media = await Firestore.instance
                                .collection('users_main')
                                .getDocuments();
                            int i;
                            for (i = 0; i < media.documents.length; i++)
                              if (media.documents[i]['phone'] == email) {
                                pass = media.documents[i]['password'];
                                mobile = media.documents[i]['phone'];
                                ema = media.documents[i]['email'];
                                phoning = media.documents[i]['phone'];
                                mail = ema;
                                name = media.documents[i]['username'];
                                user = name;

                                id = media.documents[i].documentID;
                                print(id);
                                break;
                              }
                            print(user);
                            if (i == media.documents.length)
                              Alert(
                                context: context,
                                type: AlertType.error,
                                title: "Error",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "Mobile Number Does Not Exist",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                    color: Colors.white,
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ).show();
                            else {
                              authresult =
                                  await auth.signInWithEmailAndPassword(
                                      email: mobile + "@test.com",
                                      password: pass);

                              Firestore.instance
                                  .collection('users')
                                  .document(id)
                                  .delete();
                              currentSelectedIndex = 6;

                              authresult.user.delete();
                              setState(() {
                                passnew = true;
                              });
                            }
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color.fromRGBO(173, 173, 117, 1),
                            ),
                            textAlign: TextAlign.right,
                          )),
                    ],
                  ),
                if (passnew)
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
                          hintText: '  Enter Your New Password',
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromRGBO(00, 44, 64, 1),
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                        onSaved: (value) {
                          password = value;
                        },
                      ),
                    ),
                  ),
                Container(
                  width: 0.8 * MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.lime[800],
                    color: Color.fromRGBO(173, 173, 117, 1),
                  ),
                  child: FlatButton(
                    color: Color.fromRGBO(173, 173, 117, 1),
                    onPressed: () {
                      passnew
                          ? submitting(ema, name, password, mobile, context)
                          : trysubmit();

                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Homepage()));
                    },
                    child: loading
                        ? CircularProgressIndicator()
                        : Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't Have An Account?",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => SignUp()));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Color.fromRGBO(173, 173, 117, 1),
                            fontWeight: FontWeight.bold),
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
}
