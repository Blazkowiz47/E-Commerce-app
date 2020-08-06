import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse_home.dart';
import 'package:rtrigger/Utils/search_bar.dart';
import '../cart.dart';
import '../main_tabs.dart';
import 'beforefooditems.dart';

var Meals_list = [
  {
    'id': 'Dish Name',
    'loc': 'images/rtigger4.png',
    'price': 100.0,
    'fav': true
  },
  {
    'id': 'Dish Name',
    'loc': 'images/rtigger4.png',
    'price': 100.0,
    'fav': true
  },
  {'id': 'Dish Name', 'loc': 'images/ute.png', 'price': 100.0, 'fav': true},
  {
    'id': 'Dish Name',
    'loc': 'images/rtigger4.png',
    'price': 100.0,
    'fav': true
  },
  {
    'id': 'Dish Name',
    'loc': 'images/rtigger4.png',
    'price': 100.0,
    'fav': true
  },
];

class Food2 extends StatefulWidget {
  Food2(this.collection);

  String collection;

  @override
  _Food2State createState() => _Food2State();
}

class _Food2State extends State<Food2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        title: Row(children: [
          Text(
            "Hotel Name",
            style: TextStyle(color: Color.fromRGBO(00, 44, 64, 1.0),fontSize: MediaQuery.of(context).size.height*0.023),
          ),
        ]),
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
      body: StreamBuilder(
          stream: Firestore.instance
              .collection("food")
              .document("foods")
              .collection(widget.collection)
              .snapshots(),
          builder: (context, snapshots) {
            if (!snapshots.hasData) return const Text('loading....');
            return Stack(
              children: <Widget>[
                ListView.builder(
                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.vertical,
                  itemExtent: 200,
                  itemCount: snapshots.data.documents.length,
                  itemBuilder: (contextd, index) {
                    DocumentSnapshot df = snapshots.data.documents[index];
                    return StreamBuilder(
                        stream: Firestore.instance
                            .collection("user-activity")
                            .document(phoneNumber)
                            .collection('search')
                            .snapshots(),
                        builder: (context, snapshot1) {
                          if (snapshot1.data == null) {
                            return CircularProgressIndicator();
                          } else {
                            DocumentSnapshot ds2 = snapshot1.data.documents[0];
                            if (ds2['search'] == null) {
                              return Food2Item(df['id'], "images/rtigger4.png",
                                  df['rate'], false, df['detail']);
                            } else {
                              if ((df['id'].toString().toLowerCase().contains(
                                  ds2['search'].toString().toLowerCase()))) {
                                return Food2Item(
                                    df['id'],
                                    "images/rtigger4.png",
                                    df['rate'],
                                    false,
                                    df['detail']);
                              } else {
                                return Container(
                                  height: 0,
                                  width: 0,
                                );
                              }
                            }
                          }
                        });
                  },
                ),
                CollapsingNavigationDrawer(false),
              ],
            );
          }),

      /*Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.all(10),
            children:
                Meals_list.map((tx) => Food2Item(tx['id'], tx['loc'],tx['price'],tx['fav'])).toList(),
          ),
          CollapsingNavigationDrawer(false),
        ],
      ),*/
    );
  }
}
