import 'package:flutter/material.dart';
import '../colors.dart';
import '../colors.dart';
import '../colors.dart';

class Payout extends StatefulWidget {
  @override
  _PayoutState createState() => _PayoutState();
}

class _PayoutState extends State<Payout> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: getBody(),
    );
  }

  getBody() {
    double y = MediaQuery.of(context).size.height;
    double x = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(children: [
          Text("1", style: TextStyle(fontWeight: FontWeight.bold))
        ]),
        Padding(
          padding: EdgeInsets.only(top: y * 0.026),
        ),
        Padding(
            padding: EdgeInsets.only(left: x * 0.0875, bottom: y * 0.013),
            child: Row(children: [blueText('Payout', y * 0.033)],)),
        Padding(
            padding: EdgeInsets.only(left: x * 0.12 , bottom: y * 0.013),
            child: Row(
              children: [
                Text(
                  'Balance Rs. 4000',
                  style: TextStyle(
                    fontSize: y*0.019,
                    color: blueColor,
                  ),
                )
              ],
            )),
        Padding(
          padding: EdgeInsets.only(left: x * 0.25),
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () {},
                color: blueColor,
                child: Text('Pay Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: y*0.02
                    )),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.020),
          child: SizedBox(
            height: y / 3,
            width: x,
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: y * 0.013, horizontal: x * 0.025)),
                  Padding(
                    padding: EdgeInsets.only(left: x * 0.0375,bottom: y * 0.013),
                    child: blueText('History'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.025),
                    child: Center(child: Text('You Recieved Rs. 4000 COD for order #10711',
                      style: TextStyle(fontSize: y*0.0192),)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.025),
                    child: Center(child: Text('You Recieved Rs. 1100 COD for order #10006',
                      style: TextStyle(
                          fontSize: y*0.0192,
                      ),)),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  blueText(String txt, [double size = 22.0]) {
    return new Text(
      txt,
      style: new TextStyle(
          color: blueColor,
          fontSize: size,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8),
    );
  }
}
