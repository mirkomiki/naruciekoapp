import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:naruciekoapp/datatype/customItemCard.dart';
import 'package:naruciekoapp/datatype/customTextField.dart';
import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/services/auth.dart';
import 'package:naruciekoapp/services/database.dart';

class CategoryPage extends StatelessWidget {
  final String category;

  const CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy list of items, replace this with your actual list of items
    List<Item> items = getItemsForCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Trenutna ponuda - $category'), // Show category name in the app bar
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          // Make sure to pass the required parameters to CustomItemCard constructor
          return CustomItemCard(
            items[index].opgName,
            items[index].village,
            items[index].itemName,
            items[index].price,
            items[index].imagePath,
            items[index].rating,
          );
        },
      ),
    );
  }

  // Dummy function to get items for a specific category
  List<Item> getItemsForCategory(String category) {
    if (category == 'voće') {
      return [
        Item('OPG Weiner', 'Lipovčani', 'Jabuke', '5€ /kg', 'assets/apple1.jpg',
            5),
        Item('OPG Bušić', 'Imotski', 'Jabuke', '6€ /kg', 'assets/apple2.jpeg',
            2),
      ];
    } else if (category == 'povrće') {
      return [
        Item('OPG Pijanec', 'Požega', 'Mrkve', '10€ /kg', 'assets/apple2.jpeg',
            3),
      ];
    } else if (category == 'pića') {
      return [
        Item('OPG Pijanec', 'Požega', 'Prirodni sok od jabuke', '3€ /kg',
            'assets/apple1.jpg', 3),
        Item('OPG Bušić', 'Imotski', 'Prirodni sok od jabuke', '6€ /kg',
            'assets/apple2.jpeg', 2),
      ];
    } else {
      return [
        Item('OPG Weiner & Burić', 'Križevci', 'Med', '15€ / kg',
            'assets/apple1.jpg', 3),
        Item('OPG Weiner & Burić', 'Križevci', 'Džem od brusince', '15€ /kg',
            'assets/apple1.jpg', 3),
        Item('OPG Weiner & Burić', 'Križevci', 'Džem od marelice', '15€ /kg',
            'assets/apple1.jpg', 3),
        Item('OPG Weiner & Burić', 'Križevci', 'Džem od šljive', '15€ /kg',
            'assets/apple1.jpg', 3),
        Item('OPG Weiner & Burić', 'Križevci', 'Džem od borovnice', '15€ /kg',
            'assets/apple1.jpg', 3),
      ];
    }
  }
}

// Dummy class representing an item
class Item {
  final String opgName;
  final String village;
  final String itemName;
  final String price;
  final String imagePath;
  final int rating;

  Item(this.opgName, this.village, this.itemName, this.price, this.imagePath,
      this.rating);
}
