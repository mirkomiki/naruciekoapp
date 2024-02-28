import "package:naruciekoapp/models/product_model.dart";

class ProducerModel {
  final String id;
  String? name;
  String? owner;
  String? email;
  String? iban;
  String? address;
  String? contactNumber;
  List<ProductModel> products = [];
  double rating = 0;
  int _ratingSum = 0;
  int _numberOfRatings = 0;

  ProducerModel({required this.id});

  ProducerModel.full(
      {required this.id,
      this.name,
      this.owner,
      this.email,
      this.iban,
      this.address,
      this.contactNumber});

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

  void addProduct(ProductModel product) => products.add(product);

  void removeProduct(ProductModel product) => products.remove(product);

}
