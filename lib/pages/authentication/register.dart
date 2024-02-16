import "package:flutter/material.dart";
import "package:naruciekoapp/services/auth.dart";

class RegisterScreen extends StatefulWidget {
  final Function toggleView;
  const RegisterScreen({super.key, required this.toggleView});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      backgroundColor: const Color.fromARGB(255, 26, 96, 26),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if (result == null) {
              print('error signing in');
            } else {
              print('signed in');
              print(result.toString());
            }
          },
          child: const Text('Sign in anon'),
        ),
      ),
    );
  }
}
