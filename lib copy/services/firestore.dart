import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tagumpai/models/chat_message.dart';
import 'package:tagumpai/models/user_model.dart';
import 'package:tagumpai/services/storage.dart';

class FirestoreServices {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  // Future<String> sendMessage(String profilePic, String datePublished,) async {
  //   String res = "Some error occured";
    
  //   try {

  //     String postId 
  //     ChatMessageModel(

  //     );
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }
}
