import 'package:rtrigger/Utils/custom_drawer_collapse.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse_home.dart';
import 'package:rtrigger/Utils/search_bar.dart';

import '../cart.dart';
import './womendetail.dart';
import 'package:flutter/material.dart';

final Color _color = Color.fromRGBO(0, 44, 64, 1);

class WomenhairStyles extends StatefulWidget {
  final String title;
  final String loc;
  final String sum;
  final String location;
  final String description;
  WomenhairStyles({this.title, this.loc, this.sum, this.location,this.description});

  @override
  _WomenhairStylesState createState() => _WomenhairStylesState();
}

class _WomenhairStylesState extends State<WomenhairStyles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 8.397,
              height: double.infinity,
              child: Icon(
                Icons.dehaze,
                color: Colors.white,
              ),
              color: Color.fromRGBO(00, 44, 64, 1),
            ),
            Container(
              color: Colors.white,
            )
          ],
        ),
        title: Text(
          "HairStyles",
          style: TextStyle(color: Color.fromRGBO(00, 44, 64, 1.0)),
        ),
        actions: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(height: 10),
                SearchBar(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 15),
            child: IconButton(
              onPressed: () {
                   Navigator.of(context)
                     .push(MaterialPageRoute(builder: (_) => Cart()));
              },
              icon: Icon(Icons.add_shopping_cart),
              color: _color,
              iconSize: 25,
            ),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Stack(children: [
        Container(height: 900),
        Positioned(
          bottom: 100,
          child: Center(
            child: Image.asset(
              'images/rtigger5.png',
              fit: BoxFit.fitHeight,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 45, top: 15.0, bottom: 0.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Colors.white70,
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => WomenDetail(title: widget.title, loc: widget.loc, description: widget.description, sum: widget.sum, address: widget.location,)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                'images/womenhairstyle1.jpg'))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            'Hair Style 1',
                                            style: TextStyle(
                                                color: _color,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            '1 km from your location',
                                            style: TextStyle(
                                                fontSize: 10, color: _color),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          'Stylist Name',
                                          style: TextStyle(
                                              fontSize: 10, color: _color),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          Text('5'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        CollapsingNavigationDrawer(false),
      ]),
    );
  }
}
