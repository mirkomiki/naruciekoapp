import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naruciekoapp/datatype/customItemCardProdcerView.dart';
import 'package:naruciekoapp/datatype/custom_appbar.dart';
import 'package:naruciekoapp/models/item_models/item_model.dart';

import '../../globalData.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  List<ItemModel> itemsList = [];

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    print(
        "Global User UID: $globalUserUid"); // Check the value of globalUserUid
    final querySnapshot = await FirebaseFirestore.instance
        .collection("producers")
        .doc(globalUserUid)
        .collection("items")
        .get();

    print(
        "Number of Documents: ${querySnapshot.docs.length}"); // Check the number of documents returned

    setState(() {
      itemsList = querySnapshot.docs.map((doc) {
        final data = doc.data();
        print(data);

        // Check if all required fields exist in the document
        if (data.containsKey('name') &&
            data.containsKey('price') &&
            data.containsKey('quantity') &&
            data.containsKey('description') &&
            data.containsKey('category') &&
            data.containsKey('unit')) {
          // Convert fields to the appropriate types
          final double price = (data['price'] ?? 0.0).toDouble();
          final int quantity = (data['quantity'] ?? 0.0).toInt();

          // Convert category from String to Category enum
          Category category;
          if (data['category'] != null &&
              Category.values
                  .map((e) => e.toString())
                  .contains(data['category'])) {
            category = Category.values
                .firstWhere((e) => e.toString() == data['category']);
          } else {
            category = Category.Ostalo;
          }

          // Convert unit from String to Unit enum
          Unit unit;
          if (data['unit'] != null &&
              Unit.values.map((e) => e.toString()).contains(data['unit'])) {
            unit = Unit.values.firstWhere((e) => e.toString() == data['unit']);
          } else {
            unit = Unit.Komad;
          }

          return ItemModel(
              name: data['name'] ?? '',
              price: price,
              quantity: quantity,
              producerUid: globalUserUid,
              description: data['description'] ?? '',
              category: category,
              unit: unit,
              uid: doc.id);
        } else {
          // If any required field is missing, return a default ItemModel or handle the error accordingly
          return ItemModel(
              name: 'Unknown',
              price: 0.0,
              quantity: 0,
              producerUid: globalUserUid,
              description: '',
              category: Category.Ostalo,
              unit: Unit.Komad,
              uid: '1');
        }
      }).toList();
      print(itemsList.length); // Check the contents of itemsList
    });
  }

  @override
  Widget build(BuildContext context) {
    print('items length ${itemsList.length}');
    return Scaffold(
      appBar: AppBar(title: const Text('Lista proizvoda')),
      body: ListView.builder(
        itemCount: itemsList.length,
        itemBuilder: (context, index) {
          return CustomItemCardProducerView(
            item: itemsList[index],
            onDelete: () {
              // Remove the deleted item from itemsList
              setState(() {
                itemsList.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
