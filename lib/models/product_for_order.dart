import 'package:naruciekoapp/models/item_models/item_model.dart';

class OrderedItem {
  String uid;
  ItemModel product;
  int quantity;

  OrderedItem(
      {required this.uid, required this.product, required this.quantity});
}
