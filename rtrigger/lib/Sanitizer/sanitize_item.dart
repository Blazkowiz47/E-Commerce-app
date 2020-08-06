import 'package:flutter/material.dart';

import '../area.dart';

class SanitizeItem extends StatelessWidget {
  final String title;
  final String loc;

  SanitizeItem(this.title, this.loc);

  void move(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute( builder: (_){
    //  return Onclicked(title,id);
    // }));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => Area()));
        },
        child: Container(
          padding: EdgeInsets.all(7),
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              if (loc != null)
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: title == 'Medicine' || title == 'Liquor' ? 40 : 33,
                    child: ClipOval(
                        child: Image.asset(
                      loc,
                      fit: BoxFit.cover,
                      width: 400,
                      height: 400,
                    ))),
              Text(title,
                  style: TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold,
                      fontSize: 13)),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
