import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rtrigger/Payment/Payment.dart';
import 'package:rtrigger/Utils/search_bar.dart';
import '../cart.dart';
import '../favourite.dart';
import '../main.dart';
import 'package:share/share.dart';

import '../main_tabs.dart';

bool fav = false;
double count = 1.0;
final Color _color = Color.fromRGBO(0, 44, 64, 1);

class MenDetail extends StatefulWidget {
  final String title;
  final String loc;
  final String sum;
  final String address;
  final String description;
  MenDetail({this.title, this.loc, this.sum, this.address, this.description});
  @override
  _MenDetailState createState() => _MenDetailState();
}

class _MenDetailState extends State<MenDetail> {
  void share() {
    final RenderBox box = context.findRenderObject();
    Share.share(
      'check out the product',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }

  final int val = 1;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height:  height>700 ? height*1.1 : MediaQuery.of(context).size.height<550 ? height * 1.3
                : MediaQuery.of(context).size.height * 1.2,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'images/1oo.png',
              ),
              fit: BoxFit.fill,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.01,
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding:EdgeInsets.only(left: width*0.1),
                        child: Icon(
                          Icons.menu,
                          color: _color,
                          size: height * 0.025,
                        ),
                      ),
                      Container(padding:EdgeInsets.only(left: width*0.1),child: SearchBar()),
                      Container(
                        padding:EdgeInsets.only(left: width*0.2),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) => Cart()));
                          },
                          icon: Icon(
                            Icons.add_shopping_cart,
                            size: height * 0.025,
                          ),
                          color: _color,
                          iconSize: MediaQuery.of(context).size.height / 45,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height<550 ? MediaQuery.of(context).size.height / 3.3 :
                  MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Image.asset(
                        'images/menhairstyle1.jpg',
                      )),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.01,
                          right: width * 0.01,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * 0.01,
                                bottom: height * 0.01,
                              ),
                              child: IconButton(
                                onPressed: () async {
                                  /*Saloon_item.add({
                                    'id': "Men's Haircut 1",
                                    'price': 500
                                  });

                                 */
                                  await Firestore.instance
                                      .collection("user-activity")
                                      .document(phoneNumber)
                                      .collection("cart")
                                      .document(Timestamp.now().toString())
                                      .setData({
                                    'id': widget.title,
                                    'imgloc': widget.loc,
                                    'rate': widget.sum,
                                  });
                                  print('added to cart');
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (_) => Cart()));
                                },
                                icon: Icon(Icons.add_shopping_cart),
                                iconSize: height * 0.025,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: height * 0.01),
                              child: IconButton(
                                icon: Icon(Icons.share),
                                onPressed: () => share(),
                                iconSize: height * 0.025,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    fav = !fav;
                                  });
                                  fave() async {
                                    await Firestore.instance
                                        .collection("user-activity")
                                        .document(phoneNumber)
                                        .collection("favourites")
                                        .document(Timestamp.now().toString())
                                        .setData({
                                      'id': widget.title,
                                      'imgloc': widget.loc,
                                      'rating': widget.sum,
                                    });
                                    print('added to favourite');
                                  }
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (_) => Favs()));
                                  if(fav){
                                    fave();
                                  }
                                },
                                icon: Icon(fav
                                    ? Icons.favorite
                                    : Icons.favorite_border),
                                iconSize: height * 0.025,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.01,
                    bottom: height * 0.01,
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          width: width*0.2,
                          padding:EdgeInsets.only(left:width*0.1),
                          child: Text(
                           widget.title,
                            style: TextStyle(
                                color: _color,
                                fontSize: MediaQuery.of(context).size.height / 45),
                          ),
                        ),
                      ),
                      Container(
                        padding:EdgeInsets.only(left: width*0.1),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(5, (index) {
                            return index < 3
                                ? Icon(Icons.star,
                                    color: Colors.amber,
                                    size: MediaQuery.of(context).size.height / 36)
                                : Icon(Icons.star_border,
                                    color: Colors.amber,
                                    size:
                                        MediaQuery.of(context).size.height / 36);
                          }),
                        ),
                      ),
                      Container(padding:EdgeInsets.only(left:width*0.07),child:Text("45 Reviews(5)",style:TextStyle(color: Colors.grey)))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '10% OFF',
                      style: TextStyle(
                          color: _color,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height / 45),
                    ),
                    Text("Rate",//widget.sum,
                        style: TextStyle(
                            color: _color,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height / 45)),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (count > 1.0) count = count - 1.0;
                              });
                            },
                            icon: Icon(
                              Icons.remove,
                              size: height * 0.02,
                            ),
                            color: _color,
                            iconSize: MediaQuery.of(context).size.height / 36),
                        Text('$count',
                            style: TextStyle(
                                color: _color,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height / 45)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                count = count + 1.0;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              color: _color,
                              size: height * 0.02,
                            ),
                            iconSize: MediaQuery.of(context).size.height / 36)
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    "Loremipsum is simply dummy text of the printing and typeseting\nindustry. Lorem ipsum hass been the industrys standart dummy text\never since the 1500s, when an unknown printer took a galley of type\nand scrambelled it to make a specimen book.it has surivived not.",//widget.detail != null ? widget.detail : 'No information available.',
//widget.description,
                    style: TextStyle(
                      fontSize: height * 0.018,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width / 2.74,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => PaymentPage(500.0)));
                        },
                        padding: EdgeInsets.all(height * 0.01),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text('Buy Now'),
                        color: _color,
                        textColor: Colors.white,
                      ),
                    ),
                    ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width / 2.74,
                      child: RaisedButton(
                        onPressed: () {
                          Saloon_item.add(
                              {'id': "Men's Haircut 1", 'price': 500});

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => Cart()));
                        },
                        padding: EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text('Add to Cart'),
                        color: _color,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
               SizedBox(
                 height: height>700? 0 : height <550 ? height*0.05 : height*0.16,
               ),
                Container(
                  padding: EdgeInsets.only(
                    left: width * 0.05,
                    bottom: height * 0.005,
                  ),
                  height: MediaQuery.of(context).size.height <550 ? MediaQuery.of(context).size.height/2.7:
                  MediaQuery.of(context).size.height / 3,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        width: width * 0.35,
                        child: Card(
                          color: Colors.white,
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * 0.01,
                              ),
                              child: Image.asset(
                                'images/menhairstyle2.jpg',
                                height: MediaQuery.of(context).size.height / 8,
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.only(top: height*0.02),
                              child: Text(
                                'Momenhairstyle2',
                                style: TextStyle(
                                    color: _color,
                                    fontSize:
                                        MediaQuery.of(context).size.height / 50),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.005),
                              child: Text(
                                'Stylist Name',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            50),
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.only(top: height*0.016),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(5, (index) {
                                  return index < 3
                                      ? Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size:
                                              MediaQuery.of(context).size.height /
                                                  50,
                                        )
                                      : Icon(
                                          Icons.star_border,
                                          color: Colors.amber,
                                          size:
                                              MediaQuery.of(context).size.height /
                                                  50,
                                        );
                                }),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {},
                                child: Text(
                                  'Rate',
                                  style: TextStyle(
                                    fontSize: height*0.015,
                                  ),
                                ),
                                textColor: _color,
                                color: Colors.lime[800],
                              ),
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(width: width*0.05),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        width: width * 0.35,
                        child: Card(
                          color: Colors.white,
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * 0.01,
                              ),
                              child: Image.asset(
                                'images/menhairstyle2.jpg',
                                height: MediaQuery.of(context).size.height / 8,
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.only(top: height*0.02),
                              child: Text(
                                'Momenhairstyle2',
                                style: TextStyle(
                                    color: _color,
                                    fontSize:
                                    MediaQuery.of(context).size.height / 50),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.005),
                              child: Text(
                                'Stylist Name',
                                style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.height /
                                        50),
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.only(top: height*0.016),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(5, (index) {
                                  return index < 3
                                      ? Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size:
                                    MediaQuery.of(context).size.height /
                                        50,
                                  )
                                      : Icon(
                                    Icons.star_border,
                                    color: Colors.amber,
                                    size:
                                    MediaQuery.of(context).size.height /
                                        50,
                                  );
                                }),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {},
                                child: Text(
                                  'Rate',
                                  style: TextStyle(
                                    fontSize: height*0.015,
                                  ),
                                ),
                                textColor: _color,
                                color: Colors.lime[800],
                              ),
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(width: width*0.05),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        width: width * 0.35,
                        child: Card(
                          color: Colors.white,
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * 0.01,
                              ),
                              child: Image.asset(
                                'images/menhairstyle2.jpg',
                                height: MediaQuery.of(context).size.height / 8,
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.only(top: height*0.02),
                              child: Text(
                                'Momenhairstyle2',
                                style: TextStyle(
                                    color: _color,
                                    fontSize:
                                    MediaQuery.of(context).size.height / 50),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.005),
                              child: Text(
                                'Stylist Name',
                                style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.height /
                                        50),
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.only(top: height*0.016),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(5, (index) {
                                  return index < 3
                                      ? Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size:
                                    MediaQuery.of(context).size.height /
                                        50,
                                  )
                                      : Icon(
                                    Icons.star_border,
                                    color: Colors.amber,
                                    size:
                                    MediaQuery.of(context).size.height /
                                        50,
                                  );
                                }),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {},
                                child: Text(
                                  'Rate',
                                  style: TextStyle(
                                    fontSize: height*0.015,
                                  ),
                                ),
                                textColor: _color,
                                color: Colors.lime[800],
                              ),
                            ),
                          ]),
                        ),
                      ),


                      /*Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        width: width * 0.35,
                        child: Card(
                          color: Colors.white,
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * 0.01,
                              ),
                              child: Image.asset(
                                'images/menhairstyle3.jpg',
                                height: MediaQuery.of(context).size.height / 10,
                              ),
                            ),
                            Text(
                              'Menhairstyle3',
                              style: TextStyle(
                                  color: _color,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 60),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.005),
                              child: Text(
                                'Stylist Name',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            70),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(5, (index) {
                                return index < 3
                                    ? Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size:
                                            MediaQuery.of(context).size.height /
                                                50,
                                      )
                                    : Icon(
                                        Icons.star_border,
                                        color: Colors.amber,
                                        size:
                                            MediaQuery.of(context).size.height /
                                                50,
                                      );
                              }),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {},
                                child: Text(
                                  'Rate',
                                  style: TextStyle(
                                    fontSize: height*0.015,
                                  ),
                                ),
                                textColor: _color,
                                color: Colors.lime[800],
                              ),
                            ),
                          ]),
                        ),
                      ),*/
                      // SizedBox(width: 20),
                      // SizedBox(width: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}