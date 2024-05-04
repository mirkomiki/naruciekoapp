import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/services/database.dart';

import '../globalData.dart';
import '../models/product_for_order.dart';

class CustomOrderCard extends StatefulWidget {
  final OrderedItem orderedItem;

  const CustomOrderCard({
    Key? key,
    required this.orderedItem,
  }) : super(key: key);

  @override
  State<CustomOrderCard> createState() => _CustomOrderCardState();
}

class _CustomOrderCardState extends State<CustomOrderCard> {
  void deleteItemFromOrders(BuildContext context) {
    setState(() {
      orders?.remove(widget.orderedItem);
    });

    // Show animated snack bar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Row(
          children: [
            Icon(Icons.check, color: Colors.white),
            SizedBox(width: 8),
            Text('Item completed', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orderedItem = widget.orderedItem;

    return AnimatedOpacity(
      opacity: orders!.contains(orderedItem) ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: orders!.contains(orderedItem)
          ? Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: ListTile(
                contentPadding: EdgeInsets.all(12),
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.shopping_cart, color: Colors.white),
                ),
                title: Text(
                  orderedItem.product.name!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Quantity: ${orderedItem.quantity.toInt()}'),
                trailing: IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () => deleteItemFromOrders(context),
                  color: Colors.green,
                ),
              ),
            )
          : SizedBox(),
    );
  }
}
