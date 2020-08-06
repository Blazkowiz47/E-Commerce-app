import 'package:flutter/material.dart';
import 'Utils/custom_drawer_collapse.dart';
import 'Utils/custom_drawer_collapse_home.dart';
import 'notification_items.dart';


var Meals_list = [
  {'id': 'Drink Name', 'loc': 'images/ii.png', 'price': 100.0, 'fav': false},
  {'id': 'Sweet Name', 'loc': 'images/uil.png', 'price': 1344.0, 'fav': false},
  {'id': 'Dish Name', 'loc': 'images/ute.png', 'price': 50.0, 'fav': false},
  {'id': 'Electronics Name', 'loc': 'images/k.png', 'price': 13410.0, 'fav': false},
  {'id': 'Medicine', 'loc': 'images/j.png', 'price': 13450.0, 'fav': false},
];

class Nots extends StatefulWidget {
  @override
  _NotsState createState() => _NotsState();
}

class _NotsState extends State<Nots> {
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
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          "Notifications",
          style: TextStyle(color: Color.fromRGBO(00, 44, 64, 1.0)),
        ),
       
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.all(10),
            children: Meals_list.map((tx) =>
                NotItem(tx['id'], tx['loc'], tx['price'], tx['fav'])).toList(),
          ),
          CollapsingNavigationDrawer(false),
        ],
      ),
    );
  }
}
