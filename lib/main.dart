import 'package:flutter/material.dart';
import 'package:naruciekoapp/LandingPages/home.dart';
import 'package:naruciekoapp/LandingPages/pages.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      //'/auth': (context) => const AuthPage(),
      '/': (context) => const Home(),
      '/pages': (context) => const Pages(),
    },
  ));
}
