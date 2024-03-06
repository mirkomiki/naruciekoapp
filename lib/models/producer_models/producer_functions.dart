import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:naruciekoapp/models/item_models/item_model.dart';
import 'package:naruciekoapp/services/database.dart';

class ProducerFunctions {
  late final String? uid;
  ProducerFunctions({this.uid});
  Future updateItemToProducer(ItemModel item) async {
    try {
      CollectionReference itemsCollection = FirebaseFirestore.instance
          .collection('producers')
          .doc(uid)
          .collection('items');
      return await itemsCollection.doc(uid).set({
        'id': uid,
        'name': item.name,
        'price': item.price,
        'rating': item.rating,
        'category': item.category.toString(),
        'description': item.description,
        'unit': item.unit.toString(),
      });
    } catch (e) {
      print(e);
    }
  }

  Future removeItemFromProducer(ItemModel item) {
    CollectionReference itemsCollection = FirebaseFirestore.instance
        .collection('producers')
        .doc(uid)
        .collection('items');
    return itemsCollection.doc(item.uid).delete();
  }
}
