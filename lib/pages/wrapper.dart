import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/models/user_model.dart';
import 'package:naruciekoapp/pages/LandingPages/pages.dart';
import 'package:naruciekoapp/pages/LandingPages/producer_pages.dart';
import 'package:naruciekoapp/pages/LandingPages/producers_page.dart';
import 'package:naruciekoapp/pages/authentication/login_or_register.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool _producerPages = false;

  @override
  void initState() {
    super.initState();
    fetchUserRole();
  }

  Future<void> fetchUserRole() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();
      if (doc.exists && doc.data()?['role'] == 'producer') {
        setState(() {
          _producerPages = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchUserRole();
    final user = Provider.of<UserModel?>(context);
    if (user != null && !_producerPages) {
      // If user is authenticated but not a producer, return the Home page
      return Pages();
    } else if (user != null && _producerPages) {
      // If user is authenticated and a producer, return the Producer pages
      return ProducerPages();
    } else {
      // If user is not authenticated, return the authentication page
      return LoginRegisterPage(); // Make sure to replace this with your actual authentication page
    }
  }
}
