import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rtrigger/Utils/custom_drawer_collapse.dart';
import 'package:rtrigger/Utils/search_bar.dart';
import 'package:rtrigger/cart.dart';
import 'package:rtrigger/filter.dart';
import 'package:rtrigger/main.dart';
import 'package:rtrigger/Food/food_options.dart';
import 'package:file_picker/file_picker.dart';
import "package:image_picker/image_picker.dart";

var Meals_list = [
  {'id': 'Drink Name', 'loc': 'images/ii.png'},
  {'id': 'Sweet Name', 'loc': 'images/uil.png'},
  {'id': 'Dish Name', 'loc': 'images/ute.png'},
  {'id': 'Tablet Name', 'loc': 'images/k.png'},
  {'id': 'Medicine', 'loc': 'images/j.png'},
];

List<String> imageCarouselSlider = [
  "images/1.png",
  "images/2.png",
  "images/3.png",
  "images/4.png",
  "images/5.png"
];

final Color _color = Color.fromRGBO(0, 44, 64, 1);

class Food extends StatefulWidget {
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    Navigator.pop(context);
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }
  getGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }
  getDoc() async {
    _image = await FilePicker.getFile();
  }
  // final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    final button = new PopupMenuButton(
        icon: Icon(
          Icons.attachment,
          size: MediaQuery.of(context).size.height * 0.03,
          color: _color,
        ),
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.image), onPressed: getGallery),
                      Text('Image '),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.file_upload), onPressed: getDoc),
                      Text('Doc '),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.photo_camera), onPressed: getImage),
                      Text('Camera'),
                    ],
                  ),
                ],
              ),
            )
          ];
        },
        onSelected: (_) {});
    return MediaQuery.of(context).size.height > 700
        ? Large(
            button: button,
          )
        : Small(
            button: button,
          );
  }
}

class Small extends StatelessWidget {
  final PopupMenuButton button;

