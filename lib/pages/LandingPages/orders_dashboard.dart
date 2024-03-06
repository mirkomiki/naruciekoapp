import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/main.dart';
import 'package:naruciekoapp/services/auth.dart';

class OrdersDashboard extends StatefulWidget {
  const OrdersDashboard({super.key});

  @override
  State<OrdersDashboard> createState() => _OrdersDashboardState();
}

class _OrdersDashboardState extends State<OrdersDashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          try {
            FirebaseAuth.instance.signOut();
          } catch (e) {
            print('Error in signOut');
            //navigatorKey.currentState.pushReplacement(
            //MaterialPageRoute(builder: (_) => UserMe));
          }

          setState(() {});
        },
      ),
    );
  }
}
