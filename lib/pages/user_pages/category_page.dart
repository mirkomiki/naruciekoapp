import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:naruciekoapp/datatype/customItemCard.dart';
import 'package:naruciekoapp/datatype/customTextField.dart';
import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/models/item_models/item_model.dart';
import 'package:naruciekoapp/models/producer_models/producer_model.dart';
import 'package:naruciekoapp/pages/user_pages/cartPage.dart';
import 'package:naruciekoapp/services/auth.dart';
import 'package:naruciekoapp/services/database.dart';

class CategoryPage extends StatelessWidget {
  final String category;

  const CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy list of items, replace this with your actual list of items
    ProducerModel producer = ProducerModel(
      uid: 'producer123',
      name: 'OPG Weiner',
      email: 'weiner@example.com',
      address: 'Lipovčani',
    );

    // Define dummy item data
    ItemModel item = ItemModel(
      uid: 'item123',
      producerUid: producer.uid,
      name: 'Jabuke',
      price: 5,
      description: 'Fresh apples from the orchard.',
      quantity: 5,
      category: Category.Voce,
      unit: Unit.Kilogram,
    );

    item.setPhoto('assets/apple1.jpg');

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Trenutna ponuda - $category'), // Show category name in the app bar
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_basket_outlined),
        backgroundColor: Colors.blue,
        hoverColor: Colors.green,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartPage()),
        ),
      ),
      body: ListView.builder(
        itemCount: 1, //promijeni
        itemBuilder: (context, index) {
          // Make sure to pass the required parameters to CustomItemCard constructor
          return CustomItemCard(item, producer);
        },
      ),
    );
  }
}
/*
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
*/