import 'package:flutter/material.dart';
import 'Authentication/login_signup.dart';

class Bubble extends StatelessWidget {
  final String message;
  final String username;
  final Key key;

  Bubble(this.message,this.username,{this.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
          children:<Widget>[ 
        Row(
        mainAxisAlignment: user==username? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
topRight: Radius.circular(10),
bottomLeft:  user==username? Radius.circular(10): Radius.circular(0),
bottomRight:  user==username? Radius.circular(0): Radius.circular(10),

            ),
            color: user==username? Colors.grey[300] : Colors.lightGreen[500]
            ),
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            margin: EdgeInsets.symmetric(vertical:13,horizontal:8),
            child: Column(
              crossAxisAlignment:!(user==username)? CrossAxisAlignment.start:CrossAxisAlignment.end,
              children: <Widget>[
               

                    Container(
                      padding: EdgeInsets.symmetric(vertical:5),
                      child: Text( user==username?username+"     ":"     "+username,style: TextStyle(fontWeight: FontWeight.bold,))),
  
                Text(message,style: TextStyle(color:Colors.black),textAlign:  user==username? TextAlign.end: TextAlign.start,)

              
        ],))]

      ),

 ],
 overflow: Overflow.visible,   );
  }
}