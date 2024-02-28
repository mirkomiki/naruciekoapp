enum Categories { food, drink, other }

enum Unit { kilogram, piece }

class ProductModel {
  final String id;
  final String providerId;
  late String name;
  String? photo;
  late String description;
  late double price;
  late Unit? unit;
  late double? quantity;
  double rating = 0;
  int _ratingSum = 0;
  int _numberOfRatings = 0;
  late Categories? category;

  ProductModel(
      {required this.id,
      required this.providerId,
      required this.name,
      required this.description,
      required this.price,
      this.photo,
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
