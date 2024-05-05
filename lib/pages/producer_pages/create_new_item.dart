import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/datatype/customTextField.dart';
import 'package:naruciekoapp/models/item_models/item_model.dart';

import '../../datatype/customButton.dart';
import '../../globalData.dart' as app;
import '../../globalData.dart';

class CreateNewItem extends StatefulWidget {
  const CreateNewItem({Key? key}) : super(key: key);

  @override
  State<CreateNewItem> createState() => _CreateNewItemState();
}

class _CreateNewItemState extends State<CreateNewItem> {
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  app.Unit? selectedUnit;
  app.Category? selectedCategory;

  Future<void> finishCreateItem() async {
    String itemName = nameController.text;
    int itemQuantity = int.tryParse(quantityController.text) ?? 0;
    double itemPrice = double.tryParse(priceController.text) ?? 0;
    String itemDescription = descriptionController.text;
    if (itemName.isNotEmpty &&
        itemQuantity > 0 &&
        itemPrice > 0 &&
        selectedUnit != null &&
        selectedCategory != null) {
      print('Item saved:');
      print('Name: $itemName');
      print('Quantity: $itemQuantity');
      print('Price: $itemPrice');
      print('Unit: $selectedUnit');
      print('Category: $selectedCategory');
      CollectionReference itemsRef = FirebaseFirestore.instance
          .collection("producers")
          .doc(globalUserUid)
          .collection("items");
      print("Test1");

      await itemsRef.add({
        'producerUid': globalUserUid,
        'name': itemName,
        'quantity': itemQuantity,
        'price': itemPrice,
        'category': selectedCategory.toString(),
        'description': itemDescription,
        'unit': selectedUnit.toString(),
        'uid': '',
      }).then((value) {
        print("Test2");
        // Fetch the newly added document ID and use it
        String docId = value.id;
        print('Document ID: $docId');
        value.update({'uid': docId});
        setState(() {
          items.add(ItemModel(
            // Assuming ItemModel constructor requires these fields
            uid: docId,
            producerUid: globalUser.uid,
            name: itemName,
            quantity: itemQuantity,
            price: itemPrice,
            category: selectedCategory!,
            description: itemDescription,
            unit: selectedUnit!,
          ));
        });
      });

      // Display success message
      AnimatedSnackBar.material(
        'Dodan proizvod na Vašu listu',
        type: AnimatedSnackBarType.success,
        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      ).show(context);
    } else {
      // Display error message
      AnimatedSnackBar.material(
        'Error: Please fill all fields and select a category and unit',
        type: AnimatedSnackBarType.warning,
        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      ).show(context);
    }
    nameController = TextEditingController();
    quantityController = TextEditingController();
    priceController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text('Add Item'),
          backgroundColor: Colors.green,
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  CustomTextField(
                    controller: nameController,
                    hintText: 'Name',
                    obsureText: false,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: CustomTextField(
                          controller: quantityController,
                          hintText: 'Quantity',
                          obsureText: false,
                        ),
                      ),
                      const SizedBox(width: 10), // Add space between fields
                      Flexible(
                        flex: 3,
                        child: Stack(
                          children: [
                            CustomTextField(
                              controller: priceController,
                              hintText: 'Price',
                              obsureText: false,
                            ),
                            Positioned(
                              right: 0,
                              bottom: 8,
                              child: Text(
                                '€',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  DropdownButtonFormField<app.Category>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Category',
                    ),
                    value: selectedCategory,
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    },
                    items: app.Category.values.map((category) {
                      return DropdownMenuItem<app.Category>(
                        value: category,
                        child: Text(category.toString().split('.').last),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 15),
                  DropdownButtonFormField<app.Unit>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Unit',
                    ),
                    value: selectedUnit,
                    onChanged: (value) {
                      setState(() {
                        selectedUnit = value;
                      });
                    },
                    items: app.Unit.values.map((unit) {
                      return DropdownMenuItem<app.Unit>(
                        value: unit,
                        child: Text(unit.toString().split('.').last),
                      );
                    }).toList(),
                  ),
                  const Padding(padding: EdgeInsets.all(25)),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      hintText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    maxLines:
                        6, // Set maxLines to null for unlimited lines or a specific number for limited lines
                  ),
                  const Padding(padding: EdgeInsets.all(25)),
                  CustomButton(
                    onTap: finishCreateItem,
                    text: 'Save changes',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
