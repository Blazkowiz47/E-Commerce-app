import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import 'Utils/custom_drawer_collapse.dart';
import 'Utils/custom_drawer_collapse_home.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  var subject = "";
  var body = "";
  var name = "";
  var mail = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    final Email email = Email(
      body: "Name: " + name + "\n" + "Email: " + mail + "\n\n" + body,
      subject: subject,
      recipients: ['cogentwebservices@gmail.com'],
      attachmentPaths: null,
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 8.397,
                height: double.infinity,
                child: Icon(
                  Icons.dehaze,
                  color: Colors.white,
                ),
                color: Color.fromRGBO(00, 44, 64, 1),
              ),
              Container(
                color: Colors.white,
              )
            ],
          ),
          title: Text(
            "Contact Us",
            style: TextStyle(
              color: Color.fromRGBO(00, 44, 64, 1),
            ),
          ),
          backgroundColor: Colors.white),
      body: Stack(
        children: <Widget>[
          Positioned(top: 0, child: CollapsingNavigationDrawer(false)),
          Positioned(
            left: 60,
            child: Container(
              height: 450,
              width: MediaQuery.of(context).size.width - 60,
              child: ListView(children: <Widget>[
                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: Container(
                    decoration: new BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextFormField(
                        
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Full Name',
                            labelStyle: TextStyle(color: Colors.black)),
                        onChanged: (value) {
                          name = value;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: Container(
                    decoration: new BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextFormField(
                        onChanged: (value) {
                          mail = value;
                        },
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Email Address',
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: Container(
                    decoration: new BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Contact Reason',
                            labelStyle: TextStyle(color: Colors.black)),
                        onChanged: (value) {
                          subject = value;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                  child: Container(
                    decoration: new BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Description of Query',
                              labelStyle: TextStyle(color: Colors.black)),
                          onChanged: (value) {
                            body = value;
                          },
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  child: RaisedButton(
                    onPressed: () {
                      send();
                    },
                    child: Container(
                      height: 50,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 10,
                          ),
                          Text("Send",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Color.fromRGBO(00, 44, 64, 1.0),
                        )),
                    color: Color.fromRGBO(00, 44, 64, 1.0),
                  ),
                ),
              ]),
            ),
          ),
          Positioned(
              top: 470,
              left: 60,
              child: Container(
                width: MediaQuery.of(context).size.width - 60,
                child: Text(
                  "or",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )),
          Positioned(
            top: 530,
            left: 55,
            child: Container(
              width: MediaQuery.of(context).size.width ,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: IconButton(
                        icon: Icon(
                          MdiIcons.clipboardAccount,
                          color: Colors.green,
                          size: 40,
                        ),
                        onPressed: () {
                          FlutterOpenWhatsapp.sendSingleMessage(
                              "917080855524", "Send Query");
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.black,
                          size: 40,
                        ),
                        onPressed: () {
                          UrlLauncher.launch('tel:+917080855524');
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: IconButton(
                        icon: Icon(
                          MdiIcons.gmail,
                          color: Colors.red,
                          size: 40,
                        ),
                        onPressed: () {
                          UrlLauncher.launch('mailto:cogentwebservices@gmail.com');
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
