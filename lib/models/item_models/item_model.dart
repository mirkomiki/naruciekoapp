import 'package:naruciekoapp/globalData.dart';

class ItemModel {
  final String uid;
  String? name;
  String photo = "";
  String description = "";
  double? price;
  Unit? unit;
  double? quantity;
  double rating = 0;
  int _ratingSum = 0;
  int _numberOfRatings = 0;
  Categories? category;

  ItemModel(int i, {required this.uid});

  ItemModel.full(
      {required this.uid,
      this.name,
      this.price,
      this.unit,
      this.quantity,
      this.category});

  void setName(String name) => this.name = name;

  void setPhoto(String photo) => this.photo = photo;

  void setDescription(String description) => this.description = description;

  void setPrice(double price) => this.price = price;

  void setUnit(Unit unit) => this.unit = unit;

  void setQuantity(double quantity) => this.quantity = quantity;

  void setCategory(Categories category) => this.category = category;

  void addRating(int rating) {
    _numberOfRatings++;
    _ratingSum += rating;
    this.rating = _ratingSum / _numberOfRatings;
  }
}
