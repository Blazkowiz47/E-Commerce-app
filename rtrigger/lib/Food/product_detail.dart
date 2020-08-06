import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rtrigger/Payment/Payment.dart';
import 'package:rtrigger/Utils/search_bar.dart';
import 'package:rtrigger/main_tabs.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';
import 'package:share/share.dart';
import '../cart.dart';
import '../favourite.dart';
import '../main.dart';

bool fav = false;
double count = 1.0;
final Color _color = Color.fromRGBO(0, 44, 64, 1);

class ProductDetail extends StatefulWidget {
  final String title;
  final String loc;
  final String rate;
  final String detail;

  ProductDetail({this.rate, this.loc, this.title, this.detail});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final int val = 1;

  @override
  Widget build(BuildContext context) {
    void share() {
      final RenderBox box = context.findRenderObject();
      Share.share(
        'check out the product',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
      );
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height<550 ? height * 1.3
            : MediaQuery.of(context).size.height * 1.1,
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
                    bottom: 0.0,
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: width * 0.1),
                        child: Icon(
                          Icons.menu,
                          color: _color,
                          size: height * 0.025,
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: width * 0.1),
                          child: SearchBar()),
                      // SizedBox(width: width*0.25,),

                      Container(
                        padding: EdgeInsets.only(left: width * 0.2),
                        child: IconButton(
                          onPressed: ()  {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => Cart()));
                          },
                          icon: Icon(Icons.add_shopping_cart),
                          color: _color,
                          iconSize: MediaQuery.of(context).size.height * 0.025,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
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
                        'images/rtigger4.png',
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
                                onPressed: ()  {
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
                                icon: Icon(
                                  Icons.share,
                                  size: height * 0.025,
                                ),
                                onPressed: () {
                                  WcFlutterShare.share(
                                      sharePopupTitle: 'Share',
                                      subject: 'This is subject',
                                      text: 'This is text',
                                      mimeType: 'text/plain');
                                },
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
                                      'rating': widget.rate,
                                    });
                                    print('added to favourite');
                                  }

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => Favs()));
                                  if (fav) {
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
                SizedBox(
                  height: height * 0.015,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.01,
                    bottom: height * 0.01,
                    right: width*0.03,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: width * 0.1),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                color: _color,
                                fontSize:
                                    MediaQuery.of(context).size.height / 45),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.15,
                      ),
                      Row(
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
                      Container(
                        padding: EdgeInsets.only(left: width * 0.01),
                        child: Text(
                          "45 Reviews(5)",
                          style: TextStyle(color: Colors.grey, fontSize: height*0.013),
                        ),
                      )
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
                    Text("Rate", //widget.rate,
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
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    "Loremipsum is simply dummy text of the printing and typeseting industry. Lorem ipsum hass been the industrys standart dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambelled it to make a specimen book.it has surivived not.",
                    //widget.detail != null ? widget.detail : 'No information available.',
                    style: TextStyle(fontSize: height * 0.016),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width / 2.74,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => PaymentPage(100.0)));
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
                        onPressed: () async {

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
                        padding: EdgeInsets.all(height * 0.01),
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
                  height: height * 0.07,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: width * 0.02, bottom: height * 0.01),
                  height: MediaQuery.of(context).size.height * 0.32,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      BottomCards(),
                      BottomCards(),
                      BottomCards(),
                      BottomCards(),
                      BottomCards(),
                      BottomCards(),
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

class BottomCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(75)),
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 1.5,
          child: Card(
            color: Colors.white,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.005),
                    child: Image.asset('images/rtigger4.png'),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: height * 0.02),
                    child: Text(
                      'Name',
                      style: TextStyle(color: _color, fontSize: height * 0.02),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.002),
                    child: Text(
                      'Shop Name',
                      style: TextStyle(fontSize: height * 0.018),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.014),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (index) {
                        return index < 3
                            ? Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: MediaQuery.of(context).size.height * 0.02,
                              )
                            : Icon(
                                Icons.star_border,
                                color: Colors.amber,
                                size: MediaQuery.of(context).size.height * 0.02,
                              );
                      }),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () {},
                      child: Text(
                        'Rate',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.015,
                        ),
                      ),
                      textColor: _color,
                      color: Colors.lime[800],
                    ),
                  ),
                ]),
          ),
        ),
        SizedBox(width: width * 0.025),
      ],
    );
  }
}
