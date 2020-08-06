import 'package:flutter/material.dart';

import '../colors.dart';

class Payin extends StatefulWidget {
  @override
  _PayinState createState() => _PayinState();
}

class _PayinState extends State<Payin> {
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
          Text("2", style: TextStyle(fontWeight: FontWeight.bold))
        ]),
        Padding(
          padding: EdgeInsets.only(top: y * 0.026),
        ),
        Padding(
            padding: EdgeInsets.only(left: x * 0.0875, bottom: y * 0.013),
            child: Row(children: [blueText('Payin', y * 0.028)],)),
        Container(
          height: y * 0.13,
          width: x / 4,
          child: Image.asset('assets/1.png',
          ),
          alignment: Alignment.center,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: y * 0.002, horizontal: x * 0.013),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.020),
          child: SizedBox(
            height: y / 3,
            width:  x ,
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: y * 0.013, horizontal: x * 0.025)),
                  Align(
                      child: Padding(
                        padding: EdgeInsets.only(left: x * 0.0375,bottom: y * 0.013),
                        child: blueText('Notifications'),
                      ),
                      alignment: Alignment.centerLeft),
                  // Padding(padding: EdgeInsets.only(left: 20.0, top: 20.0), child: new Text('You Recieved Rs. 4000 Salary'),),
                  // Padding(padding: EdgeInsets.only(left: 20.0, top: 20.0), child: new Text('You Recieved Rs. 4000 Salary'),),

                  Align(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203),
                        child: Center(
                          child: Text('You Recieved Rs. 4000 Salary', style: TextStyle(fontSize: y * 0.019),),
                        ),
                      ),
                      alignment: Alignment.centerLeft),

                  Align(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203),
                        child: Center(
                            child: Text('You Recieved Rs. 4000 Salary', style: TextStyle(fontSize: y * 0.019),)),
                      ),
                      alignment: Alignment.centerLeft),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  blueText(String txt, [double size = 22.0]) {
    return  Text(
      txt,
      style: TextStyle(
          color: blueColor,
          fontSize: size,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8),
    );
  }
}
