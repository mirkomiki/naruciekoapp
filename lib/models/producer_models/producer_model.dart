import 'package:flutter/material.dart';
import 'package:naruciekoapp/models/item_models/item_model.dart';

class ProducerModel {
  final String uid;
  late String name;
  late String owner;
  late String email;
  late String iban;
  late String oib;
  late String address;
  late String contactNumber;
  late List<ItemModel> products = [];
  late double rating = 0;
  late int _ratingSum = 0;
  late int _numberOfRatings = 0;
  Image profileImage = Image.asset("assets/blank-profile-image.jpg");

  ProducerModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.address,
  });

  void setName(String name) => this.name = name;

  void setOwner(String owner) => this.owner = owner;

  void setEmail(String email) => this.email = email;

  void setAddress(String address) => this.address = address;

  void setContactNumber(String contactNumber) =>
      this.contactNumber = contactNumber;

  void setIban(String iban) => this.iban = iban;

  void addRating(int rating) {
    _numberOfRatings++;
    _ratingSum += rating;
    this.rating = _ratingSum / _numberOfRatings;
  }

  void addProduct(ItemModel product) => products.add(product);

  void removeProduct(ItemModel product) => products.remove(product);
}
