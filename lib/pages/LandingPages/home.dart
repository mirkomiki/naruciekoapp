import 'package:flutter/material.dart';
import 'package:naruciekoapp/pages/LandingPages/pages.dart';
import 'package:naruciekoapp/globalData.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Naruči naše'),
        backgroundColor: const Color.fromARGB(255, 21, 86, 55),
      ),
      body: const Padding(
        padding: EdgeInsets.all(doubleGapBetweenContainers),
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
}
