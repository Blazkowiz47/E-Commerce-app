import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rtiggers/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ActiveOrder extends StatefulWidget {
  @override
  _ActiveOrderState createState() => _ActiveOrderState();
}

class _ActiveOrderState extends State<ActiveOrder> {
  String phoneNo = "7080855524";
  String status = '';

  @override
  Widget build(BuildContext context) {
    double y = MediaQuery.of(context).size.height;
    double x = MediaQuery.of(context).size.width;

    return Stack(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203),
        child: SizedBox(
          width: x,
          height: y / 1.7,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.grey,
                )
              ]
            ),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "1 Order #123",
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203),
                        child: GestureDetector(
                          onTap: () => setPickupStatus(),
                          child: Container(
                            decoration:  BoxDecoration(
                              color: brownColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: EdgeInsets.all(5),
                            height: 30,
                            width: 70,
                            child: Center(
                                child: Text(
                              "Pickup",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => updateDelivery(),
                          child: Container(
                            decoration: new BoxDecoration(
                              color: brownColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: EdgeInsets.all(5),
                            height: 30,
                            width: 70,
                            child: Center(
                                child: Text(
                              "Delivery",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Medicine Name',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Pay Through : ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: greenColor,
                        ),
                        child: Text(
                          'Paid Through Gpay',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Image.asset("assets/1.png"),
                        height: 50.0,
                        width: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Text('Medical Address'),
                      ),
                      Expanded(
                        child: Container(
                          child: Image.asset("assets/pppp.png"),
                          height: 50.0,
                          width: 50.0,
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => makePhoneCall('tel:$phoneNo'),
                          child: Container(
                            child: Image.asset("assets/2.png"),
                            height: 35.0,
                            width: 35.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Deliver To :',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Text('Name of the Person\n\t\t\tAddress'),
                      ),
                      Container(
                        child: Image.asset("assets/pppp.png"),
                        height: 50.0,
                        width: 50.0,
                      ),
                      GestureDetector(
                        onTap: () => makePhoneCall('tel:$phoneNo'),
                        child: Container(
                          child: Image.asset("assets/2.png"),
                          height: 35.0,
                          width: 35.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height / 1.8,
        left: MediaQuery.of(context).size.width / 6,
        child: GestureDetector(
          onTap: () {
            // showDialog(context: context, builder: (context) => showStatus(context));
            showDialog(context);
          },
          child: Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Text('Order Delivered', style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
      )
    ]);
  }

  showStatus(BuildContext context) {
    return Container(
      height: 250.0,
      width: 250.0,
      child: Text('$status'),
    );
  }

  void showDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 200,
            child: SizedBox.expand(
                child: Material(
                    type: MaterialType.transparency,
                    child: Center(
                      child: Text(
                        status == ''
                            ? 'Processing order'
                            : 'Order $status Successfully !',
                        style: TextStyle(color: brownColor, fontSize: 18.0),
                      ),
                    ))),
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  setPickupStatus() async {
    var user = await FirebaseAuth.instance.currentUser();
    await Firestore.instance
        .collection('delivery-users')
        .document(user.uid)
        .updateData({
      'status': 'picked',
    });
    setState(() {
      status = "Picked";
    });
  }

  updateDelivery() async {
    var user = await FirebaseAuth.instance.currentUser();
    await Firestore.instance
        .collection('delivery-users')
        .document(user.uid)
        .updateData({
      'status': 'delivered',
    });
    setState(() {
      status = "Delivered";
    });
  }

  Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
