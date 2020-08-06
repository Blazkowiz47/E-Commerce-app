import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../cart.dart';
import '../favourite.dart';
import '../main.dart';
import '../main_tabs.dart';
import 'liquordetails.dart';

class Drink2Item extends StatefulWidget {
  final String title;
  final String loc;
  final String rate;
  final String detail;
  bool fav;

  Drink2Item(this.title, this.loc, this.rate, this.fav, this.detail);

  @override
  _Drink2ItemState createState() => _Drink2ItemState();
}

class _Drink2ItemState extends State<Drink2Item> {
  @override
  Widget build(BuildContext context) {
    void share() {
      final RenderBox box = context.findRenderObject();
      Share.share(
        'check out the product',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 40),
      child: Card(
        elevation: 15,
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => LiquorDetail(rate: widget.rate, title: widget.title, loc: widget.loc, detail: widget.detail,)));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(
                    widget.loc,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height*0.2,
                  ),
                  Column(children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          widget.rate,
                          style: TextStyle(fontSize: 21),
                        ),
                        Text("\n")
                      ],
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("30-40 mins"),
                    Text("\n"),
                    Text(
                      widget.rate,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () => share(),
                            iconSize: 15,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                widget.fav = !widget.fav;
                                fav() async {
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
                                if(widget.fav){
                                  fav();
                                }
                              });
                            },
                            icon: Icon(widget.fav
                                ? Icons.favorite
                                : Icons.favorite_border),
                            color: Colors.red,
                          ),
                          IconButton(
                              iconSize: 20,
                              onPressed: () async {
//                                Cart_list.add({
//                                  'id': widget.title,
//                                  'loc': widget.loc,
//                                  'sum': 1234,
//                                  'count': 1.0
//                                });
//                                await Firestore.instance
//                                    .collection("user-activity")
//                                    .document(phoneNumber)
//                                    .collection("cart")
//                                    .document(Timestamp.now().toString())
//                                    .setData({
//                                  'id': widget.title,
//                                  'imgloc': widget.loc,
//                                  'rate': widget.rate,
//                                });
//                                print('added to cart');
//                                Navigator.of(context).push(
//                                    MaterialPageRoute(builder: (_) => Cart()));

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
                              icon: Icon(Icons.add_shopping_cart))
                        ],
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
