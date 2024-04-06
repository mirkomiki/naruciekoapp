import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/models/cart_models/cart_model.dart';

class OrderModel {
  final String id;
  final String customerId;
  final String deliveryPersonId;
  late CartModel? cart;
  late double cost; //  treba izracunati
  late DateTime? dateOfOrder;
  late DateTime? dateOfDelivery; //  dodaje se naknadno
  late PaymentOptions? payment;
  late DeliveryOptions? delivery;

  OrderModel(
      {required this.id,
      required this.customerId,
      required this.deliveryPersonId,
      this.cart,
      this.cost = 0,
      this.dateOfOrder,
      this.payment,
      this.delivery});
}
