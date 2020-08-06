import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rtrigger/Authentication/login.dart';
import 'Liquor/liquordetails.dart';
import 'Authentication/login_signup.dart';
import 'favourite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

double tot = 0.0;
int currentSelectedIndex = 6;
String id, ema, mobile, pass, name;
int gender;
var dist=false;
var saltot = 0.0;
var Cart_list = [];
var Appointment = [];
var Meals_list_ordered = [];
var Saloon_item = [];
var filter = [];
var grandTotal = 0.0;

var food_list = [
  {'id': 'Ice Cream', 'loc': 'images/i1.png', 'check': true},
  {'id': 'Tea and Coffee', 'loc': 'images/i2.png', 'check': true},
  {'id': 'Pizza', 'loc': 'images/i3.png', 'check': true},
  {'id': 'Fish and Chicken', 'loc': 'images/i4.png', 'check': true},
  {'id': 'Meal', 'loc': 'images/i5.png', 'check': true},
  {'id': 'Breakfast', 'loc': 'images/ui.png', 'check': true},
  {'id': 'Shakes and Juices', 'loc': 'images/oo.png', 'check': true},
  {'id': 'Soft Drinks', 'loc': 'images/ii.png', 'check': true},
  {'id': 'Burgers and Sandwiches', 'loc': 'images/oh.png', 'check': true},
  {'id': 'Sweets', 'loc': 'images/uil.png', 'check': true},
  {'id': 'Dinner', 'loc': 'images/rtigger6.png', 'check': true},
  {'id': 'Cakes and Pastry', 'loc': 'images/ih.png', 'check': true},
  {'id': 'Cookies', 'loc': 'images/u,n.png', 'check': true},
  {'id': 'Snacks', 'loc': 'images/ml.png', 'check': true},
  {'id': 'Fruits and Vegetables', 'loc': 'images/oo.png', 'check': true},
];

void getinfo() async {}

var liquor_list = [
  {'id': 'Wine', 'loc': 'images/liquor1.png', 'check': true,'page': LiquorDetail()},
  {'id': 'Scotch', 'loc': 'images/liquor2.png', 'check': true,'page': LiquorDetail()},
  {'id': 'Rum', 'loc': 'images/liquor3.png', 'check': true,'page': LiquorDetail()},
  {'id': 'Beer', 'loc': 'images/liquor4.png', 'check': true,'page': LiquorDetail()},
  {'id': 'Whiskey', 'loc': 'images/liquor5.png', 'check': true,'page': LiquorDetail()},
];

var medicine_list = [
  {'id': 'Paracetamol', 'check': true},
  {'id': 'Ambien', 'check': true},
  {'id': 'Panadol', 'check': true},
  {'id': 'Citricin', 'check': true},
];

String username;
var error=false;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Widget> getinfo() async {
    final data = await FirebaseAuth.instance.currentUser();
    print(data.phoneNumber);
    final info =
        await Firestore.instance.collection('users').document(data.uid).get();
        if(info==null)
        {
          
         FirebaseAuth.instance.signOut();
         return Favs();
        }
    user = info['username'];
    mail = info['email'];
    phoning = info['phone'];
    final orders = await Firestore.instance.collection('orders_cod').getDocuments();
    int count=1;
    for (int j = 0; j < orders.documents.length; j++) {
      if (orders.documents[j]['mobile phone number'] == phoning) {
        Meals_list_ordered.add({
          'id': 'Order $count',
          'loc': 'images/pp.png',
          'status': 'ordered',
          'amount': orders.documents[j]['total'],
          'mode': 7,
        });
        count+=1;
      }
    }
    return Favs();
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) => Favs()));
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.lightBlue,
            canvasColor: Colors.white,
            accentColor: Colors.red),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              if (snapshot.hasData) {
              //  getinfo();
                currentSelectedIndex = 6 ;
                return FutureBuilder(
                  future: getinfo(),
                  builder: (ctx, snap) {
                    if (snap.connectionState == ConnectionState.waiting)
                      return Scaffold(
                          body: Center(child: CircularProgressIndicator(backgroundColor: Colors.white,)));
                    else
                      return LogIn();
                  },
                );
              } else
                return LogIn();
            }));
  }
}
