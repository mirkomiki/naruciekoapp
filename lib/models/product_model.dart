<<<<<<< HEAD
class ProductModel {
  late final String ProductUid;
  late final String ProviderUid;
  final String name;
  final String description;
  final int cost;
  late final String provider;

  ProductModel(this.name, this.description, this.cost);
=======
enum Categories { food, drink, other }

enum Unit { kilogram, piece }

class ProductModel {
  final String id;
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

  ProductModel({required this.id});

  ProductModel.full(
      {required this.id,
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
>>>>>>> 298576901699f0ecc5ebb7c7b8d7906c09875d6b
}
