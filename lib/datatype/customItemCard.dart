import 'package:flutter/material.dart';
import 'package:naruciekoapp/globalData.dart';

import '../models/item_models/item_model.dart';
/*
Widget CustomItemCard(String opgName, String village, String item, String price, String imagePath, int rating) {
    return Card(
      margin: EdgeInsets.all(16),
      child: ListTile(
	@@ -15,6 +15,7 @@ Widget CustomItemCard(String opgName, String village, String price, String image
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(village), // Display village
            Text(item),
            Text(price),
            SizedBox(height: 5), // Add spacing between village and rating
            Row(
	@@ -48,4 +49,175 @@ Widget CustomItemCard(String opgName, String village, String price, String image
        ),
      ),
    );
  } 
  Widget CustomItemCard(String opgName, String village, String item, String price, String imagePath, int rating) {
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
          Text(item),
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
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  // Handle decrease quantity
                },
                icon: Icon(Icons.remove),
              ),
              SizedBox(width: 5),
              Text('0 kg'), // Display quantity with unit
              SizedBox(width: 5),
              IconButton(
                onPressed: () {
                  // Handle increase quantity
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    ),
  );
} */

class CustomItemCard extends StatefulWidget {
  final String producer;
  final String adress;
  final ItemModel item;
  late String imagePath = "assets/zecov_logo.png";
  late int rating = 5;

  CustomItemCard(this.producer, this.adress, this.item);

  @override
  _CustomItemCardState createState() => _CustomItemCardState();
}

class _CustomItemCardState extends State<CustomItemCard> {
  int quantity = 0;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
    int index = cart.indexWhere((item) => item.uid == widget.item.uid);
    if (index != -1) {
      // If the item is found in the cart, update its quantity
      setState(() {
        if (cart[index].quantity != null) {
          cart[index].quantity = cart[index].quantity! + 1;
        }
      });
    } else {
      // If the item is not found in the cart, add it with quantity 1
      setState(() {
        cart.add(widget.item);
        int index = cart.indexWhere((item) => item.uid == widget.item.uid);
        cart[index].quantity = 1;
      });
    }
    print(cart);
  }

  void decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
      int index = cart.indexWhere((item) => item.uid == widget.item.uid);
      if (index != -1) {
        // If the item is found in the cart, update its quantity
        setState(() {
          if (cart[index].quantity != null) {
            cart[index].quantity = cart[index].quantity! -
                1; // Increment the quantity of the item in the cart
            if (cart[index].quantity == 0) {
              cart.remove(widget.item);
            }
          }
        });
      } else {
        setState(() {});
      }
    }
    print(cart);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    widget.imagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Proizvođač: ${widget.producer}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Adresa: ${widget.adress}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Proizvod: ${widget.item.name}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                          'Cijena ${widget.item.price} € (${(widget.item.price! * 7.54).toStringAsFixed(2)} kn)',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text(
                        widget.item.description,
                        softWrap: true,
                        maxLines: 2,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: const Color.fromARGB(255, 255, 218, 7),
                              size: 20),
                          const SizedBox(width: 5),
                          Text('${widget.rating.roundToDouble()}'),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: decrementQuantity,
                                  icon: Icon(Icons.remove),
                                  color: Colors.red,
                                ),
                                Text(
                                    '$quantity ${widget.item.unit.toString().split('.').last}'),
                                IconButton(
                                  onPressed: incrementQuantity,
                                  icon: Icon(Icons.add),
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
