/*import 'dart:js_util';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailAuthentication {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> createUserWithEmailAndPassword(
      {required String email, 
      required String password}) async{

    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

        User user = userCredential.user!;
        user.sendEmailVerification();

      return true;
    } catch (e) {
      return false; 
    }
    //return Future.value(true);
  }
  Future<bool> signInWithEmailAndPassword(
    {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }
}*/
