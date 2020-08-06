import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import './userlist.dart';


class AdminMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('users')
            .snapshots(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    reverse: true,
                    itemBuilder: (ctx, i) => Userlist(
                      snapshot.data.documents[i]['username'],
                      snapshot.data.documents[i]['phone'],
                    ),
                  ));
  }
}
