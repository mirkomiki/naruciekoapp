import "package:naruciekoapp/models/product_model.dart";

class ProducerModel {
  final String id;
  final String name;
  final String owner;
  final String email;
  late String? iban;
  late String? address;
  late String? contactNumber;
  List<ProductModel> products = [];
  double rating = 0;
  int _ratingSum = 0;
  int _numberOfRatings = 0;

  ProducerModel(
      {required this.id,
      required this.name,
      required this.owner,
      required this.email,
      this.iban,
      this.address,
      this.contactNumber});

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
