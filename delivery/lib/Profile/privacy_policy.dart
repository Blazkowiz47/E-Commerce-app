import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  
  @override

  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}



class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Privacy Policy'),
        centerTitle: true,
        
      ),
      body: Container(
        child: Text('Privacy Policy'),
      ),
    );
  }
}