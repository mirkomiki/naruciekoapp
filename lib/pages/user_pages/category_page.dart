import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naruciekoapp/datatype/customItemCard.dart';
import 'package:naruciekoapp/models/item_models/item_model.dart';
import 'package:naruciekoapp/pages/user_pages/cartPage.dart';
import 'package:naruciekoapp/globalData.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  final String enums;
  const CategoryPage({Key? key, required this.category, required this.enums})
      : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late Future<List<ItemModel>> _itemsFuture;
  int _cartCount = 0;

  @override
  void initState() {
    super.initState();
    _itemsFuture = getItemsForCategory(widget.enums);
    _updateCartCount(); // Initialize cart count
  }

  // Callback function to update cart count
  void _updateCartCount() {
    int count = 0;
    cart.forEach((item) {
      count += item.quantity ?? 0;
    });
    setState(() {
      _cartCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ItemModel>>(
      future: _itemsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a loading indicator while data is being fetched
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          // Handle error
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          // Data has been fetched successfully
          List<ItemModel>? items = snapshot.data;
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              hoverColor: Colors.blue,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(Icons.shopping_basket_outlined, size: 55),
                ],
              ),
            ),
            appBar: AppBar(
              elevation: 5,
              title: Text('Trenutna ponuda - ${widget.category}'),
            ),
            body: ListView.builder(
              itemCount: items!.length,
              itemBuilder: (context, index) {
                return FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('producers')
                      .doc(items[index].producerUid)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Return a loading indicator while data is being fetched
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      // Handle error
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      // Data has been fetched successfully
                      String name = snapshot.data!['name'];
                      String address = snapshot.data!['adress'];
                      return CustomItemCard(
                        name,
                        address,
                        items[index],
                      );
                    }
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}

Future<List<ItemModel>> getItemsForCategory(String category) async {
  List<ItemModel> itemsList = [];
  CollectionReference producers =
      FirebaseFirestore.instance.collection('producers');

  QuerySnapshot producersSnapshot = await producers.get();
  for (DocumentSnapshot producerDoc in producersSnapshot.docs) {
    String producerId = producerDoc.id;
    CollectionReference itemsRef =
        producers.doc(producerId).collection('items');

    QuerySnapshot itemsSnapshot = await itemsRef.get();
    for (QueryDocumentSnapshot itemDoc in itemsSnapshot.docs) {
      Map<String, dynamic> data = itemDoc.data() as Map<String, dynamic>;
      if (data['category'].toString().split('.').last.toUpperCase() ==
          category.toUpperCase()) {
        itemsList.add(ItemModel(
          uid: data['uid'],
          producerUid: data['producerUid'],
          name: data['name'],
          price: data['price'],
          description: data['description'],
          quantity: data['quantity'],
          category: getCategoryFromString(data['category']),
          unit: getUnitFromString(data['unit']),
        ));
      }
    }
  }
  print(itemsList.length);
  return itemsList;
}

Unit getUnitFromString(String value) {
  switch (value) {
    case 'Unit.Kilogram':
      return Unit.Kilogram;
    case 'Unit.Gram':
      return Unit.Gram;
    case 'Unit.Litra':
      return Unit.Litra;
    case 'Unit.Mililitar':
      return Unit.Mililitar;
    case 'Unit.Komad':
      return Unit.Komad;
    default:
      throw ArgumentError('Invalid unit value: $value');
  }
}

Category getCategoryFromString(String value) {
  switch (value) {
    case 'Category.Voce':
      return Category.Voce;
    case 'Category.Povrce':
      return Category.Povrce;
    case 'Category.Meso':
      return Category.Meso;
    case 'Category.Sadnice':
      return Category.Sadnice;
    case 'Category.PicaIAlkohol':
      return Category.PicaIAlkohol;
    case 'Category.Jaja':
      return Category.Jaja;
    case 'Category.MlijecniProizvodi':
      return Category.MlijecniProizvodi;
    case 'Category.Med':
      return Category.Med;
    case 'Category.Dzemovi':
      return Category.Dzemovi;
    case 'Category.UljaIOcati':
      return Category.UljaIOcati;
    case 'Category.Ostalo':
      return Category.Ostalo;
    default:
      throw ArgumentError('Invalid category value: $value');
  }
}
