import 'package:flutter/material.dart';
import '../cart.dart';
import '../main.dart';
import './womenhairstyles.dart';
import 'menhairstyles.dart';

// import './onclicked.dart';

class SaloonServiceItem extends StatelessWidget {
  final String title;
  final double price;
  final String maintitle;
  final String loc;
  final String sum;
  final String location;
  final String description;

  SaloonServiceItem(this.title, this.price,
      {this.location, this.sum, this.loc, this.maintitle, this.description});

  void move(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute( builder: (_){
    //  return On-clicked(title,id);
    // }));
  }

  @override
  Widget build(BuildContext context) {
    String s;
    if (title == "Scrub") {
      s = "images/scrub.png";
    } else if (title == "Facial") {
      s = "images/facial.png";
    } else if (title == "Haircut") {
      s = "images/haircut.webp";
    } else if (title == "FaceWash") {
      s = "images/facewash.png";
    }

    return Card(
      elevation: 20,
      child: InkWell(
        onTap: () {
          saltot += price;
          if (gender != 2 && gender != 1) {
            Saloon_item.add({'id': title, 'price': price});
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Cart()));
          } else if (title == 'Haircut' && gender == 1)
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => MenhairStyles(
                      title: maintitle,
                      loc: loc,
                      location: location,
                      sum: sum,
                      description: description,
                    )));
          else if (title == 'Haircut' && gender == 2)
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => WomenhairStyles(
                      title: maintitle,
                      loc: loc,
                      location: location,
                      sum: sum,
                      description: description,
                    )));
          print(gender);
        },
        child: Container(
          padding: EdgeInsets.all(35),
          height: (MediaQuery.of(context).size.width -
                  MediaQuery.of(context).size.width / 7) /
              1.9,
          width: (MediaQuery.of(context).size.width -
                  MediaQuery.of(context).size.width / 4.5) /
              2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              if (title != null)
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(s), fit: BoxFit.fitHeight)),
                ),
              Text(title,
                  style: TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height*0.017)),
              Text('$price',
                  style: TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height*0.017)),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
