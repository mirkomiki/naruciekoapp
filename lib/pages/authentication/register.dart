import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/datatype/customButton.dart';
import 'package:naruciekoapp/datatype/customTextField.dart';
import 'package:naruciekoapp/datatype/squareTile.dart';
import 'package:naruciekoapp/services/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});
  final Function()? onTap;
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  final AuthService _auth = AuthService();

  void becomeProducer() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (passwordController.text == cpasswordController.text) {
        _auth.registerProducerWithEmailAndPassword(
            emailController.text, passwordController.text);
        Navigator.pop(context);
      } else {
        showDialog(
            context: context,
            useSafeArea: false,
            builder: (context) {
              return const AlertDialog(title: Text("Passwords don't mach"));
            });
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      wrongEmailPasswordMessage();
    }
  }

  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (passwordController.text == cpasswordController.text) {
        _auth.registerWithEmailAndPassword(
            emailController.text, passwordController.text);
        Navigator.pop(context);
      } else {
        showDialog(
            context: context,
            useSafeArea: false,
            builder: (context) {
              return const AlertDialog(title: Text("Passwords don't mach"));
            });
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      wrongEmailPasswordMessage();
    }
  }

  void wrongEmailPasswordMessage() {
    showDialog(
        context: context,
        useSafeArea: false,
        builder: (context) {
          return const AlertDialog(title: Text('Wrong Credentials'));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // logo
          const SizedBox(
            height: 50,
          ),
          const Icon(
            Icons.lock,
            size: 100,
          ),
          const SizedBox(
            height: 25,
          ),
          //welcome
          Text(
            'Dobrodošli na vašu e-tržnicu',
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
              hintText: 'Password',
              obsureText: true),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
              controller: cpasswordController,
              hintText: 'Confirm Password',
              obsureText: true),
          //forgot password

          const SizedBox(
            height: 25,
          ),
          //sign in button
          CustomButton(
            text: 'Register',
            onTap: signUserUp,
          ),
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
                  'Or Continue With',
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
                onTap: () => AuthService().signInWithGoogle(),
              ),
              /* const SizedBox(
                width: 25,
              ),
              SquareTile(
                imagePath: 'assets/facebook-logo.png',
                onTap: () => AuthService().signInWithFacebook(),
              ), */
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: TextStyle(color: Colors.grey[700]),
              ),
              InkWell(
                onTap: widget.onTap,
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'Login now',
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
                  'AKO NISTE KUPAC PRIJAVITE SE OVDJE',
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
          CustomButton(
            onTap: becomeProducer,
            text: 'Prijavi se kao proizvođač',
          ),
        ]),
      ),
    );
  }
}
