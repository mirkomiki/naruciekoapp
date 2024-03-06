import 'package:naruciekoapp/models/product_model.dart';

class OrderedItem {
  ProductModel product;
  double quantity;

  OrderedItem({required this.product, required this.quantity});
}
