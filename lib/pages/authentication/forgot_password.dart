import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:naruciekoapp/datatype/customButton.dart';
import 'package:naruciekoapp/datatype/customTextField.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Link za ponovno postavljanje lozinke je poslan"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Neispravna e-mail adresa"),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Password reset page'),
          backgroundColor: const Color.fromARGB(255, 21, 86, 55),
        ),
        body: Column(children: [
          const Text(
            "Unesite e-mail adresu na koju ćemo Vam poslati link za ponovno postavljanje lozinke:",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          CustomTextField(
              controller: _emailController,
              hintText: 'Email',
              obsureText: false),
          const Padding(padding: EdgeInsets.all(20)),
          CustomButton(
            onTap: passwordReset,
            text: "Ponovo postavi",
          )
        ]));
  }
}
