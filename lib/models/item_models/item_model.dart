import 'package:naruciekoapp/globalData.dart';

class ItemModel {
  late String uid;
  final String producerUid;
  String? name;
  String photo = "";
  String description = "";
  double? price;
  Unit? unit;
  int? quantity = 0;
  double rating = 0;
  int _ratingSum = 0;
  int _numberOfRatings = 0;
  Category? category;

  ItemModel(
      {required this.uid,
      required this.producerUid,
      required this.name,
      required this.price,
      required this.description,
      required this.quantity,
      required this.category,
      required this.unit});

  void setName(String name) => this.name = name;

  void setPhoto(String photo) => this.photo = photo;

  void setDescription(String description) => this.description = description;

  void setPrice(double price) => this.price = price;

  void setUnit(Unit unit) => this.unit = unit;

  void setQuantity(int quantity) => this.quantity = quantity;

  void setCategory(Category category) => this.category = category;

  void addRating(int rating) {
    _numberOfRatings++;
    _ratingSum += rating;
    this.rating = _ratingSum / _numberOfRatings;
  }
}
