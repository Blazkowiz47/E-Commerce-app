import 'package:flutter/material.dart';
import 'liquorbeforedetails.dart';

class GradDrink extends StatelessWidget {
  final String title;
  final String loc;
  final String collection;

  GradDrink(this.title, this.loc,this.collection);

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
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => Drink2(collection)));
        },
        child: Container(
          padding: EdgeInsets.all(7),
          height: MediaQuery.of(context).size.height > 700 ? (MediaQuery.of(context).size.width - 90) / 2 :
          (MediaQuery.of(context).size.height*0.25),
          width: MediaQuery.of(context).size.height > 700 ? (MediaQuery.of(context).size.width - 90) / 2 :
          (MediaQuery.of(context).size.width - 90) / 3 ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              if (loc != null)
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: ClipOval(
                        child: Image.asset(
                          loc,
                          fit: BoxFit.cover,
                          width: 800,
                          height: 800,
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
