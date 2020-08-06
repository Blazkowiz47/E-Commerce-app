import 'package:flutter/material.dart';

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

        Padding(padding: EdgeInsets.only(top: y * 0.026)),
        Padding(padding: EdgeInsets.only(left: x * 0.0875, bottom: y * 0.013),
            child: Row(children: [blueText('Payout', y * 0.033)],)),

        Padding(padding: EdgeInsets.only(top: y * 0.013)),

        Padding(
          padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.020),
          child: SizedBox(
            height: y / 6.2,
            width: x,
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: y * 0.013, horizontal: x * 0.022)),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: x * 0.0375,bottom: y * 0.013),
                        child: Text('Due from 12th May 2020',style: TextStyle(fontSize: y*0.023)),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: y * 0.013, horizontal: x * 0.14),
                        child: Text('Rs. Amount', style: TextStyle(fontSize: y*0.024)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: y * 0.013, horizontal: x * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
             blueText('History', y * 0.023),
              blueText('Balance',y * 0.023),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(x * 0.1,y * 0.013,x * 0.2,y * 0.01),
          child: Row(
            children: <Widget>[
              Text('Recevied Amount'),
              Spacer(),
              Text('0.00'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(x * 0.1,y * 0.01,x * 0.2,y * 0.013),
          child: Row(
            children: <Widget>[
              Text('Recevied Amount'),
              Spacer(),
              Text('0.00'),
            ],
          ),
        ),
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
