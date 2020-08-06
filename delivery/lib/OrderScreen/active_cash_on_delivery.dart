import 'package:flutter/material.dart';
import 'package:rtiggers/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ActiveOrderCashOnDelivery extends StatefulWidget {
  @override
  _ActiveOrderCashOnDeliveryState createState() =>
      _ActiveOrderCashOnDeliveryState();
}

class _ActiveOrderCashOnDeliveryState extends State<ActiveOrderCashOnDelivery> {
  String phoneNo = "7080855524";
  String status = '';
  bool received = false;

  @override
  Widget build(BuildContext context) {
    double y = MediaQuery.of(context).size.height;
    double x = MediaQuery.of(context).size.width;


    return SingleChildScrollView(
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203),
          child: SizedBox(
            width:  x,
            height: y / 1.48,
            child: Card(
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: y * 0.013, horizontal: x * 0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: y * 0.013, horizontal: x * 0.025),
                          child: Text("Order", style: TextStyle(fontSize: y * 0.025)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: y * 0.013, horizontal: x * 0.025),
                          child: Text("1 Order #106", style: TextStyle(fontSize: y * 0.018)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: y * 0.013, horizontal: x * 0.025),
                          child: Text("OTP 7361", style: TextStyle(color: blueColor, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    itemrow(height: y, width: x, itemname: 'Item 1', amount: 'Amount'),
                    itemrow(height: y, width: x, itemname: 'Item 2', amount: 'Amount'),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: x * 0.49,
                          ),
                          Container(
                            width: x * 0.2,
                            child: Divider(
                              color: blueColor,
                              thickness: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: x * 0.1,
                          child: Text('Total', style: TextStyle(fontSize: y * 0.02),)),
                    ),

                    Padding(padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203),),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Payment Mode : ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: y * 0.013, horizontal: x * 0.025),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: blueColor.withOpacity(0.3),
                          ),
                          child: Text('Cash On Delivery', style: TextStyle(color: blueColor, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),

                    Padding(padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Cash to received : ', style: TextStyle(fontSize: y * 0.0233)),
                        Padding(padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203)),
                        Container(
                          width: x * 0.29,
                          height: y * 0.04,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(width: 2.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203)),

                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            received = true;
                          });
                        },
                        child: Container(
                          height: y / 27,
                          width: x / 4,
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Center(
                              child: Text('Received', style: TextStyle(color: Colors.white))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: y * 0.004, horizontal: x * 0.0075),
                      child: Text('Deliver To :', style: TextStyle(fontSize: y * 0.023)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 40.0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: x * 0.0125),
                          child: Text('Name of the Person\n\t\t\tAddress'),
                        ),
                        Container(
                          child: Image.asset("assets/pppp.png"),
                          height: y*0.1,
                          width: x*0.1,
                        ),
                        GestureDetector(
                          onTap: () => makePhoneCall('tel:$phoneNo'),
                          child: Container(
                            child: Image.asset("assets/phone.png"),
                            height: y*0.115,
                            width: x*0.115,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: y * 0.004, horizontal: x * 0.0075),
                      child: Text('Any query contact :', style: TextStyle(fontSize: y * 0.023)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 40.0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: x * 0.0125),
                          child: Text('Name of the Person\n\t\t\tAddress'),
                        ),
                        Container(
                          child: Image.asset("assets/pppp.png"),
                          height: y*0.1,
                          width: x*0.1,
                        ),
                        GestureDetector(
                          onTap: () => makePhoneCall('tel:$phoneNo'),
                          child: Container(
                            child: Image.asset("assets/phone.png"),
                            height: y*0.115,
                            width: x*0.115,
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
          top:  y / 1.53,
          left: x * 0.2,
          child: GestureDetector(
            onTap: () {
              // showDialog(context: context, builder: (context) => showStatus(context));
              showDialog(context);
            },
            child: Container(
              height:  y * 0.045,
              width:  x * 0.5,
              decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Center(
                  child: Text('Order Delivered', style: TextStyle(color: Colors.white))),
            ),
          ),
        )
      ]),
    );
  }

  showStatus(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      child: Text('$status'),
    );
  }

  void showDialog(BuildContext context) {
    double y = MediaQuery.of(context).size.height;
    double x = MediaQuery.of(context).size.width;
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
            height:  y * 0.26,
            child: SizedBox.expand(
                child: Material(
                    type: MaterialType.transparency,
                    child: Center(
                      child: Text(
                        received
                            ? 'Order Received Successfully'
                            : 'Order not yet received',
                        style: TextStyle(color: brownColor, fontSize: 18.0),
                      ),
                    ))),
            margin: EdgeInsets.only(bottom:  y * 0.013, left: x * 0.025, right: x * 0.025),
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

  Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class itemrow extends StatelessWidget {
  const itemrow({@required this.height, @required this.width, @required this.itemname, @required this.amount}) ;

  final double height;
  final double width;
  final String itemname;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1, bottom: height * 0.007),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(itemname,style: TextStyle(fontSize: height * 0.0165),),
          Text(amount,style: TextStyle(fontSize: height * 0.0165),),
        ],
      ),
    );
  }
}
