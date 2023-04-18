import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tagumpai/models/user_model.dart';
import 'package:tagumpai/services/auth.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  final AuthServices _authServices = AuthServices();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  UserModel get getUser => _user!;

  Future<void> refreshUser() async {
    UserModel user = await _authServices.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
