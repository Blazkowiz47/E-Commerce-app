import 'package:flutter/material.dart';
import 'package:rtiggers/colors.dart';
import 'package:rtiggers/HomeScreen/HomeScreen.dart';

class AllActiveOrders extends StatefulWidget {
  @override
  _AllActiveOrdersState createState() => _AllActiveOrdersState();
}

class _AllActiveOrdersState extends State<AllActiveOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  getBody() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.5,
        child: Card(
          elevation: 8.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "ID: 171111111111111",
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.018),
                      ),
                      Spacer(),
                      IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: new BoxDecoration(
                          color: brownColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.all(5),
                        height: 35.0,
                        width: 125.0,
                        child: FlatButton(
                            onPressed: () {},
                            child: Text(
                              "Preparing",
                              style: TextStyle(color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height*0.018),
                            )),
                      ),
                    ),
                    Text('Name of the person \n\t\t\t\t 1st Order',
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.015)),
                  ],
                ),
                Text(
                  'Total Bill : Rs. amount',
                  style: TextStyle(color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height*0.018),
                ),
                Text('1 Chicken Egg Dosa ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: blueColor,
                        fontSize: MediaQuery.of(context).size.height*0.022)),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 18.0, 18.0, 18.0),
                  child: Row(
                    children: [
                      Text('Total Bill: Rs. Amount \t\t',
                          style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.018)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: new BoxDecoration(
                            color: brownColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          // padding: EdgeInsets.all(5),
                          height: 22.0,
                          width: 55.0,
                          child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Paid",
                                style: TextStyle(
                                    color: Colors.white, fontSize: MediaQuery.of(context).size.height*0.014),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                      height: MediaQuery.of(context).size.height*0.05,
                      width: MediaQuery.of(context).size.width / 1.8,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      child: Center(
                          child: Text('Order Ready (09:57)',
                              style: TextStyle(
                                  color: Colors.white, fontSize: MediaQuery.of(context).size.height*0.018)))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
