import 'package:flutter/material.dart';

import '../globalData.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.green,
      elevation: 0, // Remove shadow
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/zecov_logo.png',
            width: 60,
            height: 60,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Scaffold.of(context).openEndDrawer();
          },
          child: CircleAvatar(
            radius: 20,
            backgroundImage: globalUser.profileImage.image,
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60); // Reduce height here
}
