import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  
  @override

  _NotificationsState createState() => _NotificationsState();
}



class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Notifications'),
        centerTitle: true,
        
      ),
      body: Center(
        child: Text('No Notifications right now'),
      ),
    );
  }
}