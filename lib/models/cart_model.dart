import 'package:naruciekoapp/models/product_for_order.dart';

class CartModel {
  final String id;
  final String customerId;
  late List<OrderedItem>? orderedItems;

  CartModel({required this.id, required this.customerId, this.orderedItems});

  void addItem(OrderedItem item) => orderedItems?.add(item);
}
