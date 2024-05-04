import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/models/cart_models/cart_model.dart';

class OrderProducerModel {
  final String uid;
  final String customerId;
  late CartModel? cart;
  late DateTime? dateOfOrder;
  late DateTime? dateOfDelivery; //  dodaje se naknadno
  late PaymentOptions? payment;
  late DeliveryOptions? delivery;

  OrderProducerModel(
      {required this.uid,
      required this.customerId,
      this.cart,
      this.dateOfOrder,
      this.payment,
      this.delivery});
}
