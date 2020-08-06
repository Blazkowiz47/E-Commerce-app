import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

// import 'file:///C:/Users/Ujjwa/AndroidStudioProjects/rtrigger/lib/Authentication/login_signup.dart';

import 'Authentication/login_signup.dart';

import './addressdecoration.dart';
import './main_tabs.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String s = '';
  var textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Center(
              child: Image.asset(
                'images/background1.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 10,
                ),

                //                 Positioned(
                ///            left: MediaQuery.of(context).size.width / 2 -
                //                MediaQuery.of(context).size.width / 4,
                //            top: MediaQuery.of(context).size.height / 10,
                //           child:
                Image.asset(
                  'images/logo.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                ),
                //         ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      child: Text('Location',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    //obscureText: true,
                    style: TextStyle(color: Colors.black87),
                    controller: textController,
                    textAlign: TextAlign.center,
                    onTap: () async {
                      try {
                        Position position = await Geolocator()
                            .getCurrentPosition(
                                desiredAccuracy:
                                    LocationAccuracy.bestForNavigation);
                        final coordinates = new Coordinates(
                            position.latitude, position.longitude);
                        var addresses = await Geocoder.local
                            .findAddressesFromCoordinates(coordinates);
                        var first = addresses.first;
                        print("${first.featureName} : ${first.addressLine}");
                        setState(() {
                          s = first.addressLine;
                          textController.text = s;
                        });
                      } catch (e) {
                        print('error');
                        print(e);
                      }
                    },
                    onChanged: (value) {
                      value = 'hello plzz';
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'click here to locate address automatically',
                      fillColor: Colors.grey,
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.room),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("or",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            )),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 90,
                    decoration: new BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextField(
                        onChanged: (val){
                          textController.text=val;
                        },
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                          
                            hintText: 'Type your address here....',
                            hintStyle: TextStyle(color: Colors.black87)),
                      ),
                    ),
                  ),
                ),
               

                Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width -MediaQuery.of(context).size.width/10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                 color:Color.fromRGBO(173, 173, 117, 1),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        if(textController.text.isNotEmpty)
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => Homepage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
