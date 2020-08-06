import "package:flutter/material.dart";

class Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Privacy Policy",style: TextStyle(color:Colors.white),),
      centerTitle: true,
    backgroundColor:  Color.fromRGBO(00, 44, 64, 1),
    ),
    body:Center(child:Text(" Company Privacy Policy will be Displayed Here")),
    );
  }
}