import "package:flutter/material.dart";
import "package:naruciekoapp/models/product_model.dart";

class ProducerModel {
  final String name;
  final List<ProductModel> products;
  final String email;
  final String adress;

  ProducerModel(
      {required this.name,
      required this.products,
      required this.email,
      required this.adress});
}
