import 'package:flutter/material.dart';
import './main_tabs.dart';
import 'Utils/custom_drawer_collapse.dart';
import 'Utils/custom_drawer_collapse_home.dart';

final Color _color = Color.fromRGBO(0, 44, 64, 1);

class NoOrder extends StatefulWidget {
  @override
  _NoOrderState createState() => _NoOrderState();
}

class _NoOrderState extends State<NoOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            child: Icon(
              Icons.dehaze,
              color: Colors.white,
            ),
            color: Color.fromRGBO(00, 44, 64, 1.0)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          "Orders",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(top: 0, child: CollapsingNavigationDrawer(false)),
          Positioned(
            top: 100,
            left: 60,
            child: Card(
                elevation: 20,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width - 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          " You Haven't Ordered Anything",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: _color,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Homepage()));
                              },
                              child: Text(
                                "Shop Now",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              color: _color,
                            ),
                          ),
                        ),
                      ],
                    ))),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3 + 120,
            left: 50,
            child: Image.asset(
              'images/image.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width - 60,
              height: MediaQuery.of(context).size.height / 3,
            ),
          ),
        ],
      ),
    );
  }
}
