
import 'package:flutter/material.dart';

final Color _color = Color.fromRGBO(0, 44, 64, 1);
class liquorlistcard extends StatelessWidget {
  const liquorlistcard({@required this.image, @required this.label});

  final String image;
  final String label;

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)),
      width: x * 0.3,
      child: Card(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(top: y * 0.002),
                child: Image.asset(image),
              ),
              Text(label, style: TextStyle(color: _color, fontSize: y * 0.02)),
              Padding(
                padding: EdgeInsets.only(top: y * 0.002),
                child: Text('Shop Name', style: TextStyle(fontSize: y * 0.02,),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (index) {
                  return index < 3
                      ? Icon(Icons.star, color: Colors.amber, size: y * 0.02)
                      : Icon(Icons.star_border, color: Colors.amber, size: y * 0.02);
                }),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                child: Text('Rate', style: TextStyle(fontSize: y * 0.015)),
                textColor: _color,
                color: Colors.lime[800],
              ),
            ]),
      ),
    );
  }
}