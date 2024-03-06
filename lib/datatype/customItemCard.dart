import 'package:flutter/material.dart';

Widget CustomItemCard(String opgName, String village, String price, String imagePath, int rating) {
    return Card(
      margin: EdgeInsets.all(16),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 100, // Adjust image width as needed
          height: 100, // Adjust image height as needed
          fit: BoxFit.cover,
        ),
        title: Text(opgName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(village), // Display village
            Text(price),
            SizedBox(height: 5), // Add spacing between village and rating
            Row(
              children: [
                Icon(Icons.star,
                    color: const Color.fromARGB(255, 255, 218, 7),
                    size: 20), // Star icon for rating
                SizedBox(width: 5),
                Text('$rating / 5'), // Display rating
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                // Handle decrease quantity
              },
              icon: Icon(Icons.remove),
            ),
            Text('0'), // Display quantity (non-functional)
            IconButton(
              onPressed: () {
                // Handle increase quantity
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }