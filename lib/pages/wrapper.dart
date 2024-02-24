import 'package:flutter/material.dart';
import 'package:naruciekoapp/models/user_model.dart';
import 'package:naruciekoapp/pages/LandingPages/pages.dart';
import 'package:naruciekoapp/pages/authentication/login_or_register.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    // Check if the user is authenticated
    if (user != null) {
      // If user is authenticated, return the Home page
      return Pages();
    } else {
      // If user is not authenticated, return the authentication page
      return LoginRegisterPage(); // Make sure to replace this with your actual authentication page
    }
  }
}
