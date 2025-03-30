import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gdg_task_1_food_ordering_app/landing_page.dart';

class AuthService {
  Future<void> signup({
    required String email,
    required String password,
  }) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    }on FirebaseAuthException catch(e){
      String message = '';
      if(e.code == 'weak-password'){
        message = 'The password provided is too weak.';
      }else if(e.code == 'email-already-in-use'){
        message = 'email already exists';
      }else{
        message = e.toString();
      }
      Fluttertoast.showToast(msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
  }
  }


    Future<void> signin({
    required String email,
    required String password,
  }) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    }on FirebaseAuthException catch(e){
      String message = '';
      if(e.code == 'user-not-found'){
        message = 'No user found.';
      }else if(e.code == 'wrong-password'){
        message = 'wrong password';
      }else{
        message = e.toString();
      }
      Fluttertoast.showToast(msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
  }
  }
  Future<void> signout({required BuildContext context})async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context,
    MaterialPageRoute(builder: 
    (BuildContext context)=> LandingPage()) );
  }
}