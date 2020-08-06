import 'package:flutter/material.dart';

import 'Liquor/liquor.dart';
import 'Medical/medical_shop.dart';
// import 'file:///C:/Users/Ujjwa/AndroidStudioProjects/rtrigger/lib/Liquor/liquor.dart';



import 'Food/food.dart';

class Filter extends StatefulWidget {
  final List items;

  Filter(this.items);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => widget.items[0]['id'] == 'Wine'
                      ? Liquor()
                      : widget.items[0]['id'] == 'Paracetamol'
                          ? MedicalShop()
                          : Food()));
            }),
        backgroundColor: Colors.white,
        title: Text(
          "Select Items",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            for (int i = 0; i < widget.items.length; i++)
              Card(
                child: ListTile(
                  leading: Text(widget.items[i]['id']),
                  trailing: Checkbox(
                    value: widget.items[i]['check'],
                    onChanged: (bool value) {
                      setState(() {
                        widget.items[i]['check'] = !widget.items[i]['check'];
                      });
                    },
                    checkColor: Colors.white,
                    activeColor: Color.fromRGBO(0, 44, 64, 1),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
