import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rtiggers/HomeScreen/HomeScreen.dart';
import 'package:rtiggers/MedicalActiveOrders/medical_active_orders_utility.dart';

import 'package:rtiggers/active_order_home.dart';
import 'package:rtiggers/colors.dart';

class ModifyPrice extends StatefulWidget {
  @override
  _ModifyPriceState createState() => _ModifyPriceState();
}

class _ModifyPriceState extends State<ModifyPrice>
    with SingleTickerProviderStateMixin {
  static const IconData attachment_icon =
      IconData(0xe2bc, fontFamily: 'MaterialIcons');
  TabController tabView;
  @override
  void initState() {
    tabView = TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: getTabBar(), preferredSize: Size.fromHeight(100.0)),
      body: Column(
        children: [
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.4,
              width: MediaQuery.of(context).size.width - 50.0,
              child: getBody(),
            ),
          ),
          Row(
            children: [
              Container(
                height: 45.0,
                width: (MediaQuery.of(context).size.width - 52.0) / 2,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Active', style: TextStyle(color: Colors.white)),
                  color: brownColor,
                ),
              ),
              Container(
                height: 45.0,
                decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Theme.of(context).dividerColor,
                        width: 2.0,
                      ),
                    ),
                    color: Colors.black),
                child: Text(''),
              ),
              Container(
                height: 45.0,
                width: (MediaQuery.of(context).size.width - 52.0) / 2,
                child: FlatButton(
                  onPressed: () {},
                  child:
                      Text('Inactive', style: TextStyle(color: Colors.white)),
                  color: brownColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  getTabBar() {
    return Column(
      children: [
        SizedBox(
          height: 6.0,
        ),
        Text('Active Medical Orders',
            style: TextStyle(
                color: blueColor, fontWeight: FontWeight.bold, fontSize: 17.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: new Text(
                  'New Order',
                  style:
                      TextStyle(color: blueColor, fontWeight: FontWeight.bold),
                )),
            FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ActiveOrderHelper()));
                },
                child: new Text(
                  'Active Order',
                  style:
                      TextStyle(color: blueColor, fontWeight: FontWeight.bold),
                )),
            FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MedicalOrdersHelper()));
                },
                child: new Text(
                  'Past Order',
                  style:
                      TextStyle(color: blueColor, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ],
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          orderInProcess(),
          getOrder(),
        ],
      ),
    );
  }

  orderInProcess() {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.6,
        child: Card(
          elevation: 6.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text("1 Order #106", style: TextStyle(fontSize: 17.0)),
                    Spacer(),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(context);
                          },
                          icon: Icon(attachment_icon),
                        ),
                        Text("View Attachment",
                            style: TextStyle(fontSize: 12.0)),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    'Pricing',
                    style: TextStyle(fontSize: 13.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                ),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("Rs.  ")),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 40.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: TextFormField(
                          decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2.0),
                                borderRadius: BorderRadius.circular(30.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2.0),
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                      onPressed: () {},
                      color: blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text('Submit',
                          style: TextStyle(color: Colors.white))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getOrder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        child: Card(
          elevation: 6.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("1 Order #106", style: TextStyle(fontSize: 17.0)),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Pricing',
                          style: TextStyle(fontSize: 13.0),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                        ),
                        Text("Rs. 244")
                      ],
                    ),
                    // Padding(padding: EdgeInsets.only(right: 10.0),),
                    Spacer(),

                    Column(
                      children: [
                        Text(
                          'Submitted',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                        ),
                        FlatButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ModifyPrice()));
                            },
                            color: blueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text('Modify Price',
                                style: TextStyle(color: Colors.white))),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                        ),
                        FlatButton(
                            onPressed: () {},
                            color: brownColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text('Notifications',
                                style: TextStyle(color: Colors.white))),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
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
            height: 500,
            child: SizedBox.expand(
                child: Material(
                    type: MaterialType.transparency, child: FlutterLogo())),
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
}
