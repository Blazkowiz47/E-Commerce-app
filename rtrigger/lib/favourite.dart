import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './fav_items.dart';
import './cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Utils/custom_drawer_collapse.dart';
import 'Utils/custom_drawer_collapse_home.dart';
import 'Utils/search_bar.dart';
import 'main_tabs.dart';

const bool debugEnableDeviceSimulator = true;

var Meals_list = [
  {'id': 'Drink Name', 'loc': 'images/ii.png', 'price': 100.0, 'fav': true},
  {'id': 'Sweet Name', 'loc': 'images/uil.png', 'price': 1344.0, 'fav': true},
  {'id': 'Dish Name', 'loc': 'images/ute.png', 'price': 50.0, 'fav': true},
  {'id': 'Tablet Name', 'loc': 'images/k.png', 'price': 13410.0, 'fav': true},
  {'id': 'Medicine', 'loc': 'images/j.png', 'price': 13450.0, 'fav': true},
];

String value;

class Favs extends StatefulWidget {
  @override
  _FavsState createState() => _FavsState();
}

class _FavsState extends State<Favs> {
  //final String title;

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              document['id'],
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffdd),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              document['imgloc'].toString(),

              style: Theme.of(context).textTheme.headline4,

            ),
          ),
          Container(child: Text(document['price'].toString()))
        ],
      ),
      onTap: () {
//print("should increase votes here");
        document.reference.updateData({'votes': document['votes'] + 1});
      },
    );
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
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Text(
            "Favorite",
            style: TextStyle(color: Color.fromRGBO(00, 44, 64, 1.0)),
          ),
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
                .collection("user-activity")
                .document(phoneNumber)
                .collection("favourites")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('loading....');
              return Stack(
                children: <Widget>[
                  ListView.builder(
                      //padding: EdgeInsets.only(bottom: 0,top),
                      scrollDirection: Axis.vertical,
                      itemExtent: 200,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                          DocumentSnapshot ds = snapshot.data.documents[index];
                          return StreamBuilder(
                            stream: Firestore.instance
                                .collection("user-activity")
                                .document(phoneNumber)
                                .collection('search')
                                .snapshots(),
                            builder: (context, snapshot1) {
                              if(snapshot1.data == null){
                                return Container(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator(
                                  ),
                                );
                              }else {
                                DocumentSnapshot ds2 = snapshot1.data
                                    .documents[0];
                                if (ds2['search'] == null) {
                                  return FavItem(
                                    title: ds['id'],
                                    loc: 'images/ii.png',
                                    rating: ds['rating'],
                                    onpress: () {
                                      setState(() async {
                                        Firestore.instance.runTransaction(
                                                (
                                                Transaction myTransaction) async {
                                              await myTransaction.delete(
                                                  ds.reference);
                                            });
                                      });
                                    },
                                    fav: true,
                                  );
                                } else {
                                  if ((ds['id'].toString()
                                      .toLowerCase()
                                      .contains(
                                      ds2['search']
                                          .toString()
                                          .toLowerCase()))) {
                                    return FavItem(
                                      title: ds['id'],
                                      loc: 'images/ii.png',
                                      rating: ds['rating'],
                                      onpress: () {
                                        setState(() async {
                                          Firestore.instance.runTransaction(
                                                  (
                                                  Transaction myTransaction) async {
                                                await myTransaction
                                                    .delete(ds.reference);
                                              });
                                        });
                                      },
                                      fav: true,
                                    );
                                  } else {
                                    return Container(
                                      height: 0,
                                      width: 0,
                                    );
                                  }
                                }
                              }
                            },
                          );
                        /*return FavItem(ds['id'], 'images/ii.png', int.tryParse(ds['price']), ds['fav'],
                   () {
                 setState(() async {
                   await Firestore.instance.collection("favourite")
                       .document(snapshot.data.documents.documentID)
                       .delete();
                   // widget.fav = !widget.fav;
                   /* Firestore.instance.runTransaction((Transaction myTransaction) async {
                                  await myTransaction.delete(DB.reference);
                                });*/
                 });
               },
               );*/
                      }
                      // _buildListItem(context, snapshot.data.documents[index]),
                      /*children:



               Meals_list.map((tx) =>
                  FavItem(tx['id'], tx['loc'], tx['price'], tx['fav']))
                  .toList(),*/
                      ),
                  CollapsingNavigationDrawer(false),
                ],
              );
            }));
  }
}
