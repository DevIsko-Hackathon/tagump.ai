import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tagumpai/models/user_model.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final googleSignin = GoogleSignIn();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails() async {
    User currentuser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _db.collection("users").doc(currentuser.uid).get();

    return UserModel.fromSnap(snap);
  }

  // sign up with email and password
  Future<String> signUp(
      String email, String password, String name, context) async {
    String res = "Some error occurred";
    try {
      UserCredential _cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel _user = UserModel(
        name: name,
        email: email,
        password: password,
        id: _cred.user!.uid,
        picture: null,
      );

      // store to firestore after creating
      _db.collection("users").doc(_cred.user!.uid).set(_user.toJson());

      _auth.signInWithEmailAndPassword(email: email, password: password);

      res = "success";
    } on FirebaseAuthException catch (e) {
      res = e.toString();
      print("Error: $e");
    }

    return res;
  }

  // sign in with email and password
  Future<String> signIn(String email, String password, context) async {
    String res = "Some error occurred";
    try {
      UserCredential _cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      res = "success";
    } catch (e) {
      res = e.toString();
      print("Error: $res");
    }

    return res;
  }

  // sign in google
  Future<String> googleLogin() async {
    String res = "Some error occured";
    try {
      // interactive sign in process
      final googleUser = await googleSignin.signIn();

      // obtain auth details from request
      final GoogleSignInAuthentication gAuth = await googleUser!.authentication;

      // create a new credential for user
      final cred = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // sign in
      await _auth.signInWithCredential(cred);
      res = "success";
    } catch (e) {
      res = e.toString();
      print("Error: $res");
    }

    return res;
  }

  // sign out
  Future signOut(context) async {
    await _auth.signOut();
  }
}
