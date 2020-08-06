import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse_home.dart';
import 'package:rtrigger/Utils/search_bar.dart';
import 'package:rtrigger/cart.dart';
import 'package:rtrigger/filter.dart';
import 'package:rtrigger/main.dart';
import 'package:rtrigger/main_tabs.dart';
import 'gradliquordetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var food_list = [
  {'id': 'Ice Cream', 'loc': 'images/i1.png', 'check': true},
  {'id': 'Tea and Coffee', 'loc': 'images/i2.png', 'check': true},
  {'id': 'Pizza', 'loc': 'images/i3.png', 'check': true},
  {'id': 'Fish and Chicken', 'loc': 'images/i4.png', 'check': true},
  {'id': 'Meal', 'loc': 'images/i5.png', 'check': true},
  {'id': 'Breakfast', 'loc': 'images/ui.png', 'check': true},
  {'id': 'Shakes and Juices', 'loc': 'images/oo.png', 'check': true},
  {'id': 'Soft Drinks', 'loc': 'images/ii.png', 'check': true},
  {'id': 'Burgers and Sandwiches', 'loc': 'images/oh.png', 'check': true},
  {'id': 'Sweets', 'loc': 'images/uil.png', 'check': true},
  {'id': 'Dinner', 'loc': 'images/rtigger6.png', 'check': true},
  {'id': 'Cakes and Pastry', 'loc': 'images/ih.png', 'check': true},
  {'id': 'Cookies', 'loc': 'images/u,n.png', 'check': true},
  {'id': 'Snacks', 'loc': 'images/ml.png', 'check': true},
  {'id': 'Fruits and Vegetables', 'loc': 'images/oo.png', 'check': true},
];

class Liquor extends StatefulWidget {
  @override
  _LiquorState createState() => _LiquorState();
}

class _LiquorState extends State<Liquor> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.height > 700 ? Large() : Small();
  }
}

