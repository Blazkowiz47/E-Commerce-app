import 'package:flutter/material.dart';
import './saloon_service.dart';

class SaloonItem extends StatefulWidget {
  final String title;
  final String loc;
  final String sum;
  final String location;
  final String description;
  SaloonItem(this.title, this.loc, this.sum, this.location,this.description);
  @override
  _SaloonItemState createState() => _SaloonItemState();
}

class _SaloonItemState extends State<SaloonItem> {
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
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SaloonService(title: widget.title, loc: widget.loc, sum: widget.sum,
              location: widget.location,description: widget.description,)));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  widget.loc,
                  fit: BoxFit.scaleDown,
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.12,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2 + 20,
                        height: 35,
                        child: ListTile(
                          leading: Text(
                            widget.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02),
                          ),
                          trailing: Text(
                            '${widget.sum}' + "km",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 + 20,
                        child: Padding(
                          padding: EdgeInsets.only(left: 4.0),
                          child: Text(
                            widget.location,
                            softWrap: true,
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
