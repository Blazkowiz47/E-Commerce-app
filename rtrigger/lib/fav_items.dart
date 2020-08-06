import 'package:flutter/material.dart';
import 'package:rtrigger/main_tabs.dart';
import 'package:share/share.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'main.dart';

class FavItem extends StatefulWidget {
  final String title;
  final String loc;
  final String rating;
  bool fav;
  final Function onpress;

  IconButton icon;

  FavItem({this.title, this.loc, this.rating, this.fav, this.onpress});

  @override
  _FavItemState createState() => _FavItemState();
}

class _FavItemState extends State<FavItem> {
  //Function onpress;
  //final DB  = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    IconButton icon;
    void share() {
      final RenderBox box = context.findRenderObject();
      Share.share(
        'check out the product',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
      );
    }
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 60,right: 20),
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 15,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(
                    widget.loc,
                    fit: BoxFit.fitHeight,
                    width: height<550 ? width / 5: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Column(children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          widget.rating,
                          style: TextStyle(fontSize: 21),
                        ),
                        Text("\n")
                      ],
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("30-40 mins"),
                    Text("\n"),
                    Text(
                      "Rate",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: height<550 ? width /2 : MediaQuery.of(context).size.width / 2.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () => share(),
                            iconSize: height*0.03,
                          ),
                          IconButton(
                            onPressed: widget.onpress,
                            icon: Icon(widget.fav
                                ? Icons.favorite
                                : Icons.favorite_border),
                            color: Colors.red,
                            iconSize: height*0.04,
                          ),
                          IconButton(
                              iconSize: height*0.03,
                              onPressed: () async {
                                await Firestore.instance
                                    .collection("user-activity")
                                    .document(phoneNumber)
                                    .collection("cart")
                                    .document(Timestamp.now().toString())
                                    .setData({
                                  'id': widget.title,
                                  'imgloc': widget.loc,
                                  'rate': widget.rating,
                                });
                                print('added to cart');
                                 Cart_list.add({
                                  'id': widget.title,
                                  'loc': widget.loc,
                                  'sum': 1234,
                                  'count': 1.0
                                });
                              },
                              icon: Icon(Icons.add_shopping_cart))
                        ],
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
