import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer';

class Authentication extends ChangeNotifier {
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
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      log('email signup successfully complete');
    } catch (e) {
      log('exception in email signup -> $e');
    }
  }

  Future<void> signUpWithFacebook() async {
    log('signupwithFacebook method called');
    FacebookLogin facebookLogin = FacebookLogin();
    try {
      FacebookLoginResult facebookLoginResult = await facebookLogin.logIn();
      AuthCredential? credential = FacebookAuthProvider.credential(facebookLoginResult.accessToken!.token);

      FirebaseAuth.instance.signInWithCredential(credential);
      log('Facebook signup successful');
    }catch (e){
      log('error occured in facebook signup -> $e');
    }
  }

  Future<void> loginWithEmail(String email,String password)async{
    // try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      // log('ok');
    // }catch (e){
    //   log('error found');
    // }
  }
}
