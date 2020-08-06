import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rtiggers/ActiveOrders/preparing_active_orders.dart';
import 'package:rtiggers/MedicalActiveOrders/medical_active_orders_utility.dart';
import 'package:rtiggers/OrderScreen/ActiveOrders.dart';

import 'package:rtiggers/PastOrder/past_order_utility.dart';
import 'package:rtiggers/active_order_home.dart';
import 'package:rtiggers/colors.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  int minutes = 10;

  TabController tabView;

  static const IconData attachment_icon =
      IconData(0xe2bc, fontFamily: 'MaterialIcons');
  @override
  void initState() {
    tabView = TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
          child: getTabBar(), preferredSize: Size.fromHeight(y*0.1)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
              child: Container(
                  height: y / 1.3,
                  width: MediaQuery.of(context).size.width - 50.0,
                  child: SingleChildScrollView(
                    child: getBody(),
                  )),
            ),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: (MediaQuery.of(context).size.width - 52) / 2,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text('Active', style: TextStyle(color: Colors.white)),
                    color: brownColor,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
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
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: (MediaQuery.of(context).size.width - 52) / 2,
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
      ),
    );
  }

  getTabBar() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Text(
              'New Orders',
              style: TextStyle(
                color: blueColor,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.022,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                onPressed: () {
                  //Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => OrderPage()));
                },
                child: Text(
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
                          builder: (context) => PastOrderHelper()));
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
    return Column(
      children: [
        getOrders(),
        getMedicalOrder(),
      ],
    );
  }

  getMedicalOrder() {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: y * 0.006, horizontal: x * 0.0125),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3.6,
        child: Card(
          elevation: 6.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: y * 0.013, horizontal: x * 0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text("1 Order #106",
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018)),
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
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height *
                                    0.014)),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: y * 0.006, horizontal: x * 0.0125),
                  child: Text(
                    'Name of the person \t\t\t\t 1st Order',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.016),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: y * 0.013, horizontal: x * 0.025),
                      child: Container(
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.red)),
                        padding: EdgeInsets.all(5),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.22,
                        child: Center(
                            child: Text(
                          "Reject",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.015,
                          ),
                        )),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: y * 0.013, horizontal: x * 0.025),
                      child: Center(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(18.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: LinearProgressIndicator(
                                  backgroundColor: Colors.green[200],
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(greenColor),
                                  value: 0.75,
                                ),
                              ),
                            ),
                            Positioned(
                                top: MediaQuery.of(context).size.height * 0.015,
                                left: MediaQuery.of(context).size.width * 0.1,
                                child: GestureDetector(
                                  onTap: () {
                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalActiveOrders()));
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MedicalOrdersHelper(),
                                      ),
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      'Accept (00:30)',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.015),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getOrders() {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203),
      child: SizedBox(
        width: x,
        height: y / 2.5,
        child: Card(
          elevation: 8.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: y * 0.0195, horizontal: x * 0.0375),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203),
                  child: Row(
                    children: [
                      Text("ID: 171111111111111", style: TextStyle(fontSize: 14.0),),
                      Spacer(),
                      Text('Time', style: TextStyle(fontSize: 14.0)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: y * 0.007, horizontal: x * 0.012),
                  child: Text('Name of the person \t\t\t\t 1st Order'),
                ),
                Text(
                  'Total Bill : Rs. amount',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '1 Chicken Egg Dosa ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: blueColor,
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, y * 0.0234,x * 0.045, y * 0.0234),
                  child: Text('Set food preparation time'),
                ),
                Center(
                  child: Container(
                    height: y * 0.05,
                    width: x / 2,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                if (minutes >= 1) {
                                  minutes -= 1;
                                }
                              });
                            }),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: y * 0.007, horizontal: x * 0.012),
                            child: Text(
                              '$minutes mins',
                              style: TextStyle(color: Colors.white),
                            )),
                        IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                minutes += 1;
                              });
                            }),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203)),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: y*0.0065, horizontal: x * 0.025),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.red)),
                        padding: EdgeInsets.all(5),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.22,
                        child: Center(
                            child: Text("Reject", style: TextStyle(color: Colors.red, fontSize: y * 0.015)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: y*0.0065,horizontal: x * 0.025),
                      child: Container(
                        decoration:  BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: y * 0.006, horizontal: x * 0.0125),
                        height: y * 0.05,
                        width: x * 0.4,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ActiveOrderHelper()));
                          },
                          child: Center(
                            child: Text("Accept (00:30)", style: TextStyle(color: Colors.white, fontSize: y * 0.015),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //Padding(padding: EdgeInsets.all(8.0),),
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
            height: MediaQuery.of(context).size.height * 0.5,
            child: SizedBox.expand(
              child: Material(
                type: MaterialType.transparency,
                child: FlutterLogo(),
              ),
            ),
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
