import 'noorder.dart';
import './main.dart';
import 'package:flutter/material.dart';
import './track_order.dart';

class OrderItem extends StatefulWidget {
  final String title;
  final String loc;
  final String status;
  final double amount;
  final int mode;
  OrderItem({this.title, this.loc, this.status, this.amount, this.mode});
  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    double x  =  MediaQuery.of(context).size.width;
    double y =  MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.only(top: y*0.02, bottom: y*0.05, left: x*0.1),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => TrackOrder()));
        },
        child: Card(
          elevation: 15,
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: y*0.01),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(
                    widget.loc,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width / 4 - 20,
                    height: y*0.22,
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            widget.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text("\n"),
                      Row(
                        children: <Widget>[
                          if (widget.mode == 1)
                            Image(
                              image: AssetImage('images/Card.png'),
                              height: 15,
                              width: 15,
                              color: null,
                              fit: BoxFit.scaleDown,
                            ),
                          if (widget.mode == 1)
                            Text(
                              'Credit Card',
                              style: TextStyle(fontSize: 10),
                            ),
                          if (widget.mode == 2)
                            Image(
                              image: AssetImage('images/GPAY.png'),
                              height: 15,
                              width: 15,
                              color: null,
                              fit: BoxFit.scaleDown,
                            ),
                          if (widget.mode == 2)
                            Text(
                              'Google Pay',
                              style: TextStyle(fontSize: 10),
                            ),
                          if (widget.mode == 3)
                            Image(
                              image: AssetImage('images/PAYTM.png'),
                              height: 15,
                              width: 15,
                              color: null,
                              fit: BoxFit.scaleDown,
                            ),
                          if (widget.mode == 3)
                            Text(
                              'PayTM',
                              style: TextStyle(fontSize: 10),
                            ),
                          if (widget.mode == 4)
                            Image(
                              image: AssetImage('images/upi.png'),
                              height: 15,
                              width: 15,
                              color: null,
                              fit: BoxFit.scaleDown,
                            ),
                          if (widget.mode == 4)
                            Text(
                              'UPI Payment',
                              style: TextStyle(fontSize: 10),
                            ),
                          if (widget.mode == 5)
                            Image(
                              image: AssetImage('images/emi.png'),
                              height: 15,
                              width: 15,
                              color: null,
                              fit: BoxFit.scaleDown,
                            ),
                          if (widget.mode == 5)
                            Text(
                              'EMI Payment',
                              style: TextStyle(fontSize: 10),
                            ),
                          if (widget.mode == 6)
                            Image(
                              image: AssetImage('images/net.png'),
                              height: 15,
                              width: 15,
                              color: null,
                              fit: BoxFit.scaleDown,
                            ),
                          if (widget.mode == 6)
                            Text(
                              'Net Banking',
                              style: TextStyle(fontSize: 10),
                            ),
                          if (widget.mode == 7)
                            Image(
                              image: AssetImage('images/Cash.png'),
                              height: y*0.06,
                              width: x*0.06,
                              color: null,
                              fit: BoxFit.scaleDown,
                            ),
                          if (widget.mode == 7)
                            Text(
                              'Cash on Delivery',
                              style: TextStyle(fontSize: 13),
                            ),
                          Text("\n")
                        ],
                      ),
                      Text(
                        "${widget.amount}",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                    ],
                  ),
                  Column(children: <Widget>[
                    Row(children: <Widget>[
                      SizedBox(width: x*0.02,),
                      if (widget.status == 'ordered')
                        FlatButton(
                          onPressed: () {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Order Will be Cancelled with in 24 hrs'))
                            );

                          },
                          child: Text(
                            "Cancel Order",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                    ]),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        if (widget.status == 'ordered')
                          Container(

                            height:y*0.06,
            width:x*0.2,
            child:Padding(
                            padding:  EdgeInsets.only(right: x*0.01),
                            child: RaisedButton(

                              onPressed: () {
                                gototrack();
                              },
                              child: Text("Track",
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15,
                                  )),
                              color: Color.fromRGBO(00, 44, 64, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),),
                      ],
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

  void gototrack() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TrackOrder()));
  }
}
