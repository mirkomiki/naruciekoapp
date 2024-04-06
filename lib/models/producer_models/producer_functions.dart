import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:naruciekoapp/models/item_models/item_model.dart';
import 'package:naruciekoapp/models/producer_models/producer_model.dart';
import 'package:naruciekoapp/services/database.dart';

class ProducerFunctions {
  late final String? uid;
  ProducerFunctions({this.uid});
  //update == create in firestore
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

  Future removeItemFromProducer(ItemModel item) async {
    CollectionReference itemsCollection = FirebaseFirestore.instance
        .collection('producers')
        .doc(uid)
        .collection('items');
    return await itemsCollection.doc(item.uid).delete();
  }

  Future updateProducerRating(ProducerModel producer, int rating) async {
    CollectionReference producersCollecion =
        FirebaseFirestore.instance.collection('producers');
    try {
      producer.addRating(rating);
      return await producersCollecion
          .doc(uid)
          .update({'rating': producer.rating});
    } catch (e) {
      print('Error in updateProducerRating, more: $e');
    }
  }

  Future updateProducer(ProducerModel producer) async {
    CollectionReference producersCollection =
        FirebaseFirestore.instance.collection('producers');
    try {
      return await producersCollection.doc(uid).update({
        'id': uid,
        'email': producer.email,
        'name': producer.name,
        'adress': producer.address,
        'iban': producer.iban,
        'oib': producer.oib,
        'owner': producer.owner,
        'contact': producer.contactNumber,
        'profileImage': producer.profileImage
      });
    } catch (e) {
      print('Error in updateProducer could be non existing producer, more: $e');
    }
  }
}