  Small({this.button});

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
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Hotel Name ",
                  style:
                      TextStyle(color: Colors.black, fontSize: height * 0.035),
                ),
                Text(
                  "1 km from your Location",
                  style:
                      TextStyle(fontSize: height * 0.018, color: Colors.black),
                )
              ],
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: height * 0.05,
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          CollapsingNavigationDrawer(false),
          SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.145,
                    right: width * 0.01,
                    bottom: height * 0.01,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "Food",
                                style: TextStyle(
                                    fontSize: height * 0.03,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => Filter(liquor_list)));
                                },
                                child: Row(
                                  children: <Widget>[
//                                        SizedBox(
//                                          width: width * 0.015,
//                                        ),
                                    Container(
                                      height: height * 0.06,
                                      width: width * 0.06,
                                      child: Image.asset(
                                        'images/filter.png',
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Text(
                                        'Filter',
                                        style:
                                            TextStyle(fontSize: height * 0.018),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  SearchBar(),
                                ],
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add_shopping_cart,
                                  size: height * 0.025,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => Cart()));
                                },
                                color: Colors.black,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: height * 0.06,
                  left: width * 0.145,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: StreamBuilder(
                        stream: Firestore.instance
                            .collection("user-activity")
                            .document('9108650970')
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      if (food_list[0]['check'] == true)
                                        GradFood(food_list[0]['id'],
                                            food_list[0]['loc'], "ice_cream"),
                                      if (food_list[1]['check'] == true)
                                        GradFood(food_list[1]['id'],
                                            food_list[1]['loc'], "tea&coffee"),
                                      if (food_list[2]['check'] == true)
                                        GradFood(food_list[2]['id'],
                                            food_list[2]['loc'], "pizza"),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      if (food_list[3]['check'] == true)
                                        GradFood(
                                            food_list[3]['id'],
                                            food_list[3]['loc'],
                                            "fish&chicken"),
                                      if (food_list[4]['check'] == true)
                                        GradFood(food_list[4]['id'],
                                            food_list[10]['loc'], "Meal"),

                                      if (food_list[6]['check'] == true)
                                        GradFood(
                                            food_list[6]['id'],
                                            food_list[6]['loc'],
                                            "shakes&juices"),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      if (food_list[7]['check'] == true)
                                        GradFood(food_list[7]['id'],
                                            food_list[7]['loc'], "soft_drinks"),
                                      if (food_list[8]['check'] == true)
                                        GradFood(
                                            food_list[8]['id'],
                                            food_list[8]['loc'],
                                            "burgers&sandwiches"),
                                      if (food_list[9]['check'] == true)
                                        GradFood(food_list[9]['id'],
                                            food_list[9]['loc'], "sweets"),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      if (food_list[5]['check'] == true)
                                        GradFood(food_list[5]['id'],
                                            food_list[5]['loc'], "breakfast"),
                                      if (food_list[11]['check'] == true)
                                        GradFood(
                                            food_list[11]['id'],
                                            food_list[11]['loc'],
                                            "cakes&pastry"),
                                      if (food_list[12]['check'] == true)
                                        GradFood(food_list[12]['id'],
                                            food_list[12]['loc'], "cookies"),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      if (food_list[13]['check'] == true)
                                        GradFood(food_list[13]['id'],
                                            food_list[13]['loc'], "snacks"),
                                      if (food_list[14]['check'] == true)
                                        GradFood(
                                            food_list[14]['id'],
                                            food_list[14]['loc'],
                                            "fruits&vegetables"),
                                    ],
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      if (food_list[0]['check'] == true)
                                        if (food_list[0]['id']
                                            .toString()
                                            .toLowerCase()
                                            .contains(ds2['search']
                                                .toString()
                                                .toLowerCase()))
                                          GradFood(food_list[0]['id'],
                                              food_list[0]['loc'], "ice_cream"),
                                      if (food_list[1]['check'] == true)
                                        if (food_list[1]['id']
                                            .toString()
                                            .toLowerCase()
                                            .contains(ds2['search']
                                                .toString()
                                                .toLowerCase()))
                                          GradFood(
                                              food_list[1]['id'],
                                              food_list[1]['loc'],
                                              "tea&coffee"),
                                      if (food_list[2]['check'] == true)
                                        if (food_list[2]['id']
                                            .toString()
                                            .toLowerCase()
                                            .contains(ds2['search']
                                                .toString()
                                                .toLowerCase()))
                                          GradFood(food_list[2]['id'],
                                              food_list[2]['loc'], "pizza"),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      if (food_list[3]['check'] == true)
                                        if (food_list[3]['id']
                                            .toString()
                                            .toLowerCase()
                                            .contains(ds2['search']
                                                .toString()
                                                .toLowerCase()))
                                          GradFood(
                                              food_list[3]['id'],
                                              food_list[3]['loc'],
                                              "fish&chicken"),
                                      if (food_list[4]['check'] == true)
                                        if (food_list[4]['id']
                                            .toString()
                                            .toLowerCase()
                                            .contains(ds2['search']
                                                .toString()
                                                .toLowerCase()))
                                          GradFood(food_list[4]['id'],
                                              food_list[10]['loc'], "meal"),
                                      if (food_list[5]['check'] == true)
                                        if (food_list[5]['id']
                                            .toString()
                                            .toLowerCase()
                                            .contains(ds2['search']
                                                .toString()
                                                .toLowerCase()))
                                          GradFood(food_list[5]['id'],
                                              food_list[5]['loc'], "breakfast"),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      if (food_list[6]['check'] == true)
                                        if (food_list[6]['id']
                                            .toString()
                                            .toLowerCase()
                                            .contains(ds2['search']
                                                .toString()
                                                .toLowerCase()))
                                          GradFood(
                                              food_list[6]['id'],
                                              food_list[6]['loc'],
                                              "shakes&juices"),
                                      if (food_list[7]['check'] == true)
                                        if (food_list[7]['id']
                                            .toString()
                                            .toLowerCase()
                                            .contains(ds2['search']
                                                .toString()
                                                .toLowerCase()))
                                          GradFood(
                                              food_list[7]['id'],
                                              food_list[7]['loc'],
                                              "soft_drinks"),
                                      if (food_list[8]['check'] == true)
                                        if (food_list[8]['id']
                                            .toString()
                                            .toLowerCase()
                                            .contains(ds2['search']
                                                .toString()
                                                .toLowerCase()))
                                          GradFood(
                                              food_list[8]['id'],
                                              food_list[8]['loc'],
                                              "burgers&sandwiches"),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      if (food_list[9]['check'] == true)
                                        if (food_list[9]['id']
                                            .toString()
                                            .toLowerCase()
                                            .contains(ds2['search']
                                                .toString()
                                                .toLowerCase()))
                                          GradFood(food_list[9]['id'],
                                              food_list[9]['loc'], "sweets"),

                                      if (food_list[11]['check'] == true)
                                        if (food_list[11]['id']
                                            .toString()
                                            .toLowerCase()
                                            .contains(ds2['search']
                                                .toString()
                                                .toLowerCase()))
                                          GradFood(
                                              food_list[11]['id'],
                                              food_list[11]['loc'],
                                              "cakes&pastry"),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      if (food_list[12]['check'] == true)
                                        if (food_list[12]['id']
                                            .toString()
                                            .toLowerCase()
                                            .contains(ds2['search']
                                                .toString()
                                                .toLowerCase()))
                                          GradFood(food_list[12]['id'],
                                              food_list[12]['loc'], "cookies"),
                                      if (food_list[13]['check'] == true)
                                        if (food_list[13]['id']
                                            .toString()
                                            .toLowerCase()
                                            .contains(ds2['search']
                                                .toString()
                                                .toLowerCase()))
                                          GradFood(food_list[13]['id'],
                                              food_list[13]['loc'], "snacks"),
                                      if (food_list[14]['check'] == true)
                                        if (food_list[14]['id']
                                            .toString()
                                            .toLowerCase()
                                            .contains(ds2['search']
                                                .toString()
                                                .toLowerCase()))
                                          GradFood(
                                              food_list[14]['id'],
                                              food_list[14]['loc'],
                                              "fruits&vegetables"),
                                    ],
                                  ),
                                ],
                              );
                            }
                          }
                        }),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.25, top: height * 0.75),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: height * 0.17,
                      ),
                      CarouselSlider.builder(
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
                                //right: width*0.07,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(00, 44, 64, 1),
                                      borderRadius: BorderRadius.circular(20)),
                                  height: height * 0.15,
                                  width: width * 0.65,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          Text(
                                            "  " + Meals_list[index]['id'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: height * 0.015),
                                          ),
                                          SizedBox(
                                            width: width * 0.26,
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
                                      Meals_list[index]['loc'],
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class Large extends StatelessWidget {
  final PopupMenuButton button;

  Large({this.button});

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
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Hotel Name ",
                  style:
                      TextStyle(color: Colors.black, fontSize: height * 0.027),
                ),
                Text(
                  "1 km from your Location",
                  style:
                      TextStyle(fontSize: height * 0.018, color: Colors.black),
                )
              ],
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: height * 0.04,
            )
          ],
        ),
      ),
