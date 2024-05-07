import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/pages/producer_pages/itemsPage.dart';

import '../globalData.dart';
import '../models/item_models/item_model.dart';

class CustomItemCardProducerView extends StatefulWidget {
  final ItemModel item;
  final Function() onDelete; // Add callback function
  CustomItemCardProducerView(
      {super.key, required this.item, required this.onDelete});
  @override
  _CustomItemCardProducerViewState createState() =>
      _CustomItemCardProducerViewState();
}

class _CustomItemCardProducerViewState
    extends State<CustomItemCardProducerView> {
  void incrementQuantity() async {
    setState(() {
      widget.item.quantity = widget.item.quantity! + 1;
    });
    try {
      await FirebaseFirestore.instance
          .collection('producers')
          .doc(globalUserUid)
          .collection('items')
          .doc(widget.item.uid)
          .update({'quantity': widget.item.quantity});
    } catch (e) {
      // Handle any errors
      print('Error updating quantity: $e');
    }
  }

  void decrementQuantity() async {
    if (widget.item.quantity! > 0) {
      // Decrement quantity locally
      setState(() {
        widget.item.quantity = widget.item.quantity! - 1;
      });
      // Update quantity in Firestore
      try {
        await FirebaseFirestore.instance
            .collection('producers')
            .doc(globalUserUid)
            .collection('items')
            .doc(widget.item.uid)
            .update({'quantity': widget.item.quantity});
      } catch (e) {
        // Handle any errors
        print('Error updating quantity: $e');
      }
    }
  }

  Future<void> deleteItemFromProducers() async {
    // Get a reference to the document you want to delete
    DocumentReference itemRef = FirebaseFirestore.instance
        .collection('producers')
        .doc(globalUserUid)
        .collection('items')
        .doc(widget.item.uid);

    // Delete the document
    await itemRef.delete();
    widget.onDelete();
    // Optionally, update the local state to reflect the deletion
    setState(() {
      // Remove the item from the list
    });
    @override
    void initState() {
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("ulazi ovdje");
    return Card(
      margin: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.item.name.toString()),
                Text(widget.item.category.toString()),
                Text(widget.item.description.toString()),
                Text(widget.item.price.toString()),
                Text(widget.item.unit.toString()),
                SizedBox(height: 5),
                SizedBox(width: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: decrementQuantity,
                      icon: Icon(Icons.remove),
                      color: Colors.red,
                    ),
                    Text(
                      '${widget.item.quantity}',
                      style: TextStyle(fontSize: 25),
                    ),
                    IconButton(
                      onPressed: incrementQuantity,
                      icon: Icon(Icons.add),
                      color: Colors.green,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.block),
                      onPressed: deleteItemFromProducers,

                      label: Text("Remove"),
                      //style: ButtonStyle(backgroundColor: Color(Colors.), surfaceTintColor: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
