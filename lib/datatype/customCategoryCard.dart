import 'package:flutter/material.dart';
import 'package:naruciekoapp/pages/LandingPages/home.dart';


  Widget customCategoryCard(BuildContext context, String name, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Home()), // Navigate to categoryCarde
        );
      },
      child: Card(
        margin: EdgeInsets.all(16),
        child: ListTile(
          leading: Image.asset(
            imagePath,
            width: 100, // Adjust image width as needed
            height: 100, // Adjust image height as needed
            fit: BoxFit.cover,
          ),
          title: Text(name),
        ),
      ),
    );
  }