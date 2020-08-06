import 'package:flutter/material.dart';

class FoodItem extends StatefulWidget {
  final String title;
  final String loc;
  final double sum;
  final String location;

  FoodItem(this.title, this.loc, this.sum, this.location);

  @override
  _FoodItemState createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 15,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: ClipOval(
                        child: Image.asset(
                      widget.loc,
                      fit: BoxFit.cover,
                      width: 400,
                      height: 400,
                    ))),
              ),
              Column(children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 155,
                  height: 35,
                  child: ListTile(
                    leading: Text(
                      widget.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    trailing: Text(
                      'Home Delivery Available',
                      style: TextStyle(color: Colors.grey, fontSize: 8),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "1 km from your Location",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    Container(width: MediaQuery.of(context).size.width / 5),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          "5",
                          style: TextStyle(
                            color: Color.fromRGBO(00, 44, 64, 1),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
