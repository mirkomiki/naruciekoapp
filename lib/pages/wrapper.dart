import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/models/user_models/user_model.dart';
import 'package:naruciekoapp/pages/producer_pages/producer_start_page.dart';
import 'package:naruciekoapp/pages/producer_pages/start_page.dart';
import 'package:naruciekoapp/pages/user_pages/pages.dart';
import 'package:naruciekoapp/pages/producer_pages/producer_pages.dart';
import 'package:naruciekoapp/pages/user_pages/producers_page.dart';
import 'package:naruciekoapp/pages/authentication/login_or_register.dart';
import 'package:naruciekoapp/pages/splash_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Entry in wrapper build');
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .snapshots(),
        builder: (conext, snapshot) {
          if (!snapshot.hasData) {
            return LoginRegisterPage();
          }
          final userData = snapshot.data?.data();
          if (userData?['role'] == 'customer') {
            return Pages();
          } else {
            return StartProducerPage();
          }
        });
  }
}
