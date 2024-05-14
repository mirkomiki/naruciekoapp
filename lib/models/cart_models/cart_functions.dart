import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/models/product_for_order.dart';

class CartFunctions {
  late final String uid;
  final List<OrderedItem> orderedItems = List.empty();
  CartFunctions({required this.uid});
  /*
  void addItemToCart(OrderedItem item) => cart.orderedItems?.add(item);

  void removeItemFromCart(OrderedItem item) => cart.orderedItems?.remove(item);

  Future finishOrder(DeliveryOptions selectedOrderType) async {
    FirebaseFirestore.instance.collection('users');
    Map<String, List<OrderedItem>> orderByProducer = {};
    for (OrderedItem item in orderedItems) {
      String producerId = item.product.producerUid;
      orderByProducer.putIfAbsent(producerId, () => []);
      // Add the current item to the list for this producerId
      orderByProducer[producerId]?.add(item);

      makeOrderInUserOrders(orderByProducer, selectedOrderType);
      makeOrderInProducerOrders(orderByProducer, selectedOrderType);
    }
  }
  
  void removeAllFromCart() {
    cart.orderedItems = List.empty();
  }
  */
  void makeOrderInProducerOrders(Map<String, List<OrderedItem>> orderByProducer,
      DeliveryOptions selectedOrderType) {
    CollectionReference producersCollection =
        FirebaseFirestore.instance.collection('producers');
    orderByProducer.forEach((producerId, items) {
      double totalPrice = 0;
      CollectionReference ordersProducersCollection =
          producersCollection.doc(producerId).collection('orders');
      for (OrderedItem item in items) {
        totalPrice += item.product.price! * item.quantity;
      }
      DocumentReference doc = ordersProducersCollection.doc();
      doc.set({
        'uid': doc.id,
        'price': totalPrice,
        'customer': globalUser.uid,
        'orderType': selectedOrderType,
      });
    });
  }

  void makeOrderInUserOrders(Map<String, List<OrderedItem>> orderByProducer,
      DeliveryOptions selectedOrderType) {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    CollectionReference ordersUsersCollection =
        usersCollection.doc(globalUser.uid).collection('orders');
    orderByProducer.forEach((producerId, items) {
      double totalPrice = 0;
      for (OrderedItem item in items) {
        totalPrice += item.product.price! * item.quantity;
      }
      DocumentReference doc = ordersUsersCollection.doc();
      doc.set({
        'uid': doc.id,
        'producerId': producerId,
        'price': totalPrice,
        'orderType': selectedOrderType,
      });
    });
  }
}
