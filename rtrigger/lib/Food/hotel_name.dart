import 'package:flutter/material.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse_home.dart';
import 'package:rtrigger/Utils/search_bar.dart';
import 'package:rtrigger/cart.dart';
import 'food.dart';

final Color _color = Color.fromRGBO(0, 44, 64, 1);

class HotelName extends StatefulWidget {
  @override
  _HotelNameState createState() => _HotelNameState();
}

class _HotelNameState extends State<HotelName> {
  Widget hotelCard() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        top: height * 0.01,
        bottom: height * 0.01,
      ),
      child: Container(
        child: Row(
          children: [
            Container(
              width: width * 0.8,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white70,
                elevation: 4,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Food()));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(
                      height * 0.02,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: height * 0.07,
                          width: width * 0.13,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('images/hotel.jpg'))),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.04),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: height * 0.01, bottom: height * 0.005),
                                child: Text(
                                  'Hotel Name',
                                  style: TextStyle(
                                      color: _color,
                                      fontWeight: FontWeight.w900,
                                      fontSize: height * 0.023),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: height * 0.005),
                                child: Text(
                                  '1 km from your location',
                                  style: TextStyle(
                                      fontSize: height * 0.016, color: _color),
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: Text(
                                'Home Delivery',
                                style: TextStyle(
                                    fontSize: height * 0.015, color: _color),
                              ),
                            ),
                            Text(
                              'available',
                              style: TextStyle(
                                  fontSize: height * 0.018, color: _color),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: height * 0.03,
                                ),
                                Text(
                                  '5',
                                  style: TextStyle(
                                    fontSize: height * 0.018,
                                  ),
                                ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Row(
          children: <Widget>[
            Container(
              width: width / 8.397,
              height: double.infinity,
              child: Icon(
                Icons.dehaze,
                color: Colors.white,
                size: height * 0.025,
              ),
              color: Color.fromRGBO(00, 44, 64, 1),
            ),
            Container(
              color: Colors.white,
            )
          ],
        ),
        title: Text(
          "Food",
          style: TextStyle(
            color: Color.fromRGBO(00, 44, 64, 1.0),
            fontSize: height * 0.025,
          ),
        ),
        actions: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(height: height * 0.015),
                SearchBar(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.04,
              right: width * 0.04,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Cart()));
              },
              icon: Icon(Icons.add_shopping_cart),
              color: _color,
              iconSize: height * 0.025,
            ),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Stack(children: [
        //Container(height: height),
        Positioned(
          bottom: height * 0.1,
          child: Center(
            child: Image.asset(
              'images/rtigger5.png',
              fit: BoxFit.fitHeight,
              width: width,
              height: height,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.15,
            top: height * 0.05,
            bottom: 0.0,
          ),
          child: Column(
            children: [
              hotelCard(),
              hotelCard(),
            ],
          ),
        ),
        CollapsingNavigationDrawer(false),
      ]),
    );
  }
}
