import 'package:flutter/material.dart';
import 'package:naruciekoapp/globalData.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
    );
  }
}
