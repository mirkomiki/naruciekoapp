import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/pages/LandingPages/producer_pages.dart';
import 'package:naruciekoapp/pages/LandingPages/producers_page.dart';
import 'package:naruciekoapp/pages/authentication/login_or_register.dart';
import 'package:naruciekoapp/pages/wrapper.dart';

import '../pages/LandingPages/pages.dart';

class UserManagment {
  Widget handleAuth() {
    print('Entry in user_managment');
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            print('Entry in wrapper inside of user_managment');
            return Wrapper();
          }
          print('Entry in LoginRegisterPage inside of user_managment');
          return LoginRegisterPage();
        });
  }

  authorizeAccess(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get()
          .then((docs) {
        if (docs.exists) {
          if (docs.data()?['role'] == 'producer') {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ProducerPages()),
              (Route<dynamic> route) => false,
            );
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Pages()),
              (Route<dynamic> route) => false,
            );
          }
        }
      });
    }
  }
}
