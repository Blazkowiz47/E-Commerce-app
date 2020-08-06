import 'package:flutter/material.dart';
import '../main_tabs.dart';
import '../order.dart';

class DonePage extends StatefulWidget {
  final int val;
  DonePage(this.val);
  @override
  _DonePageState createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Scaffold(
      body: new Stack(children: <Widget>[
        SizedBox(
          height: y * 0.2,
        ),
        ListView(
          children: <Widget>[
            Container(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: y * 0.05,
                  ),
                  SizedBox(
                      height: y * 0.15,
                      width: x * 0.1,
                      child: Image.asset(
                        "images/correct.png",
                        width: x * 0.1,
                        height: y * 0.15,
                      )),
                  SizedBox(
                    height: y * 0.02,
                  ),
                  Text(
                    "Order Successful",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(00, 44, 64, 1.0),
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: y * 0.02,
                  ),
                  Text(
                    "Thankyou so much for",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "ordering",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: y * 0.06,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: x * 0.25, right: x * 0.25),
                    child: SizedBox(
                      height: y * 0.06,
                      width: x * 0.9,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => Order()));
                        },
                        child: Text("Check Status",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: BorderSide(
                              color: Color.fromRGBO(00, 44, 64, 1.0),
                            )),
                        color: Color.fromRGBO(00, 44, 64, 1.0),
                      ),
                    ),
                  ),
                ],
              ),
              height: y * 0.6,
              margin: new EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
              ),
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: new Offset(0.0, 10.0),
                  ),
                ],
              ),
            ),
            Image(
              image: AssetImage("images/1o.png"),
              height: y * 0.3,
              width: x * 0.2,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: x * 0.15, right: x * 0.15),
              child: SizedBox(
                height: y * 0.1,
                width: x * 0.2,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Homepage()));
                  },
                  child: Text("Continue Shopping",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(
                        color: Color.fromRGBO(00, 44, 64, 1.0),
                      )),
                  color: Color.fromRGBO(00, 44, 64, 1.0),
                ),
              ),
            ),
            SizedBox(
              height: y * 0.03,
            )
          ],
        ),
      ]),
    );
  }
}
