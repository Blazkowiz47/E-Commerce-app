import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse_home.dart';
import 'package:rtrigger/Utils/search_bar.dart';
import '../cart.dart';
import '../main_tabs.dart';
import 'saloon_item.dart';


var Meals_list = [
  {'id': 'Male', 'loc': 'images/male.jpg'},
  {'id': 'Female', 'loc': 'images/female.jpg'},
  {'id': 'Unisex', 'loc': 'images/unisex.png'},
  {'id': 'Spa', 'loc': 'images/spa.jpg'},
];

class Saloon extends StatefulWidget {
  @override
  _SaloonState createState() => _SaloonState();
}

class _SaloonState extends State<Saloon> {
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
        actions: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(height: 10),
                SearchBar(),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Cart()));
            },
            color: Colors.black,
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 70,
            top: 50,
            child: Text(
              "Saloon & Beauty Parlor",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(00, 44, 64, 1),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: GridView(
                  padding: EdgeInsets.only(left: 80, right: 10),
                  children: Meals_list.map((tx) => StreamBuilder(
                      stream: Firestore.instance
                          .collection("user-activity")
                          .document(phoneNumber)
                          .collection('search')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return CircularProgressIndicator();
                        } else {
                          DocumentSnapshot ds2 = snapshot.data.documents[0];
                          if (ds2['search'] == null) {
                            return SalItem(tx['id'], tx['loc']);
                          } else {
                            if (tx['id'].toString().toLowerCase().contains(
                                ds2['search'].toString().toLowerCase()))
                              return SalItem(tx['id'], tx['loc']);
                            else
                              return Container();
                          }
                        }
                      })).toList(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20)),
            ),
          ),
          Positioned(top: 0, child: CollapsingNavigationDrawer(false)),
        ],
      ),
    );
  }
}
