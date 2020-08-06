import 'package:flutter/material.dart';
import 'package:rtrigger/Payment/Payment.dart';
import 'package:rtrigger/Utils/search_bar.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';
import '../cart.dart';
import '../favourite.dart';
import '../main.dart';
import '../main_tabs.dart';
import 'liquorlistcard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


bool fav = false;
double count = 1.0;
final Color _color = Color.fromRGBO(0, 44, 64, 1);

class LiquorDetail extends StatefulWidget {

  final title;
  final detail;
  final loc;
  final rate;

  LiquorDetail({this.detail,this.loc,this.title,this.rate});

  @override
  _LiquorDetailState createState() => _LiquorDetailState();
}

class _LiquorDetailState extends State<LiquorDetail> {
  final int val = 1;
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: y>700? y*1.1 : MediaQuery.of(context).size.height<550 ? y * 1.4
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
                  padding: EdgeInsets.only(top: y * 0.02),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding:EdgeInsets.only(left: x*0.1),
                        child: Icon(
                          Icons.menu,
                          color: _color,
                          size: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                      Container( padding:EdgeInsets.only(left: x*0.1),child: SearchBar()),
                      Container(
                        padding: EdgeInsets.only(left: x*0.2),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) => Cart()));
                          },
                          icon: Icon(Icons.add_shopping_cart),
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
                  width: x,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Image.asset(
                        'images/whiskeyd.jpg',
                      )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: x * 0.0203),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: y * 0.01, bottom: y * 0.0),
                              child: IconButton(
                                onPressed: () async {
                                  /*          Cart_list.add({
                                    'id': "Scotch Name",
                                    'loc': 'images/rtigger4.png',
                                    'sum': 500,
                                    'count': count,
                                  });*/
                                  await Firestore.instance
                                      .collection("user-activity")
                                      .document(phoneNumber)
                                      .collection("cart")
                                      .document(Timestamp.now().toString())
                                      .setData({
                                    'id': widget.title,
                                    'imgloc': widget.loc,
                                    'rate': widget.rate,
                                  });
                                  print('added to cart');
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (_) => Cart()));
                                },
                                icon: Icon(Icons.add_shopping_cart),
                                iconSize:
                                    MediaQuery.of(context).size.height * 0.023,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: y * 0.0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.share,
                                  size: MediaQuery.of(context).size.height*0.023,
                                ),
                                onPressed: (){WcFlutterShare.share(
                                    sharePopupTitle: 'Share',
                                    subject: 'This is subject',
                                    text: 'This is text',
                                    mimeType: 'text/plain');},
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(bottom: 0),
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
                                      'rating': widget.rate,
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
                                iconSize: MediaQuery.of(context).size.height*0.023,
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
                  padding: EdgeInsets.symmetric(horizontal: x * 0.0203,vertical: y*0.02),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          padding:EdgeInsets.only(left: x*0.1),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                color: _color,
                                fontSize: MediaQuery.of(context).size.height / 45),
                          ),
                        ),
                      ),
                      Container(padding: EdgeInsets.only(left: x*0.12),
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
                      Container(padding: EdgeInsets.only(left: x*0.054),child: Text("45 Reviews(5)",style:TextStyle(color: Colors.grey),),)
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
                    Text("Rate",//widget.rate,
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
                            icon: Icon(Icons.remove),
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
                            ),
                            iconSize: MediaQuery.of(context).size.height / 36)
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: y*0.007),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text("Loremipsum is simply dummy text of the printing and typeseting industry. Lorem ipsum hass been the industrys standart dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambelled it to make a specimen book.it has surivived not."
                    ,
                    style: TextStyle(
                      fontSize: y*0.015,
                    ),//widget.detail != null ? widget.detail : 'No information available.',

                  //widget.detail
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
                              builder: (_) => PaymentPage(355.45 * count)));
                        },
                        padding: EdgeInsets.all(8.0),
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
                        onPressed: () async {
//                          await Firestore.instance
//                              .collection("user-activity")
//                              .document(phoneNumber)
//                              .collection("cart")
//                              .document(Timestamp.now().toString())
//                              .setData({
//                            'id': widget.title,
//                            'imgloc': widget.loc,
//                            'rate': widget.rate,
//                          });
//                          Cart_list.add({
//                            'id': widget.title,
//                            'loc': widget.loc,
//                            'sum': 355.45,
//                            'count': count,
//                          });
//                          Navigator.of(context)
//                              .push(MaterialPageRoute(builder: (_) => Cart()));

                          bool existing = false;
                          int index;
                          print('Test1 complete');
                          try{
                            Cart_list = [];
                            await Firestore.instance
                                .collection("user-activity")
                                .document(phoneNumber)
                                .collection("cart")
                                .getDocuments()
                                .then((snapshot) {
                              snapshot.documents.forEach((element) {
                                Cart_list.add(element.data);
                                if(element.data["id"] == widget.title){
                                  print(element.documentID);
                                  index = int.parse(element.documentID);
                                  existing = true;
                                  print(element.documentID);
                                }
                              });

                            });
                          }catch(w){
                            print(w);
                          }
                          print('Test2 complete');
                          print(index);
                          print(existing);
                          if(existing == false){
                            Cart_list.add({
                              'id': widget.title,
                              'imgloc': widget.loc,
                              'rate': widget.rate,
                              'count': 1,
                            });
                          }
                          print(Cart_list);
                          DocumentSnapshot ds = await  Firestore.instance
                              .collection("user-activity")
                              .document(phoneNumber)
                              .collection("total")
                              .document("total")
                              .get().then((value) {
                            if (value == null){
                              return null;
                            }
                            else
                              return value;
                          });
                          grandTotal = ds == null ?  0.0 : ds['total'] ;
                          print('0-------------------------------------');
                          if(existing == true){
                            Cart_list[index]["count"]++ ;
                            Firestore.instance
                                .collection("user-activity")
                                .document(phoneNumber)
                                .collection("cart")
                                .document("$index")
                                .updateData({
                              'count' : Cart_list[index]['count'],
                            });
                          }
                          else{
                            await Firestore.instance
                                .collection("user-activity")
                                .document(phoneNumber)
                                .collection("cart")
                                .document("${Cart_list.length-1}")
                                .setData({
                              'timestamp' :Timestamp.now().toString(),
                              'id': widget.title,
                              'imgloc': widget.loc,
                              'rate': widget.rate,
                              'count' : 1,
                            });
                          }
                          print('added to cart');
                          grandTotal = 0.0;
                          for (int i = 0 ; i < Cart_list.length ; i++){
                            grandTotal = grandTotal + double.parse(Cart_list[i]['rate'])*Cart_list[i]['count'];
                          }
                          await Firestore.instance
                              .collection("user-activity")
                              .document(phoneNumber)
                              .collection("total")
                              .document("total")
                              .updateData({
                            'total' : grandTotal,
                          });
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => Cart()));
                        },
                        padding: EdgeInsets.symmetric(vertical: y * 0.0108, horizontal: x * 0.0203),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text('Add to Cart'),
                        color: _color,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: y * 0.02),
                Container(
                  padding: EdgeInsets.only(left: x * 0.05, bottom: y * 0.002),
                  height: y * 0.34,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      liquorlistcard(image: 'images/whined.jpg', label: 'Whine'),
                      SizedBox(width: x * 0.04),
                      liquorlistcard(image: 'images/scotchsd.jpg', label: 'Scotch'),
                      SizedBox(width: x * 0.04),
                      liquorlistcard(image: 'images/beerd.jpg', label: 'Beer'),
                      SizedBox(width: x * 0.04),
                      liquorlistcard(image: 'images/whiskeyd.jpg', label: 'Whiskey'),
                      SizedBox(width: x * 0.03),
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
