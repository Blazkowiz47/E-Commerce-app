import 'package:flutter/material.dart';

import '../main.dart';

class Grads extends StatelessWidget {
  final String title;
  final String loc;
  final Widget page;
  Grads(this.title, this.loc, this.page);

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
          if (title == 'Sanitizer and Spray') dist = true;
          print(MediaQuery.of(context).size.height);
          if (page != null)
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
        },
        child: Container(
          padding: EdgeInsets.all(7),
          height: MediaQuery.of(context).size.height < 550
              ? (MediaQuery.of(context).size.height * 0.4) / 2
              : (MediaQuery.of(context).size.height * 0.35) / 2,
          width: (MediaQuery.of(context).size.width -
                  MediaQuery.of(context).size.width / 3.93) /
              2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              if (loc != null)
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 45,
                    child: ClipOval(
                        child: Image.asset(
                      loc,
                      fit: BoxFit.cover,
                      width: 400,
                      height: 400,
                    ))),
              Text(
                title,
                style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
