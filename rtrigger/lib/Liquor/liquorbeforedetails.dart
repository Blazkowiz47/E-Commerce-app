import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse_home.dart';
import 'package:rtrigger/Utils/search_bar.dart';
import '../cart.dart';
import '../main_tabs.dart';
import 'liquor_item.dart';


class Drink2 extends StatefulWidget {
  Drink2(this.collection);

  String collection;

  @override
  _Drink2State createState() => _Drink2State();
}

class _Drink2State extends State<Drink2> {
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
              .document("liquor")
              .collection(widget.collection)
              .snapshots(),

          // ignore: missing_return
          builder: (contextd, snapshots) {
            if (!snapshots.hasData) return Center(child: CircularProgressIndicator(),);
            return Stack(
              children: <Widget>[
                ListView.builder(
                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.vertical,
                  itemExtent: 200,
                  itemCount: snapshots.data.documents.length,
                  itemBuilder: (contextd, index) {
                    DocumentSnapshot df = snapshots.data.documents[index];
                    print(df['id']);

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
                              return Drink2Item(df['id'], "images/rtigger4.png",
                                  df['rate'], false, df['detail']);
                            } else {
                              if ((df['id'].toString().toLowerCase().contains(
                                  ds2['search'].toString().toLowerCase()))) {
                                return Drink2Item(
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
