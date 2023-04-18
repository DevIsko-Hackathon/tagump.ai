import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tagumpai/models/user_model.dart';

class FirestoreServices {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<UserModel>>? getUsers() {
    _db.collection("users").get();
  }
}
