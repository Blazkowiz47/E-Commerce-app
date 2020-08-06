import 'package:flutter/material.dart';
import './main.dart';
import 'package:share/share.dart';

class NotItem extends StatefulWidget {
  final String title;
  final String loc;
  final double price;
  bool fav;
  NotItem(this.title, this.loc, this.price, this.fav);
  @override
  _NotItemState createState() => _NotItemState();
}

class _NotItemState extends State<NotItem> {
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
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 60),
      child: Card(
        elevation: 15,
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
                  height: 150,
                ),
                Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        "  5",
                        style: TextStyle(fontSize: 21),
                      ),
                      Text("\n")
                    ],
                  ),
                  
                  Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                    Text("\n"),
                  Text('Comming Soon...'),
                  Text("\n"),
                  Text(
                    "Add to Favorites",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            });
                          },
                          icon: Icon(widget.fav
                              ? Icons.favorite
                              : Icons.favorite_border),
                          color: Colors.red,
                        ),
                       
                      ],
                    ),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
