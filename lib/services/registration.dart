// ignore_for_file: prefer_typing_uninitialized_variables, unused_element, body_might_complete_normally_nullable, unused_import, await_only_futures, unused_local_variable, non_constant_identifier_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';

import 'user.dart';

// ignore: camel_case_types
class firebaseAuth {
  // ignore: unused_field
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  CollectionReference collectionUtilisateur =
      FirebaseFirestore.instance.collection("users");

  Utilisateur? _userFromFirebase(auth.User? utilisateur) {
    if (utilisateur == null) {
      return null;
    }

    return Utilisateur(utilisateur.uid);
  }

  Stream<Utilisateur?> get utilisateur {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<Utilisateur?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final Credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return _userFromFirebase(Credential.user);
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return null;
      } else if (e.code == 'wrong-password') {
        return null;
      } else {
        return null;
      }
    }
  }

  Future<Utilisateur?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final Credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(Credential.user);
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return null;
      } else if (e.code == 'email-already-in-use') {
        return null;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> inputData() async {
    final user = await _firebaseAuth.currentUser;
    final String uid = user!.email.toString();
    return uid;
  }
}
