import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Naruči naše'),
          backgroundColor: const Color.fromARGB(255, 21, 86, 55),
        ),
        body: Column(children: [
          Text(
              "Unesite Vašu e-mail adresu na koju ćemo Vam poslati link za ponovno postavljanje lozinke")
        ]));
  }
}
