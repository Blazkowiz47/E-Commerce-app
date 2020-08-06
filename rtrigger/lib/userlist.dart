import 'package:flutter/material.dart';

class Userlist extends StatelessWidget {
  String name;
  String phone;
  Userlist(this.name,this.phone);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30,vertical:5.0),
      child: Card(
        color: Colors.grey[300],
       child: ListTile(
          subtitle: Text(phone),
          title: Text(name,style: TextStyle(fontWeight:FontWeight.bold),),),

      ),
    );
  }
}