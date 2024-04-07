import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:naruciekoapp/globalData.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Image.asset(
        'assets/zecov_logo.png',
        width: 60,
        height: 60,
      ),
      title: Text(title),
      actions: [
        GestureDetector(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: CircleAvatar(
              backgroundImage: globalUser.profileImage.image,
            )),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
