import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse_home.dart';
import 'package:rtrigger/Utils/search_bar.dart';
import '../cart.dart';
import '../main.dart';
import 'saloonItem.dart';

double count = 0;
var Saloon_list = [
  {
    'id': 'Sam\'s Place',
    'loc': 'images/saloon1.jpg',
    'dist': 2.0,
    'desc': '7th street, saribujrang. amalsad, Navasari'
  },
  {
    'id': 'Dex\'s Place',
    'loc': 'images/saloon2.jpg',
    'dist': 5.0,
    'desc': '7th street, saribujrang. amalsad, Navasari'
  },
  {
    'id': 'Lee\'s Place',
    'loc': 'images/saloon3.jpg',
    'dist': 10.0,
    'desc': '7th street, saribujrang. amalsad, Navasari'
  },
  {
    'id': 'Dee\'s Place',
    'loc': 'images/saloon4.jpg',
    'dist': 20.0,
    'desc': '7th street, saribujrang. amalsad, Navasari'
  },
];

class spa extends StatefulWidget {
  @override
  _SalState createState() => _SalState();
}

class _SalState extends State<spa> {
  bool delete = false;
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
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
          '$gender',
          style:
              TextStyle(color: Color.fromRGBO(00, 44, 64, 1.0), fontSize: 15),
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
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: StreamBuilder(
                stream: Firestore.instance
                    .collection('Saloon')
                    .document('spa')
                    .collection("spa")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());

                  return Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(
                      left: x * 0.045,
                    ),
                    height: MediaQuery.of(context).size.height * 0.89,
                    child: ListView.builder(
                        padding: EdgeInsets.only(
                            left: x * 0.12,
                            top: y * 0.1,
                            bottom: y * 0.1,
                            right: x * 0.025),
                        //padding: EdgeInsets.only(bottom: 0,top),
                        scrollDirection: Axis.vertical,
                        itemExtent: 200,
                        shrinkWrap: true,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot ds = snapshot.data.documents[index];
                          print(ds['id']);
                          print(ds['desc']);
                          print(ds['dist']);
                          print(ds["imgloc"]);

                          deleteCart() async {
                            await Firestore.instance.runTransaction(
                                (Transaction myTransaction) async {
                              await myTransaction.delete(ds.reference);
                              delete = false;
                            });
                          }

                          if (delete) {
                            deleteCart();
                            return Container();
                          } else {
                            return SaloonItem(
                                ds["id"], ds["imgloc"], ds["dist"], ds["desc"], ds["des"]);
                          }
                        }),
                  );
                }),
          ),
          CollapsingNavigationDrawer(false),
        ],
      ),
    );

    /*Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(left: 60, top: 10, bottom: 10, right: 10),
            children: Saloon_list.map((tx) =>
                    SaloonItem(tx['id'], tx['loc'], tx['dist'], tx['desc']))
                .toList(),
          ),*/
  }
}
