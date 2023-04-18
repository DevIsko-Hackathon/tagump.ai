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
  Future signUp(String email, String password, String name, context) async {
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
      );

      // store to firestore after creating
      _db.collection("users").doc(_cred.user!.uid).set(_user.toJson());

      final snackBar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text("Created account succesfully!"),
        backgroundColor: Colors.green,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text("{$e.code}"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("Error: $e");
    }
  }

  // sign in with email and password
  Future signIn(String email, String password, context) async {
    try {
      UserCredential _cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final snackBar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text("Signed in succesfully!"),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      print("Error: $e");
      final snackBar = SnackBar(
        duration: Duration(seconds: 2),
        content: Text("Invalid Email or Password!"),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  // sign in google
  Future googleLogin() async {
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
      return await _auth.signInWithCredential(cred);
    } catch (e) {
      print("Error: $e");
    }
  }

  // sign out
  Future signOut(context) async {
    await _auth.signOut();

    final snackBar = SnackBar(
      duration: Duration(seconds: 2),
      content: Text("Logged out succesfully!"),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