class Small extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 8.397,
              height: height,
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
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            Text(
              "Shop Name",
              style: TextStyle(fontSize: 17),
            ),
            Icon(Icons.star, color: Colors.yellow)
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(height: height * 0.9),
                Positioned(
                  left: 70,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Liquor",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(00, 44, 64, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => Filter(liquor_list)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: height * 0.04,
                                width: width * 0.04,
                                child: Image.asset('images/filter.png'),
                              ),
                              Text(
                                'Filter',
                                style: TextStyle(fontSize: height * 0.016),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SearchBar(),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => Cart()));
                        },
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 70,
                  top: 45,
                  child: Text(
                    "Home Delivery Available",
                    style: TextStyle(
                      fontSize: 10,
                      color: Color.fromRGBO(00, 44, 64, 1),
                    ),
                  ),
                ),

                /*  Positioned(
                  top: 80,
                  child: Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    child: GridView(
                        padding: EdgeInsets.only(left: 80, right: 10),
                        children:
                            Meals_list.map((tx) => LiquorItem(tx['id'], tx['loc']))
                                .toList(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                            childAspectRatio: 1,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20)),
                  ),
                ),
                */
                Positioned(
                  top: 60,
                  left: 60,
                  child: StreamBuilder(
                      stream: Firestore.instance
                          .collection("user-activity")
                          .document(phoneNumber)
                          .collection('search')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return CircularProgressIndicator();
                        } else {
                          DocumentSnapshot ds2 = snapshot.data.documents[0];
                          if (ds2['search'] == null) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    if (liquor_list[0]['check'] == true)
                                      GradDrink(liquor_list[0]['id'],
                                          liquor_list[0]['loc'], 'wine'),
                                    if (liquor_list[1]['check'] == true)
                                      GradDrink(liquor_list[1]['id'],
                                          liquor_list[1]['loc'], 'scotch'),
                                    if (liquor_list[2]['check'] == true)
                                      GradDrink(liquor_list[2]['id'],
                                          liquor_list[2]['loc'], 'rum'),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    if (liquor_list[3]['check'] == true)
                                      GradDrink(liquor_list[3]['id'],
                                          liquor_list[3]['loc'], 'beer'),
                                    if (liquor_list[4]['check'] == true)
                                      GradDrink(liquor_list[4]['id'],
                                          liquor_list[4]['loc'], 'whiskey'),
                                    if (liquor_list[4]['check'] == true)
                                      GradDrink(liquor_list[4]['id'],
                                          liquor_list[4]['loc'], 'whiskey'),
                                  ],
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    if (liquor_list[0]['check'] == true)
                                      if (liquor_list[0]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                              .toString()
                                              .toLowerCase()))
                                        GradDrink(liquor_list[0]['id'],
                                            liquor_list[0]['loc'], 'wine'),
                                    if (liquor_list[1]['check'] == true)
                                      if (liquor_list[1]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                              .toString()
                                              .toLowerCase()))
                                        GradDrink(liquor_list[1]['id'],
                                            liquor_list[1]['loc'], 'scotch'),
                                    if (liquor_list[2]['check'] == true)
                                      if (liquor_list[2]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                              .toString()
                                              .toLowerCase()))
                                        GradDrink(liquor_list[2]['id'],
                                            liquor_list[2]['loc'], 'rum'),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    if (liquor_list[3]['check'] == true)
                                      if (liquor_list[3]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                              .toString()
                                              .toLowerCase()))
                                        GradDrink(liquor_list[3]['id'],
                                            liquor_list[3]['loc'], 'beer'),
                                    if (liquor_list[4]['check'] == true)
                                      if (liquor_list[4]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                              .toString()
                                              .toLowerCase()))
                                        GradDrink(liquor_list[4]['id'],
                                            liquor_list[4]['loc'], 'whiskey'),
                                  ],
                                ),
                              ],
                            );
                          }
                        }
                      }),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.2, top: height * 0.63),
                  child: CarouselSlider.builder(
                    itemCount: 5,
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: <Widget>[
                          Positioned(
                            top: height * 0.06,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(00, 44, 64, 1),
                                  borderRadius: BorderRadius.circular(20)),
                              height: height * 0.15,
                              width: width * 0.65,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Text(
                                        "  " + food_list[index]['id'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: width * 0.1,
                                      ),
                                      FlatButton.icon(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        label: Text(
                                          "5",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: height * 0.02),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: width * 0.04,
                                        ),
                                        Text(
                                          "30-40 mins",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: height * 0.015),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.white,
                                    thickness: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        "Rate",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: height * 0.015),
                                      ),
                                      SizedBox(
                                        width: width * 0.3,
                                      ),
                                      Icon(
                                        Icons.add_shopping_cart,
                                        color: Colors.white,
                                        size: height * 0.015,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                //color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            height: height * 0.30,
                            width: width * 0.8,
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  food_list[index]['loc'],
                                  fit: BoxFit.cover,
                                  height: height * 0.08,
                                  width: width * 0.3,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          CollapsingNavigationDrawer(false),
        ],
      ),
    );
  }
}