//      body: Stack(
//        children: <Widget>[
//          SingleChildScrollView(
//            scrollDirection: Axis.vertical,
//            child: Stack(
//              children: <Widget>[
//                CollapsingNavigationDrawer(false),
//                SingleChildScrollView(
//                  scrollDirection: Axis.vertical,
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      Padding(
//                        padding: EdgeInsets.only(
//                          left: width * 0.145,
//                          right: width * 0.01,
//                          bottom: height * 0.01,
//                        ),
//                        child: Column(
//                          children: <Widget>[
//                            Padding(
//                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                children: <Widget>[
//                                  Column(
//                                    children: <Widget>[
//                                      Text(
//                                        "Food",
//                                        style: TextStyle(
//                                            fontSize: height * 0.034,
//                                            fontWeight: FontWeight.bold),
//                                      ),
//                                    ],
//                                  ),
//                                  Row(
//                                    mainAxisAlignment: MainAxisAlignment.end,
//                                    children: <Widget>[
//                                      GestureDetector(
//                                        onTap: () {
//                                          Navigator.of(context).push(
//                                              MaterialPageRoute(
//                                                  builder: (_) =>
//                                                      Filter(liquor_list)));
//                                        },
//                                        child: Padding(
//                                          padding: EdgeInsets.symmetric(
//                                              horizontal: width * 0.025),
//                                          child: Row(
//                                            children: <Widget>[
//                                              Container(
//                                                height: height * 0.05,
//                                                width: width * 0.05,
//                                                child: Image.asset(
//                                                    'images/filter.png'),
//                                              ),
//                                              Padding(
//                                                padding: const EdgeInsets.symmetric(
//                                                    horizontal: 5.0),
//                                                child: Text(
//                                                  'Filter',
//                                                  style: TextStyle(
//                                                      fontSize: height * 0.024),
//                                                ),
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      ),
//                                      SearchBar(),
//                                      IconButton(
//                                        icon: Icon(
//                                          Icons.add_shopping_cart,
//                                          size: height * 0.04,
//                                        ),
//                                        onPressed: () {
//                                          Navigator.of(context).push(
//                                              MaterialPageRoute(
//                                                  builder: (_) => Cart()));
//                                        },
//                                        color: Colors.black,
//                                      )
//                                    ],
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                      Padding(
//                        padding: EdgeInsets.only(
//                          left: width * 0.145,
//                          right: width * 0.01,
//                          bottom: height * 0.01,
//                        ),
//                        child: Column(
//                          children: <Widget>[
//                            Text(
//                              "Upload the Picture or Document List of what things you want",
//                              style: TextStyle(fontSize: height * 0.016),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//                Positioned(
//                  top: height * 0.14,
//                  left: width * 0.145,
//                  child: StreamBuilder(
//                      stream: Firestore.instance
//                          .collection("user-activity")
//                          .document('9108650970')
//                          .collection('search')
//                          .snapshots(),
//                      builder: (context, snapshot) {
//                        if (snapshot.data == null) {
//                          return CircularProgressIndicator();
//                        } else {
//                          DocumentSnapshot ds2 = snapshot.data.documents[0];
//                          if (ds2['search'] == null) {
//                            if (MediaQuery.of(context).size.height < 700)
//                              return Column(
//                                children: <Widget>[
//                                  Row(
//                                    mainAxisAlignment: MainAxisAlignment.center,
//                                    children: <Widget>[
//                                      if (food_list[0]['check'] == true)
//                                        GradFood(food_list[0]['id'],
//                                            food_list[0]['loc'], "ice_cream"),
//                                      if (food_list[1]['check'] == true)
//                                        GradFood(food_list[1]['id'],
//                                            food_list[1]['loc'], "tea&coffee"),
//                                      if (food_list[2]['check'] == true)
//                                        GradFood(food_list[2]['id'],
//                                            food_list[2]['loc'], "pizza"),
//                                      if (food_list[3]['check'] == true)
//                                        GradFood(food_list[3]['id'],
//                                            food_list[3]['loc'], "fish&chicken"),
//                                    ],
//                                  ),
//                                  Row(
//                                    children: <Widget>[
//                                      if (food_list[4]['check'] == true)
//                                        GradFood(food_list[4]['id'],
//                                            food_list[4]['loc'], "meal"),
//                                      if (food_list[5]['check'] == true)
//                                        GradFood(food_list[5]['id'],
//                                            food_list[5]['loc'], "breakfast"),
//                                      if (food_list[6]['check'] == true)
//                                        GradFood(food_list[6]['id'],
//                                            food_list[6]['loc'], "shakes&juices"),
//                                      if (food_list[7]['check'] == true)
//                                        GradFood(food_list[7]['id'],
//                                            food_list[7]['loc'], "soft_drinks"),
//                                    ],
//                                  ),
//                                  Row(
//                                    children: <Widget>[
//                                      if (food_list[8]['check'] == true)
//                                        GradFood(
//                                            food_list[8]['id'],
//                                            food_list[8]['loc'],
//                                            "burgers&sandwiches"),
//                                      if (food_list[9]['check'] == true)
//                                        GradFood(food_list[9]['id'],
//                                            food_list[9]['loc'], "sweets"),
//                                      if (food_list[10]['check'] == true)
//                                        GradFood(food_list[10]['id'],
//                                            food_list[10]['loc'], "dinner"),
//                                      if (food_list[11]['check'] == true)
//                                        GradFood(food_list[11]['id'],
//                                            food_list[11]['loc'], "cakes&pastry"),
//                                    ],
//                                  ),
//                                  Row(
//                                    children: <Widget>[
//                                      if (food_list[12]['check'] == true)
//                                        GradFood(food_list[12]['id'],
//                                            food_list[12]['loc'], "cookies"),
//                                      if (food_list[13]['check'] == true)
//                                        GradFood(food_list[13]['id'],
//                                            food_list[13]['loc'], "snacks"),
//                                      if (food_list[14]['check'] == true)
//                                        GradFood(
//                                            food_list[14]['id'],
//                                            food_list[14]['loc'],
//                                            "fruits&vegetables"),
//                                    ],
//                                  ),
//                                ],
//                              );
//                            else {
//                              return Column(
//                                children: <Widget>[
//                                  Row(
//                                    mainAxisAlignment: MainAxisAlignment.center,
//                                    children: <Widget>[
//                                      if (food_list[0]['check'] == true)
//                                        GradFood(food_list[0]['id'],
//                                            food_list[0]['loc'], "ice_cream"),
//                                      if (food_list[1]['check'] == true)
//                                        GradFood(food_list[1]['id'],
//                                            food_list[1]['loc'], "tea&coffee"),
//                                      if (food_list[2]['check'] == true)
//                                        GradFood(food_list[2]['id'],
//                                            food_list[2]['loc'], "pizza"),
//                                    ],
//                                  ),
//                                  Row(
//                                    children: <Widget>[
//                                      if (food_list[3]['check'] == true)
//                                        GradFood(food_list[3]['id'],
//                                            food_list[3]['loc'], "fish&chicken"),
//                                      if (food_list[4]['check'] == true)
//                                        GradFood(food_list[4]['id'],
//                                            food_list[4]['loc'], "meal"),
//                                      if (food_list[5]['check'] == true)
//                                        GradFood(food_list[5]['id'],
//                                            food_list[5]['loc'], "breakfast"),
//                                    ],
//                                  ),
//                                  Row(
//                                    children: <Widget>[
//                                      if (food_list[6]['check'] == true)
//                                        GradFood(food_list[6]['id'],
//                                            food_list[6]['loc'], "shakes&juices"),
//                                      if (food_list[7]['check'] == true)
//                                        GradFood(food_list[7]['id'],
//                                            food_list[7]['loc'], "soft_drinks"),
//                                      if (food_list[8]['check'] == true)
//                                        GradFood(
//                                            food_list[8]['id'],
//                                            food_list[8]['loc'],
//                                            "burgers&sandwiches"),
//                                    ],
//                                  ),
//                                  Row(
//                                    children: <Widget>[
//                                      if (food_list[9]['check'] == true)
//                                        GradFood(food_list[9]['id'],
//                                            food_list[9]['loc'], "sweets"),
//                                      if (food_list[10]['check'] == true)
//                                        GradFood(food_list[10]['id'],
//                                            food_list[10]['loc'], "dinner"),
//                                      if (food_list[11]['check'] == true)
//                                        GradFood(food_list[11]['id'],
//                                            food_list[11]['loc'], "cakes&pastry"),
//                                    ],
//                                  ),
//                                  Row(
//                                    children: <Widget>[
//                                      if (food_list[12]['check'] == true)
//                                        GradFood(food_list[12]['id'],
//                                            food_list[12]['loc'], "cookies"),
//                                      if (food_list[13]['check'] == true)
//                                        GradFood(food_list[13]['id'],
//                                            food_list[13]['loc'], "snacks"),
//                                      if (food_list[14]['check'] == true)
//                                        GradFood(
//                                            food_list[14]['id'],
//                                            food_list[14]['loc'],
//                                            "fruits&vegetables"),
//                                    ],
//                                  ),
//                                ],
//                              );
//                            }
//                          } else {
//                            return Column(
//                              children: <Widget>[
//                                Row(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
//                                    if (food_list[0]['check'] == true)
//                                      if (food_list[0]['id']
//                                          .toString()
//                                          .toLowerCase()
//                                          .contains(ds2['search']
//                                              .toString()
//                                              .toLowerCase()))
//                                        GradFood(food_list[0]['id'],
//                                            food_list[0]['loc'], "ice_cream"),
//                                    if (food_list[1]['check'] == true)
//                                      if (food_list[1]['id']
//                                          .toString()
//                                          .toLowerCase()
//                                          .contains(ds2['search']
//                                              .toString()
//                                              .toLowerCase()))
//                                        GradFood(food_list[1]['id'],
//                                            food_list[1]['loc'], "tea&coffee"),
//                                    if (food_list[2]['check'] == true)
//                                      if (food_list[2]['id']
//                                          .toString()
//                                          .toLowerCase()
//                                          .contains(ds2['search']
//                                              .toString()
//                                              .toLowerCase()))
//                                        GradFood(food_list[2]['id'],
//                                            food_list[2]['loc'], "pizza"),
//                                  ],
//                                ),
//                                Row(
//                                  children: <Widget>[
//                                    if (food_list[3]['check'] == true)
//                                      if (food_list[3]['id']
//                                          .toString()
//                                          .toLowerCase()
//                                          .contains(ds2['search']
//                                              .toString()
//                                              .toLowerCase()))
//                                        GradFood(food_list[3]['id'],
//                                            food_list[3]['loc'], "fish&chicken"),
//                                    if (food_list[4]['check'] == true)
//                                      if (food_list[4]['id']
//                                          .toString()
//                                          .toLowerCase()
//                                          .contains(ds2['search']
//                                              .toString()
//                                              .toLowerCase()))
//                                        GradFood(food_list[4]['id'],
//                                            food_list[4]['loc'], "meal"),
//                                    if (food_list[5]['check'] == true)
//                                      if (food_list[5]['id']
//                                          .toString()
//                                          .toLowerCase()
//                                          .contains(ds2['search']
//                                              .toString()
//                                              .toLowerCase()))
//                                        GradFood(food_list[5]['id'],
//                                            food_list[5]['loc'], "breakfast"),
//                                  ],
//                                ),
//                                Row(
//                                  children: <Widget>[
//                                    if (food_list[6]['check'] == true)
//                                      if (food_list[6]['id']
//                                          .toString()
//                                          .toLowerCase()
//                                          .contains(ds2['search']
//                                              .toString()
//                                              .toLowerCase()))
//                                        GradFood(food_list[6]['id'],
//                                            food_list[6]['loc'], "shakes&juices"),
//                                    if (food_list[7]['check'] == true)
//                                      if (food_list[7]['id']
//                                          .toString()
//                                          .toLowerCase()
//                                          .contains(ds2['search']
//                                              .toString()
//                                              .toLowerCase()))
//                                        GradFood(food_list[7]['id'],
//                                            food_list[7]['loc'], "soft_drinks"),
//                                    if (food_list[8]['check'] == true)
//                                      if (food_list[8]['id']
//                                          .toString()
//                                          .toLowerCase()
//                                          .contains(ds2['search']
//                                              .toString()
//                                              .toLowerCase()))
//                                        GradFood(
//                                            food_list[8]['id'],
//                                            food_list[8]['loc'],
//                                            "burgers&sandwiches"),
//                                  ],
//                                ),
//                                Row(
//                                  children: <Widget>[
//                                    if (food_list[9]['check'] == true)
//                                      if (food_list[9]['id']
//                                          .toString()
//                                          .toLowerCase()
//                                          .contains(ds2['search']
//                                              .toString()
//                                              .toLowerCase()))
//                                        GradFood(food_list[9]['id'],
//                                            food_list[9]['loc'], "sweets"),
//                                    if (food_list[10]['check'] == true)
//                                      if (food_list[10]['id']
//                                          .toString()
//                                          .toLowerCase()
//                                          .contains(ds2['search']
//                                              .toString()
//                                              .toLowerCase()))
//                                        GradFood(food_list[10]['id'],
//                                            food_list[10]['loc'], "dinner"),
//                                    if (food_list[11]['check'] == true)
//                                      if (food_list[11]['id']
//                                          .toString()
//                                          .toLowerCase()
//                                          .contains(ds2['search']
//                                              .toString()
//                                              .toLowerCase()))
//                                        GradFood(food_list[11]['id'],
//                                            food_list[11]['loc'], "cakes&pastry"),
//                                  ],
//                                ),
//                                Row(
//                                  children: <Widget>[
//                                    if (food_list[12]['check'] == true)
//                                      if (food_list[12]['id']
//                                          .toString()
//                                          .toLowerCase()
//                                          .contains(ds2['search']
//                                              .toString()
//                                              .toLowerCase()))
//                                        GradFood(food_list[12]['id'],
//                                            food_list[12]['loc'], "cookies"),
//                                    if (food_list[13]['check'] == true)
//                                      if (food_list[13]['id']
//                                          .toString()
//                                          .toLowerCase()
//                                          .contains(ds2['search']
//                                              .toString()
//                                              .toLowerCase()))
//                                        GradFood(food_list[13]['id'],
//                                            food_list[13]['loc'], "snacks"),
//                                    if (food_list[14]['check'] == true)
//                                      if (food_list[14]['id']
//                                          .toString()
//                                          .toLowerCase()
//                                          .contains(ds2['search']
//                                              .toString()
//                                              .toLowerCase()))
//                                        GradFood(
//                                            food_list[14]['id'],
//                                            food_list[14]['loc'],
//                                            "fruits&vegetables"),
//                                  ],
//                                ),
//                              ],
//                            );
//                          }
//                        }
//                      }),
//                ),
//                Positioned(
//                  top: height * 0.78,
//                  right: width * 0.1,
//                  left: width * 0.2,
//                  child: CarouselSlider.builder(
//                    itemCount: 5,
//                    options: CarouselOptions(
//                      viewportFraction: 1,
//                      autoPlay: true,
//                      enlargeCenterPage: true,
//                    ),
//                    itemBuilder: (context, index) {
//                      return Stack(
//                        children: <Widget>[
//                          Positioned(
//                            top: height * 0.03,
//                            child: Container(
//                              padding:
//                                  EdgeInsets.symmetric(horizontal: width * 0.039),
//                              decoration: BoxDecoration(
//                                  color: Color.fromRGBO(00, 44, 64, 1),
//                                  borderRadius: BorderRadius.circular(20)),
//                              height: height * 0.155,
//                              width: width * 0.7,
//                              child: SingleChildScrollView(
//                                child: Column(
//                                  children: <Widget>[
//                                    SizedBox(
//                                      height: height * 0.04,
//                                    ),
//                                    Padding(
//                                      padding: const EdgeInsets.symmetric(
//                                          horizontal: 8.0),
//                                      child: Row(
//                                        mainAxisAlignment: MainAxisAlignment.start,
//                                        children: <Widget>[
//                                          SizedBox(
//                                            width: width * 0.02,
//                                          ),
//                                          Text(
//                                            " " + Meals_list[index]['id'],
//                                            style: TextStyle(
//                                                color: Colors.white,
//                                                fontSize: height * 0.02),
//                                          ),
//                                          SizedBox(
//                                            width: width * 0.1,
//                                          ),
//                                          FlatButton.icon(
//                                            onPressed: () {},
//                                            icon: Icon(
//                                              Icons.star,
//                                              color: Colors.yellow,
//                                              size: height * 0.02,
//                                            ),
//                                            label: Text(
//                                              "5",
//                                              style: TextStyle(
//                                                  color: Colors.white,
//                                                  fontSize: height * 0.015),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                    Align(
//                                      alignment: Alignment.centerLeft,
//                                      child: Row(
//                                        children: <Widget>[
//                                          SizedBox(
//                                            width: width * 0.04,
//                                          ),
//                                          Text(
//                                            "30-40 mins",
//                                            style: TextStyle(color: Colors.white),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                    Divider(color: Colors.white, thickness: 0.8),
//                                    Row(
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.spaceEvenly,
//                                      children: <Widget>[
//                                        Text(
//                                          "Rate",
//                                          style: TextStyle(
//                                              color: Colors.white,
//                                              fontSize: height * 0.015),
//                                        ),
//                                        SizedBox(width: width * 0.3),
//                                        Icon(
//                                          Icons.add_shopping_cart,
//                                          color: Colors.white,
//                                          size: height * 0.015,
//                                        )
//                                      ],
//                                    )
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Container(
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(50)),
//                            height: height * 0.40,
//                            width: width * 0.8,
//                            child: Column(
//                              children: <Widget>[
//                                Image.asset(
//                                  Meals_list[index]['loc'],
//                                  fit: BoxFit.cover,
//                                  height: height * 0.08,
//                                  width: width * 0.3,
//                                ),
//                              ],
//                            ),
//                          ),
//                        ],
//                      );
//                    },
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
    body: Stack(
      children: <Widget>[
        CollapsingNavigationDrawer(false),
        SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.145,
                  right: width * 0.01,
                  bottom: height * 0.01,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              "Food",
                              style: TextStyle(
                                  fontSize: height * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => Filter(liquor_list)));
                              },
                              child: Row(
                                children: <Widget>[
//                                        SizedBox(
//                                          width: width * 0.015,
//                                        ),
                                  Container(
                                    height: height * 0.06,
                                    width: width * 0.06,
                                    child: Image.asset(
                                      'images/filter.png',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Text(
                                      'Filter',
                                      style:
                                      TextStyle(fontSize: height * 0.018),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                SearchBar(),
                              ],
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.add_shopping_cart,
                                size: height * 0.025,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => Cart()));
                              },
                              color: Colors.black,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: height * 0.06,
                left: width * 0.145,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: StreamBuilder(
                      stream: Firestore.instance
                          .collection("user-activity")
                          .document('9108650970')
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    if (food_list[0]['check'] == true)
                                      GradFood(food_list[0]['id'],
                                          food_list[0]['loc'], "ice_cream"),
                                    if (food_list[1]['check'] == true)
                                      GradFood(food_list[1]['id'],
                                          food_list[1]['loc'], "tea&coffee"),
                                    if (food_list[2]['check'] == true)
                                      GradFood(food_list[2]['id'],
                                          food_list[2]['loc'], "pizza"),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    if (food_list[3]['check'] == true)
                                      GradFood(
                                          food_list[3]['id'],
                                          food_list[3]['loc'],
                                          "fish&chicken"),
                                    if (food_list[4]['check'] == true)
                                      GradFood(food_list[4]['id'],
                                          food_list[10]['loc'], "Meal"),

                                    if (food_list[6]['check'] == true)
                                      GradFood(
                                          food_list[6]['id'],
                                          food_list[6]['loc'],
                                          "shakes&juices"),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    if (food_list[7]['check'] == true)
                                      GradFood(food_list[7]['id'],
                                          food_list[7]['loc'], "soft_drinks"),
                                    if (food_list[8]['check'] == true)
                                      GradFood(
                                          food_list[8]['id'],
                                          food_list[8]['loc'],
                                          "burgers&sandwiches"),
                                    if (food_list[9]['check'] == true)
                                      GradFood(food_list[9]['id'],
                                          food_list[9]['loc'], "sweets"),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    if (food_list[5]['check'] == true)
                                      GradFood(food_list[5]['id'],
                                          food_list[5]['loc'], "breakfast"),
                                    if (food_list[11]['check'] == true)
                                      GradFood(
                                          food_list[11]['id'],
                                          food_list[11]['loc'],
                                          "cakes&pastry"),
                                    if (food_list[12]['check'] == true)
                                      GradFood(food_list[12]['id'],
                                          food_list[12]['loc'], "cookies"),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    if (food_list[13]['check'] == true)
                                      GradFood(food_list[13]['id'],
                                          food_list[13]['loc'], "snacks"),
                                    if (food_list[14]['check'] == true)
                                      GradFood(
                                          food_list[14]['id'],
                                          food_list[14]['loc'],
                                          "fruits&vegetables"),
                                  ],
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    if (food_list[0]['check'] == true)
                                      if (food_list[0]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                          .toString()
                                          .toLowerCase()))
                                        GradFood(food_list[0]['id'],
                                            food_list[0]['loc'], "ice_cream"),
                                    if (food_list[1]['check'] == true)
                                      if (food_list[1]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                          .toString()
                                          .toLowerCase()))
                                        GradFood(
                                            food_list[1]['id'],
                                            food_list[1]['loc'],
                                            "tea&coffee"),
                                    if (food_list[2]['check'] == true)
                                      if (food_list[2]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                          .toString()
                                          .toLowerCase()))
                                        GradFood(food_list[2]['id'],
                                            food_list[2]['loc'], "pizza"),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    if (food_list[3]['check'] == true)
                                      if (food_list[3]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                          .toString()
                                          .toLowerCase()))
                                        GradFood(
                                            food_list[3]['id'],
                                            food_list[3]['loc'],
                                            "fish&chicken"),
                                    if (food_list[4]['check'] == true)
                                      if (food_list[4]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                          .toString()
                                          .toLowerCase()))
                                        GradFood(food_list[4]['id'],
                                            food_list[10]['loc'], "meal"),
                                    if (food_list[5]['check'] == true)
                                      if (food_list[5]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                          .toString()
                                          .toLowerCase()))
                                        GradFood(food_list[5]['id'],
                                            food_list[5]['loc'], "breakfast"),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    if (food_list[6]['check'] == true)
                                      if (food_list[6]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                          .toString()
                                          .toLowerCase()))
                                        GradFood(
                                            food_list[6]['id'],
                                            food_list[6]['loc'],
                                            "shakes&juices"),
                                    if (food_list[7]['check'] == true)
                                      if (food_list[7]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                          .toString()
                                          .toLowerCase()))
                                        GradFood(
                                            food_list[7]['id'],
                                            food_list[7]['loc'],
                                            "soft_drinks"),
                                    if (food_list[8]['check'] == true)
                                      if (food_list[8]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                          .toString()
                                          .toLowerCase()))
                                        GradFood(
                                            food_list[8]['id'],
                                            food_list[8]['loc'],
                                            "burgers&sandwiches"),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    if (food_list[9]['check'] == true)
                                      if (food_list[9]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                          .toString()
                                          .toLowerCase()))
                                        GradFood(food_list[9]['id'],
                                            food_list[9]['loc'], "sweets"),

                                    if (food_list[11]['check'] == true)
                                      if (food_list[11]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                          .toString()
                                          .toLowerCase()))
                                        GradFood(
                                            food_list[11]['id'],
                                            food_list[11]['loc'],
                                            "cakes&pastry"),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    if (food_list[12]['check'] == true)
                                      if (food_list[12]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                          .toString()
                                          .toLowerCase()))
                                        GradFood(food_list[12]['id'],
                                            food_list[12]['loc'], "cookies"),
                                    if (food_list[13]['check'] == true)
                                      if (food_list[13]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                          .toString()
                                          .toLowerCase()))
                                        GradFood(food_list[13]['id'],
                                            food_list[13]['loc'], "snacks"),
                                    if (food_list[14]['check'] == true)
                                      if (food_list[14]['id']
                                          .toString()
                                          .toLowerCase()
                                          .contains(ds2['search']
                                          .toString()
                                          .toLowerCase()))
                                        GradFood(
                                            food_list[14]['id'],
                                            food_list[14]['loc'],
                                            "fruits&vegetables"),
                                  ],
                                ),
                              ],
                            );
                          }
                        }
                      }),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(left: width * 0.22, top: height * 0.7),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: height * 0.09,
                    ),
                    CarouselSlider.builder(
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
                              //right: width*0.07,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(00, 44, 64, 1),
                                    borderRadius: BorderRadius.circular(20)),
                                height: height * 0.15,
                                width: width * 0.68,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Text(
                                          "  " + Meals_list[index]['id'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: height * 0.015),
                                        ),
                                        SizedBox(
                                          width: width * 0.26,
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
                              height: height * 0.28,
                              width: width * 0.75,
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    Meals_list[index]['loc'],
                                    fit: BoxFit.cover,
                                    height: height * 0.08,
                                    width: width * 0.25,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}
