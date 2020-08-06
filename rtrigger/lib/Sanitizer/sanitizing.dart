import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse_home.dart';
import 'package:rtrigger/Utils/search_bar.dart';
import '../cart.dart';
import 'sanitize_item.dart';

var Meals_list = [
  {'id': 'Sanitize', 'loc': 'images/j.png'},
  {'id': 'Mosquito', 'loc': 'images/mosquito.jpg'},
  {'id': 'Cockroach', 'loc': 'images/cockroch.jpg'},
];

class SanitizingPage extends StatefulWidget {
  @override
  _SanitizingPageState createState() => _SanitizingPageState();
}

class _SanitizingPageState extends State<SanitizingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
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
            top: 30,
            child: Text(
              "Sanitizer and Spray",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: Color.fromRGBO(00, 44, 64, 1),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.01,
            top: MediaQuery.of(context).size.height * 0.12,
            child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: GridView(
                  padding: EdgeInsets.only(left: 80, right: 10),
                  children:
                      Meals_list.map((tx) => StreamBuilder(
                          stream: Firestore.instance
                              .collection("user-activity")
                              .document('9108650970')
                              .collection('search')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return CircularProgressIndicator();
                            } else {
                              DocumentSnapshot ds2 = snapshot.data.documents[0];
                              if (ds2['search'] == null) {
                                return SanitizeItem(tx['id'], tx['loc']);
                              } else {
                                if (tx['id'].toString().toLowerCase().contains(
                                    ds2['search'].toString().toLowerCase()))
                                  return SanitizeItem(tx['id'], tx['loc']);
                                else
                                  return Container();
                              }
                            }
                          }))
                          .toList(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20)),
            ),
          ),
          Positioned(
            top: 580,
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: GridView(
                  padding: EdgeInsets.only(left: 80, right: 10),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                      childAspectRatio: 1.9,
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
