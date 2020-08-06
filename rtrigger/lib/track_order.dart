import 'package:flutter/material.dart';

class TrackOrder extends StatelessWidget {
  final Color _color = Color.fromRGBO(0, 44, 64, 1);

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y  = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(child:SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: _color),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'Tracking the Order',
                    style: TextStyle(color: _color, fontSize: 15),
                  ),
                  Container(
                      height: y*0.05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: _color),
                      child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Map',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ))),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: y*0.02),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: y*0.2,

                decoration: BoxDecoration(
                    color: _color,
                  
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Amount',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Delivery Time',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Status: Your Order is out for delivery',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Stack(
              children: [
               Positioned(
                    top: 47.0,
                    left: 48.0,
                    right: 360.0,
                    bottom: 440.0,
                    child: Container(
                      color: _color,
                    )),
                Positioned(
                    top: 105.0,
                    left: 48.0,
                    right: 360.0,
                    bottom: 370.0,
                    child: Container(
                      color: _color,
                    )),
                Positioned(
                    top: 180.0,
                    left: 48.0,
                    right: 360.0,
                    bottom: 300.0,
                    child: Container(
                      color: _color,
                    )),
                Positioned(
                    top: 252.0,
                    left: 48.0,
                    right: 360.0,
                    bottom: 237.0,
                    child: Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                        color: Colors.black,
                      ),
                    )),
                Container(

                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                  ),


                  child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 40.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.fiber_manual_record,
                            size: 20,
                            color: _color,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              'Your order has been placed',
                              style: TextStyle(color: _color, fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    /*Padding(
              padding: const EdgeInsets.only(left:47.0),
              child: Container(
                color: _color,
                height: 40,
                width: 5,
              ),
            ),*/
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 40.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.fiber_manual_record,
                            size: 20,
                            color: _color,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              'Your order has been confirmed',
                              style: TextStyle(color: _color, fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    /*Padding(
              padding: const EdgeInsets.only(left:47.0),
              child: Container(
                color: _color,
                height: 45,
                width: 5,
              ),
            ),*/
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 40.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.fiber_manual_record,
                            size: 20,
                            color: _color,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Container(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                    'Your order has been picked up by delivery executive',
                                    style: TextStyle(
                                        color: _color, fontSize: 18))),
                          )
                        ],
                      ),
                    ),
                    /*Padding(
              padding: const EdgeInsets.only(left:47.0),
              child: Container(
                color: Colors.grey,
                height: 40,
                width: 2,
              ),
            ),*/
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 40.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: _color,
                                                      child: Icon(
                              Icons.arrow_forward,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              'Your order is out for delivery',
                              style: TextStyle(color: _color, fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    /*Padding(
              padding: const EdgeInsets.only(left:47.0),
              child: Container(
                color: Colors.grey,
                height: 40,
                width: 2,
              ),
            ),*/
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 40.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.radio_button_unchecked,
                            size: 20,
                            color: _color,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              'Your order has been delivered',
                              style: TextStyle(color: _color, fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    Image.asset(
                      'images/pp.png',
                      height: 220,
                    )
                  ],
                ),
                )],
            ),
          ],
        ),
      ),
      ));
  }
}
