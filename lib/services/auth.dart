import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:naruciekoapp/globalData.dart";
import "package:naruciekoapp/main.dart";
import 'package:naruciekoapp/models/producer_models/producer_model.dart';
import 'package:naruciekoapp/models/user_models/user_model.dart';
import "package:naruciekoapp/pages/LandingPages/producer_pages.dart";
import "package:naruciekoapp/pages/authentication/login_or_register.dart";
import "package:naruciekoapp/pages/splash_screen.dart";
import "package:naruciekoapp/pages/wrapper.dart";
import "package:naruciekoapp/services/database.dart";
import "package:naruciekoapp/services/user_managment.dart";

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  /*
  //create user obj based on FirebaseUser
  UserModel? _userFromFirebaseUser(User? user) {
    print('Entry in _userFromFirebaseUser');
    return user != null
        ? UserModel(user.uid, '', user.email.toString(), 'customer')
        : null;
  }

  UserModel? _producerFromFirebaseUser(User? user) {
    print('Entry in _producerFromFirebaseUser');
    return user != null
        ? UserModel(user.uid, '', user.email.toString(), 'producer')
        : null;
  }
  */

  //siginwith email and password method code to firebase
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      globalUserUid = user!.uid;
      /*if (doc.data()?['role'] == 'producer') {
        return _producerFromFirebaseUser(user);
      } else {
        return _userFromFirebaseUser(user);
      }*/
    } catch (e) {
      print("Error caught in signInWithEmailAndPassword");
      return null;
    }
  }

  Future registerProducerWithEmailAndPassword(
      String email, String password, String adressName) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      globalUserUid = user!.uid;
      globalIsProducer = true;
      await DatabaseService(uid: user!.uid)
          .updateUserData('Ime', email, 'producer');
      //return _producerFromFirebaseUser(user);
      CollectionReference producers =
          FirebaseFirestore.instance.collection("producers");
      QuerySnapshot querySnapshot =
          await producers.where('email', isEqualTo: email).get();
      if (querySnapshot.docs.isNotEmpty) {
        return null;
      } else {
        await DatabaseService(uid: globalUserUid)
            .updateProducerData('Ime OPG-a', email, adressName);
      }
      navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => UserManagment().handleAuth()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      print("user exists");
      print("Error caught in registerWithEmailAndPassword");
      return null;
    }
  }

  Future registerProducerWithEmailAndPasswordinProducers(
      String email, String password, String adressName) async {
    try {} catch (e) {
      print("Error caught in registerWithEmailAndPasswordinProducers");
      return null;
    }
  }

  //method to sign in anonymous
  /*
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print("Caught an error in signInAnon: $e");
      return null; // Return null or handle the error as needed
    }
  }
  */

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (userCredential.additionalUserInfo!.isNewUser) {
        if (user != null) {
          globalUserUid = user.uid;
          await DatabaseService(uid: user.uid)
              .updateUserData('new user', email, 'customer');
        }
      }
      //_userFromFirebaseUser(user);
    } catch (e) {
      print("Error caught in registerWithEmailAndPassword");
      return null;
    }
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    globalUserUid = userCredential.user?.uid;
    //return _userFromFirebaseUser(userCredential.user);
  }

  signUpWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    globalUserUid = userCredential.user?.uid;
    if (userCredential.additionalUserInfo!.isNewUser) {
      if (userCredential.user != null) {
        await DatabaseService(uid: userCredential.user!.uid).updateUserData(
            'new user', userCredential.user!.email.toString(), 'customer');
      }
    }

    //return _userFromFirebaseUser(userCredential.user);
  }
}
