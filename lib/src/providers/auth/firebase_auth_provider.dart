import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthProvider extends ChangeNotifier {
  //instance of fire_auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //instance of cloud_firestore
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //log in
  Future<UserCredential> logInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredentials = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      //add a new document for the user in users collection if it doesn't already exists
      _firebaseFirestore
          .collection('users')
          .doc(userCredentials.user!.uid)
          .set({
        'uid': userCredentials.user!.uid,
        'email': email,
      }, SetOptions(merge: true));

      return userCredentials;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //log out
  Future logOut() async {
    return await _firebaseAuth.signOut();
  }

  //sign up
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, password) async {
    try {
      UserCredential userCredentials = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      //after creating the user, createa new document
      _firebaseFirestore
          .collection('users')
          .doc(userCredentials.user!.uid)
          .set({
        'uid': userCredentials.user!.uid,
        'email': email,
      });
      return userCredentials;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
