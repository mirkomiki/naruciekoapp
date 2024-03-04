import 'package:flutter/material.dart';

class CustomLoader extends StatefulWidget {
  final double? customScale;
  const CustomLoader({super.key, required this.customScale});

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/rabbit-cute.gif',
      fit: BoxFit.cover,
      scale: widget.customScale,
    );
  }
}