class Large extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 8.397,
              height: height,
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
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            Text(
              "Shop Name",
              style: TextStyle(fontSize: 17),
            ),
            Icon(Icons.star, color: Colors.yellow)
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(height: height * 0.9),
                Positioned(
                  left: 70,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Liquor",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(00, 44, 64, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * 0.15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => Filter(liquor_list)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: height * 0.04,
                                width: width * 0.04,
                                child: Image.asset('images/filter.png'),
                              ),
                              Text(
                                'Filter',
                                style: TextStyle(fontSize: height * 0.016),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SearchBar(),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => Cart()));
                        },
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 70,
                  top: 45,
                  child: Text(
                    "Home Delivery Available",
                    style: TextStyle(
                      fontSize: 10,
                      color: Color.fromRGBO(00, 44, 64, 1),
                    ),
                  ),
                ),

                /*  Positioned(
                  top: 80,
                  child: Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    child: GridView(
                        padding: EdgeInsets.only(left: 80, right: 10),
                        children:
                            Meals_list.map((tx) => LiquorItem(tx['id'], tx['loc']))
                                .toList(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                            childAspectRatio: 1,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20)),
                  ),
                ),
                */
                Positioned(
                  top: 60,
                  left: 60,
                  child: StreamBuilder(
                      stream: Firestore.instance
                          .collection("user-activity")
                          .document(phoneNumber)
                          .collection('search')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return CircularProgressIndicator();
                        } else {
                          DocumentSnapshot ds2 = snapshot.data.documents[0];
                          if (ds2['search'] == null) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    if (liquor_list[0]['check'] == true)
                                      GradDrink(liquor_list[0]['id'],
                                          liquor_list[0]['loc'], 'wine'),
                                    if (liquor_list[1]['check'] == true)
                                      GradDrink(liquor_list[1]['id'],
                                          liquor_list[1]['loc'], 'scotch'),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    if (liquor_list[2]['check'] == true)
                                      GradDrink(liquor_list[2]['id'],
                                          liquor_list[2]['loc'], 'rum'),
                                    if (liquor_list[3]['check'] == true)
                                      GradDrink(liquor_list[3]['id'],
                                          liquor_list[3]['loc'], 'beer'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    if (liquor_list[4]['check'] == true)
                                      GradDrink(liquor_list[4]['id'],
                                          liquor_list[4]['loc'], 'whiskey'),
                                  ],
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    if (liquor_list[0]['check'] == true)
                                      if (liquor_list[0]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                              .toString()
                                              .toLowerCase()))
                                        GradDrink(liquor_list[0]['id'],
                                            liquor_list[0]['loc'], 'wine'),
                                    if (liquor_list[1]['check'] == true)
                                      if (liquor_list[1]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                              .toString()
                                              .toLowerCase()))
                                        GradDrink(liquor_list[1]['id'],
                                            liquor_list[1]['loc'], 'scotch'),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    if (liquor_list[2]['check'] == true)
                                      if (liquor_list[2]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                              .toString()
                                              .toLowerCase()))
                                        GradDrink(liquor_list[2]['id'],
                                            liquor_list[2]['loc'], 'rum'),
                                    if (liquor_list[3]['check'] == true)
                                      if (liquor_list[3]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                              .toString()
                                              .toLowerCase()))
                                        GradDrink(liquor_list[3]['id'],
                                            liquor_list[3]['loc'], 'beer'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    if (liquor_list[4]['check'] == true)
                                      if (liquor_list[4]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                              .toString()
                                              .toLowerCase()))
                                        GradDrink(liquor_list[4]['id'],
                                            liquor_list[4]['loc'], 'whiskey'),
                                  ],
                                ),
                              ],
                            );
                          }
                        }
                      }),
                ),
                //Positioned(top: 0, child: ),
                Padding(
                  padding:
                      EdgeInsets.only(top: height * 0.7, left: width * 0.23),
                  child: CarouselSlider.builder(
                    itemCount: 5,
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: <Widget>[
                          Positioned(
                            top: height * 0.05,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(00, 44, 64, 1),
                                  borderRadius: BorderRadius.circular(20)),
                              height: height * 0.15,
                              width: width * 0.65,
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      // SizedBox(
                                      //   //width: width * 0.02,
                                      // ),
                                      Expanded(
                                        child: Text(
                                          "  " + food_list[index]['id'],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                          //width: width * 0.2,
                                          ),
                                      FlatButton.icon(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        label: Text(
                                          "5",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    //alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: width * 0.015,
                                        ),
                                        Text(
                                          "30-40 mins",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.white,
                                    thickness: 2,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          "Rate",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: height * 0.018),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Icon(
                                          Icons.add_shopping_cart,
                                          color: Colors.white,
                                          size: height * 0.018,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                //color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            height: height * 0.15,
                            width: width * 0.8,
                            child: Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    food_list[index]['loc'],
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          CollapsingNavigationDrawer(false),
        ],
      ),
    );
  }
}
