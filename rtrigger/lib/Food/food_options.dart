import 'package:flutter/material.dart';
import 'beforefooddetails.dart';
// import './onclicked.dart';

class GradFood extends StatelessWidget {
  final String title;
  final String loc;
  final String collection;

  GradFood(this.title, this.loc, this.collection);

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
          print(MediaQuery.of(context).size.height);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => Food2(collection)));
        },
        child: Container(
          height: (MediaQuery.of(context).size.width - 90) / 3.08,
          width: (MediaQuery.of(context).size.width - 90) / 3.08,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              if (loc != null)
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: ClipOval(
                        child: Image.asset(
                      loc,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.height * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                    ))),
              Text(
                title,
                style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.018),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
