import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rtrigger/cart.dart';
import 'package:rtrigger/main.dart';
import 'package:rtrigger/main_tabs.dart';

import 'Food/available_food.dart';

class cartitem extends StatefulWidget {
  cartitem({this.img, this.rate, this.id, this.onpress ,this.count, this.index , this.phoneNumber });
  String img;
  double rate;
  String id;
  int count;
  int index;
  String phoneNumber;
  Function onpress;
  @override
  _cart createState() => new _cart();
}

class _cart extends State<cartitem> {
  int _count;
  String phoneNumber;
  int documentNumber;
  void _increase() async {


  }
  void _decrease() async {
  }

  @override
  Widget build(BuildContext context) {
    documentNumber = widget.index;
    _count = widget.count;
    phoneNumber = widget.phoneNumber;
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          //for (int i = 0; i < Cart_list.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0, left: 60, right: 10),
            child: Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image.asset(
                      widget.img,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 7,
                    ),
                    Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.id,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '' + '${widget.rate}',
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 29,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              onPressed: () async {
                                if(_count == 1){
                                  grandTotal = grandTotal - double.parse(Cart_list[widget.index]["rate"]);
                                  noItem = true;
                                  setState((){
                                    _count = _count - 1;
                                  });
                                  Cart_list.removeAt(documentNumber);
                                  await Firestore.instance
                                      .collection("user-activity")
                                      .document(phoneNumber)
                                      .collection("cart")
                                      .document("${documentNumber}")
                                      .delete();
                                  await Firestore.instance
                                      .collection("user-activity")
                                      .document(phoneNumber)
                                      .collection("total")
                                      .document("total")
                                      .updateData({
                                    'total' : grandTotal - double.parse(Cart_list[widget.index]["rate"]),
                                  });
                                  Cart_list.removeAt(widget.index);
                                }else{
                                  grandTotal = grandTotal - double.parse(Cart_list[widget.index]["rate"]);
                                  print("Executing Increment");
                                  Cart_list[widget.index]['count'] = Cart_list[widget.index]['count'] - 1;
                                  print(Cart_list);
                                  setState((){
                                    _count = _count - 1;
                                  });
                                  print("Executing Increment");
                                  await Firestore.instance
                                      .collection("user-activity")
                                      .document(phoneNumber)
                                      .collection("cart")
                                      .document("${documentNumber}")
                                      .updateData({
                                    'count' : Cart_list[widget.index]['count'],
                                  });
                                  print('added to cart');
                                  await Firestore.instance
                                      .collection("user-activity")
                                      .document(phoneNumber)
                                      .collection("total")
                                      .document("total")
                                      .updateData({
                                    'total' : grandTotal - double.parse(Cart_list[widget.index]["rate"]),
                                  });
                                  print("done Increment");
                                }
                              },
                              icon: Icon(Icons.remove),
                            ),
                            Text("${_count}"),
                            IconButton(
                              onPressed: () async {
                                    grandTotal = grandTotal + double.parse(Cart_list[widget.index]["rate"]);
                                    print("Executing Increment");
                                    Cart_list[widget.index]['count'] = Cart_list[widget.index]['count'] + 1;
                                    print(Cart_list);
                                    setState((){
                                      _count = _count + 1;
                                    });
                                    print("Executing Increment");
                                    await Firestore.instance
                                        .collection("user-activity")
                                        .document(phoneNumber)
                                        .collection("cart")
                                        .document("${documentNumber}")
                                        .updateData({
                                      'count' : Cart_list[widget.index]['count'],
                                    });
                                    print('added to cart');
                                    await Firestore.instance
                                        .collection("user-activity")
                                        .document(phoneNumber)
                                        .collection("total")
                                        .document("total")
                                        .updateData({
                                      'total' : grandTotal + double.parse(Cart_list[widget.index]["rate"]),
                                    });
                                    print("done Increment");
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Total Rate"

                            +
                            "\n${_count*widget.rate}"

                        ,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
          /*          if (Cart_list.length > 0)
                    Positioned(
                      top: 180.0 * Cart_list.length,

                        child: Padding(
                          padding: const EdgeInsets.only(top:20.0),
                          child: Text("     Total Amount: " + "${gettotal()}",style: TextStyle(fontWeight:FontWeight.bold),textAlign: TextAlign.center,),
                        ),
                      ),
          */
        ],
      ),
    );
  }
}
