import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rtrigger/Utils/search_bar.dart';

final Color _color = Color.fromRGBO(0, 44, 64, 1);

class HotelDetail extends StatefulWidget {
  @override
  _HotelDetailState createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
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

  Widget detailCard(String im, String title) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.white70,
      elevation: 10,
      child: Column(
        children: [
          Image.asset(im),
          Text(title),
        ],
      ),
    );
  }

  Widget horizontalCard({String dish, String time, String rate, String image}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        color: _color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          child: Center(
            child: Column(children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(image),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          dish,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text('5',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17))
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, top: 10),
                      child: Text(
                        '$time min',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          rate,
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final button = new PopupMenuButton(
        icon: Icon(
          Icons.attachment,
          color: _color,
          size: 22,
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 65, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Hotel Name  ',
                      style: TextStyle(
                          color: _color,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 30,
                    )
                  ],
                ),
                Text(
                  '1km from your location',
                  style: TextStyle(color: _color),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Food',
                        style: TextStyle(
                            color: _color,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      SearchBar(),
                      Icon(
                        Icons.add_shopping_cart,
                        color: _color,
                        size: 25,
                      )
                    ],
                  ),
                ),
                Text(
                  'Home Delivery Available',
                  style: TextStyle(color: _color, fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Upload the picture or document list what are the things you want',
                    style: TextStyle(color: _color),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(0.0),
                    width: 140,
                    decoration: ShapeDecoration(
                      color: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Upload',
                          style: TextStyle(color: _color, fontSize: 20),
                        ),
                        button,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    children: [
                      detailCard('assets/images/i1.png', 'Icecream'),
                      detailCard('assets/images/i1.png', 'Icecream'),
                      detailCard('assets/images/i1.png', 'Icecream'),
                      detailCard('assets/images/i1.png', 'Icecream'),
                      detailCard('assets/images/i1.png', 'Icecream'),
                      detailCard('assets/images/i1.png', 'Icecream'),
                      detailCard('assets/images/i1.png', 'Icecream'),
                      detailCard('assets/images/i1.png', 'Icecream'),
                      detailCard('assets/images/i1.png', 'Icecream'),
                      detailCard('assets/images/i1.png', 'Icecream'),
                      detailCard('assets/images/i1.png', 'Icecream'),
                      detailCard('assets/images/i1.png', 'Icecream'),
                      detailCard('assets/images/i1.png', 'Icecream'),
                      detailCard('assets/images/i1.png', 'Icecream'),
                      detailCard('assets/images/i1.png', 'Icecream'),
                    ],
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        horizontalCard(
                          dish: 'Dish Name',
                          rate: 'Rate',
                          time: '30-40',
                          image: 'assets/images/rtigger4.png',
                        ),
                        horizontalCard(
                          dish: 'Dish Name',
                          rate: 'Rate',
                          time: '30-40',
                          image: 'assets/images/rtigger4.png',
                        ),
                        horizontalCard(
                          dish: 'Dish Name',
                          rate: 'Rate',
                          time: '30-40',
                          image: 'assets/images/rtigger4.png',
                        ),
                        horizontalCard(
                          dish: 'Dish Name',
                          rate: 'Rate',
                          time: '30-40',
                          image: 'assets/images/rtigger4.png',
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
