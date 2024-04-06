import 'package:naruciekoapp/models/product_for_order.dart';

class CartModel {
  final String uid;
  late List<OrderedItem>? orderedItems;

  CartModel(this.uid, this.orderedItems);
}
