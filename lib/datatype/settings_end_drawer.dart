import 'package:flutter/material.dart';

class SettingsEndDrawer extends StatelessWidget {
  const SettingsEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(228, 229, 211, 1),
      child: Image.asset('assets/blank-profile-image.jpg'),
    );
  }
}
