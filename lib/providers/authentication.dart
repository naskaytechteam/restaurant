import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer';

import '../models/customer.dart';

class Authentication extends ChangeNotifier {
  User? _currentUser = FirebaseAuth.instance.currentUser;
  final _customerCollection = FirebaseFirestore.instance.collection('Customer');

  Future<void> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      GoogleSignInAuthentication? authentication =
          await googleSignInAccount?.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: authentication?.idToken,
          accessToken: authentication?.accessToken);
      FirebaseAuth.instance.signInWithCredential(authCredential).then((value) {
        log('sign in successfully');
      }).onError((error, stackTrace) {
        log('exception occure in google signin -> $error');
      });
    } catch (e) {
      log('exception occure in google SignIn -> $e');
    }
  }

  Future<void> signUpWithEmail(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    log('email signup successfully complete');
    Customer customer =
        Customer(name: 'name', email: userCredential.user!.email!);
    await _addCostumerData(
        customer, userCredential.user!.uid);
    log('data store in FirebaseFirestore successfully');
  }

  Future<void> signUpWithFacebook() async {
    log('signupwithFacebook method called');
    FacebookLogin facebookLogin = FacebookLogin();
    try {
      FacebookLoginResult facebookLoginResult = await facebookLogin.logIn();
      AuthCredential? credential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);

      FirebaseAuth.instance.signInWithCredential(credential);
      log('Facebook signup successful');
    } catch (e) {
      log('error occured in facebook signup -> $e');
    }
  }

  Future<void> loginWithEmail(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> _addCostumerData(Customer customer, String uid) async {
    await FirebaseFirestore.instance
        .collection('Customer')
        .doc(uid)
        .set(customer.topJson());
  }

  Future<void> addFavoriteFood(String favoriteFood) async {
    await _customerCollection
        .doc(_currentUser!.uid)
        .update({'favoriteFood': favoriteFood});
  }
  Future<Customer> getCurrentUserData()async{
    DocumentSnapshot documentReference=await  _customerCollection.doc(_currentUser!.uid).get();
    Customer customer=Customer.fromJson(documentReference.data() as Map);
    return customer;


  }
}
