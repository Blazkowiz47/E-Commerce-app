import 'package:flutter/material.dart';
import 'package:rtrigger/main.dart';

double total = 0;

class CartItem extends StatefulWidget {
  final String title;
  final String loc;
  final double sum;
  double count;
  CartItem(this.title, this.loc, this.sum, this.count);
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    total += widget.count * widget.sum;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0, left: 60, right: 10),
      child: Card(
        elevation: 15,
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width - 60,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "Rate:" + '${widget.sum}',
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 29,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (widget.count > 1) {
                              widget.count = widget.count - 1;
                              Cart_list.removeWhere(
                                  (e) => e['id'] == widget.title);
                              Cart_list.add({
                                'id': widget.title,
                                'loc': widget.loc,
                                'sum': widget.sum,
                                'count': widget.count,
                              });
                            }
                          });
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text("${widget.count}"),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            {
                              widget.count = widget.count + 1;
                              Cart_list.removeWhere(
                                  (e) => e['id'] == widget.title);
                              Cart_list.add({
                                'id': widget.title,
                                'loc': widget.loc,
                                'sum': widget.sum,
                                'count': widget.count,
                              });

                              total = total + widget.sum;
                            }
                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Total Rate" + "\n${widget.count * widget.sum}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
