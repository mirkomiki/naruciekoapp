import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/models/user_model.dart';
import 'package:naruciekoapp/pages/LandingPages/pages.dart';
import 'package:naruciekoapp/pages/LandingPages/producer_pages.dart';
import 'package:naruciekoapp/pages/LandingPages/producers_page.dart';
import 'package:naruciekoapp/pages/authentication/login_or_register.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    // Check if the user is authenticated

    StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoginRegisterPage();
          }
          final userData = snapshot.data?.data();

          if (userData?['role'] == 'producer') {
            return ProducerPages();
          }

          return Pages();
        });

    if (user != null /*&& user.role == "customer"*/) {
      // If user is authenticated, return the Home page
      return Pages();
      //} else if (user != null && user.role == "producer") {
      //  return ProducerPages();
    } else {
      // If user is not authenticated, return the authentication page
      return LoginRegisterPage(); // Make sure to replace this with your actual authentication page
    }
  }
}
