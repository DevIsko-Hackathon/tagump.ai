import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  final String? id;
  final String? name;
  final String email;
  final String password;
  final Uint8List? picture;

  UserModel({
    this.name,
    required this.email,
    required this.password,
    this.id,
    this.picture,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "picture": picture,
      };

  static UserModel fromSnap(DocumentSnapshot snap) {
    final snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      email: snapshot["email"],
      password: snapshot["password"],
      id: snapshot["id"],
      name: snapshot["name"],
      picture: snapshot["picture"],
    );
  }
}
