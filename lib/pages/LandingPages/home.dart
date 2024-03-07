import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:naruciekoapp/datatype/customItemCard.dart';
import 'package:naruciekoapp/datatype/customTextField.dart';
import 'package:naruciekoapp/pages/LandingPages/CategoryPage.dart';
import 'package:naruciekoapp/pages/LandingPages/pages.dart';
import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/services/auth.dart';
import 'package:naruciekoapp/services/database.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Naruči naše'),
        backgroundColor: const Color.fromARGB(255, 26, 102, 65),
        leading: Image.asset(
          'assets/zecov_logo.png',
          width: 60,
          height: 60,
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          children: [
            _buildCategoryButton(context, "Voće", Icons.local_florist),
            _buildCategoryButton(context, "Povrće", Icons.local_florist),
            _buildCategoryButton(context, "Pića", Icons.local_florist),
            _buildCategoryButton(context, "Mliječni proizvodi", Icons.local_florist),
            _buildCategoryButton(context, "Med i džem", Icons.local_florist),
            _buildCategoryButton(context, "Ostalo", Icons.local_florist),
            // Add more category buttons here
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Pages(),
            ),
          );
        },
        child: const Text("Home"),
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String title, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(category: title.toLowerCase()),
          ),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(8)),
      ),
      icon: Icon(icon),
      label: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}


