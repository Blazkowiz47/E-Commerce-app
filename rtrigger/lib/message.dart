import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import './message_bubble.dart';
import 'Authentication/login_signup.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
                    future: FirebaseAuth.instance.currentUser(),
                    builder: (con, snap) {
                      if (snap.connectionState == ConnectionState.waiting)
                         return Center(child: CircularProgressIndicator());
                         else
    
    
    
    return StreamBuilder(
        stream: Firestore.instance
            .collection('chat')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          reverse: true,
                          itemBuilder: (ctx, i) => Bubble(
                              snapshot.data.documents[i]['text'],
                              snapshot.data.documents[i]['username'],                            
                              key: ValueKey(snapshot.data.documents[i].documentID),),
                        ));
                    });

  }
}
