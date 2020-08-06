import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final key = GlobalKey<ScaffoldState>();
  var user;
  String _password;
  List<bool> isSelected;

  @override
  void initState() {

    isSelected = [true, false];
    getUser();
    getPassword();
  }


  final currentPasswordController = new TextEditingController();
  final newPasswordController = new TextEditingController();
  final confirmPasswordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
                child: Column(
          children: [
            SizedBox(height: 20.0,),

            Text('Reset Password', style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 20.0,),
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 1.35,
              child: new TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey[200],
                      width: 1.8,
                    ),
                  ),
                  hintText: 'Enter Current Password',
                  fillColor: Colors.white,
                  filled: true,
                ),
                controller: currentPasswordController,
                validator: (val) =>
                    val.length < 6 ? 'Password length should be greater than 6 characters' : null,
              ),
            ),
            Padding(padding: EdgeInsets.all(8.0),),
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 1.35,
              child: new TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey[200],
                      width: 1.8,
                    ),
                  ),
                  hintText: 'Enter new password',
                  fillColor: Colors.white,
                  filled: true,
                ),
                controller: newPasswordController,
                validator: (val) =>
                    val.length < 6 ? 'Password length should be greater than 6 characters' : null,
              ),
            ),
            Padding(padding: EdgeInsets.all(8.0),),
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 1.35,
              child: new TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey[200],
                      width: 1.8,
                    ),
                  ),
                  hintText: 'Confirm new password',
                  fillColor: Colors.white,
                  filled: true,
                ),
                controller: confirmPasswordController,
                validator: (val) =>
                    val.length < 6 ? 'Password length should be greater than 6 characters' : null,
              ),
            ),
            Padding(padding: EdgeInsets.all(8.0),),

            RaisedButton(
              child: Text('Reset Password'),
              onPressed: () async {
                if(_password == currentPasswordController.text){

                  if(newPasswordController.text == confirmPasswordController.text){
                    updatePasswords();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Settings()));
                  }else{
                    key.currentState.showSnackBar(SnackBar(content: Text('Entered passwords doesn\'t match :)'),));
                  }

                }else{
                  key.currentState.showSnackBar(SnackBar(content: Text('You entered a wrong password :)'),));
                }
                
              },
            ),
            Padding(padding: EdgeInsets.all(8.0),),
            Divider(thickness: 2.0, color: Colors.black,),
            Padding(padding: EdgeInsets.all(8.0),),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text('Notifications ', style: TextStyle(fontSize: 18.0)),
                  Spacer(),
                  ToggleButtons(
                    children: [
                      Text('Off'),
                      Text('On'),
                    ],
                    isSelected: isSelected,
                    onPressed: (int index) {
                      
                      setState(() {
                        
                        for(int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++){
                          if(buttonIndex == index) {
                            isSelected[buttonIndex] = true;
                          }else{
                            isSelected[buttonIndex] = false;
                          }
                        }
                        updateNotifications(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  updateNotifications(int index) async {

    await Firestore.instance.collection('delivery-users').document(user.uid).updateData({
      'notifications' : (index == 0) ? false : true ,
    });
  }

  updatePasswords() async {
    await Firestore.instance
        .collection('delivery-users')
        .document(user.uid)
        .updateData({
      'password' : confirmPasswordController.text,
    });
  }

  getPassword() async {
    user = await FirebaseAuth.instance.currentUser();
    await Firestore.instance
        .collection('delivery-users')
        .document(user.uid)
        .get()
        .then((value) {
      setState(() {
        _password = value.data['password'];
      });
    });
  }
  getUser() async {
    user = await FirebaseAuth.instance.currentUser();
  }
}