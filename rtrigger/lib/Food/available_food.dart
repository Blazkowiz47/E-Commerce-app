import 'package:flutter/material.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse_home.dart';
import 'food_item.dart';

var total = 0;
double count = 0;
var  food_list = [
  {'id': 'Sam\'s Place', 'loc': 'images/saloon1.jpg', 'dist': 2.0, 'desc': '7th street, saribujrang. amalsad, Navasari'},
  {'id': 'Dex\'s Place', 'loc': 'images/saloon2.jpg', 'dist': 5.0, 'desc': '7th street, saribujrang. amalsad, Navasari'},
  {'id': 'Lee\'s Place', 'loc': 'images/saloon3.jpg', 'dist': 10.0, 'desc': '7th street, saribujrang. amalsad, Navasari'},
  {'id': 'Dee\'s Place', 'loc': 'images/saloon4.jpg', 'dist': 20.0, 'desc': '7th street, saribujrang. amalsad, Navasari'},
  {'id': 'Dee\'s Place', 'loc': 'images/saloon4.jpg', 'dist': 20.0, 'desc': '7th street, saribujrang. amalsad, Navasari'},
  {'id': 'Dee\'s Place', 'loc': 'images/saloon4.jpg', 'dist': 20.0, 'desc': '7th street, saribujrang. amalsad, Navasari'},
  {'id': 'Dee\'s Place', 'loc': 'images/saloon4.jpg', 'dist': 20.0, 'desc': '7th street, saribujrang. amalsad, Navasari'},

];

class FoodOption extends StatefulWidget {
  @override
  _FoodOptionState createState() => _FoodOptionState();
}

class _FoodOptionState extends State<FoodOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {},
              child: Text(
                "Clear Cart",
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(left: 60, top: 10, bottom: 10, right: 10),
            children: food_list.map((tx) =>
                FoodItem(tx['id'], tx['loc'], tx['dist'], tx['desc'])).toList(),
          ),
          CollapsingNavigationDrawer(false),
        ],
      ),
    );
  }
}
