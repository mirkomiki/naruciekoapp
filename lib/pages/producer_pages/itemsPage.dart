import 'package:flutter/material.dart';
// ovako, znaci Landing pages urediti kako god ocete
// imate upute na svakom od njih vise manje trudit cu se pisat sto vise da sto prije moze kj vise ljudi radit backend

class ItemsView extends StatefulWidget {
  const ItemsView({super.key});

  @override
  State<ItemsView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
    );
  }
}
