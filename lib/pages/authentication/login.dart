import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/datatype/customButton.dart';
import 'package:naruciekoapp/datatype/customTextField.dart';
import 'package:naruciekoapp/datatype/squareTile.dart';
import 'package:naruciekoapp/pages/authentication/forgot_password.dart';
import 'package:naruciekoapp/pages/authentication/register_producer.dart';
import 'package:naruciekoapp/services/auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key, required this.onTap});
  final Function()? onTap;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService _auth = AuthService();
  void becomeProducer() async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => RegisterProducerPage()),
      (Route<dynamic> route) => false,
    );
  }

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      _auth.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      wrongEmailPasswordMessage();
    }
    // ignore: use_build_context_synchronously
  }

  void wrongEmailPasswordMessage() {
    showDialog(
        context: context,
        useSafeArea: false,
        builder: (context) {
          return const AlertDialog(title: Text('Wrong Credentials'));
        });
  }

  _googleSignIn() {
    return AuthService().signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // logo
            SizedBox(
              height: 15,
            ),
            Text(
              "Login",
              style: TextStyle(color: Colors.grey[700], fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            const Icon(
              Icons.lock,
              size: 80,
            ),
            const SizedBox(
              height: 25,
            ),
            //welcome
            Text(
              'Dobrodošli, falili ste nam',
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
            const SizedBox(
              height: 25,
            ),
            // username
            CustomTextField(
                controller: emailController,
                hintText: 'Email',
                obsureText: false),
            //password
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                controller: passwordController,
                hintText: 'Lozinka',
                obsureText: true),
            //forgot password
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 8, 25.0, 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text(
                      'Zaboravljena lozinka?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage()),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //sign in button
            CustomButton(text: 'Ulogiraj se', onTap: signUserIn),
            //or continue with
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Nastavi sa',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
            //google+apple+facebook sign in button
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareTile(
                    imagePath: 'assets/google-logo.png',
                    onTap: () => {_googleSignIn()}),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nemaš račun?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                InkWell(
                  onTap: widget.onTap,
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Registriraj se',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            //not a member register now
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Ako niste još postali proizvođač',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
            CustomButton(onTap: becomeProducer, text: 'Postani proizvođač'),
          ]),
        ),
      ),
    );
  }
}
