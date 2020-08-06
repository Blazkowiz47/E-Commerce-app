import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rtrigger/main_tabs.dart';
import './order_items.dart';
import './main.dart';
import 'Utils/custom_drawer_collapse.dart';
import 'Utils/custom_drawer_collapse_home.dart';

var Meals_list_arrived = [
  {
    'id': 'Drink Name',
    'loc': 'images/ii.png',
    'status': 'deliverd',
    'amount': 566.0
  },
];

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
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
          "   Orders",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(00, 44, 64, 1),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              'images/rtigger13.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          if (Meals_list_ordered.length == 0)
            Text(
              "                Arriving Soon\n",
              style: TextStyle(
                color: Color.fromRGBO(00, 44, 64, 1.0),
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
          /*ListView(
      padding: EdgeInsets.only(
        left: x * 0.045,
        right: x * 0.02,
        top: y * 0.05,
      ),
      children: Meals_list_ordered.map((tx) => OrderItem(tx['id'],
          tx['loc'], tx['status'], tx['amount'], tx['mode'])).toList(),
            ),*/

          StreamBuilder(
              stream: Firestore.instance
                  .collection("user-activity")
                  .document(phoneNumber)
                  .collection("order")
                  .document("active_order")
                  .collection("active_orders")
                  .snapshots(),

              // ignore: missing_return
              builder: (contextd, snapshots) {
                if (!snapshots.hasData) return const Text('loading....');
                return ListView.builder(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(contextd).size.height * 0.02,
                      left: MediaQuery.of(context).size.width * 0.07,
                      right: MediaQuery.of(context).size.width * 0.07),
                  scrollDirection: Axis.vertical,
                  itemExtent: 200,
                  itemCount: snapshots.data.documents.length,
                  itemBuilder: (contextd, index) {
                    DocumentSnapshot df = snapshots.data.documents[index];
                    print(df['id']);

                    return OrderItem(
                      title: df['id'],
                      amount: double.tryParse(df['amt']),
                      loc: 'images/ii.png',
                      mode: int.tryParse(df['mode']),
                    );
                  },
                );
              }),

          Padding(
            padding: EdgeInsets.only(top: y * 0.3),
            child: Text(
              "                 Past Orders",
              style: TextStyle(
                color: Color.fromRGBO(00, 44, 64, 1.0),
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
          ),

          //SizedBox(height: MediaQuery.of(context).size.height*0.9,),

          Padding(
            padding: EdgeInsets.only(top: y * 0.3),
            child: StreamBuilder(
                stream: Firestore.instance
                    .collection("user-activity")
                    .document(phoneNumber)
                    .collection("order")
                    .document("past_order")
                    .collection("past_orders")
                    .snapshots(),

                // ignore: missing_return
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text('loading....');
                  return ListView.builder(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    scrollDirection: Axis.vertical,
                    itemExtent: 200,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data.documents[index];

                      return OrderItem(
                        title: ds['id'],
                        amount: double.tryParse(ds['amt']),
                        loc: 'images/ii.png',
                        mode: int.tryParse(ds['mode']),
                      );
                    },
                  );
                }),
          ),
          /* Positioned(
      top: 210.0 * Meals_list_ordered.length,
      child: Container(
        height: 200.0 * Meals_list_arrived.length,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: Meals_list_arrived.map((tx) => OrderItem(
                  tx['id'], tx['loc'], tx['status'], tx['amount'], 7))
              .toList(),
        ),
      ),
            ),*/
          CollapsingNavigationDrawer(false),
        ],
      ),
    );
  }
}
