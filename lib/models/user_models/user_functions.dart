import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/models/user_models/user_model.dart';

class UserFunctions {
  final String? uid;
  UserFunctions({required this.uid});

  Future updateUserProfileImage(UserModel user) async {
    try {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');
      return await usersCollection
          .doc(uid)
          .update({'profile_image': user.profileImage});
    } catch (e) {
      print('Error in updateUserProfileImage, more: $e');
    }
  }

  Future updateUser(UserModel user) async {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    try {
      return await usersCollection.doc(uid).update({
        'id': uid,
        'email': user.email,
        'name': user.name,
        'surname': user.surname,
        'adress': user.adressName,
        'contact': user.contactNumber,
        'role': user.role,
        'profileImage': user.profileImage,
      });
    } catch (e) {
      print('Error in updateUser could be non existing producer, more: $e');
    }
  }

  /*
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
        'owner': producer.owner,
        'contact': producer.contactNumber,
      });
    } catch (e) {
      print('Error in updateProducer could be non existing producer, more: $e');
    }
  }
  */
}
