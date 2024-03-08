import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
  });

  final Widget? leading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leading,
      title: Text(title),
      actions: [
        IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: const Icon(
              Icons.more_vert,
              color: Color.fromARGB(255, 212, 211, 211),
              size: 34.0,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
