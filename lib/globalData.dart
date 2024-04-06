import 'package:naruciekoapp/models/cart_models/cart_model.dart';
import 'package:naruciekoapp/models/producer_models/producer_model.dart';
import 'package:naruciekoapp/models/user_models/user_model.dart';

int selectedPageIndex = 0;
int selectedProducerPageIndex = 0;
const double doubleGapBetweenContainers = 10.0;
const int intGapBetweenContainers = 10;
late ProducerModel globalProducer;
late String? globalUserUid;
late bool globalIsProducer;
UserModel globalUser =
    UserModel('', '', 'surname null', '', 'Number', '', 'user');
CartModel cart = CartModel(globalUser.uid, List.empty());

// ignore: constant_identifier_names
enum Categories {
  Voce,
  Povrce,
  Meso,
  Sadnice,
  PicaIAlkohol,
  Jaja,
  MlijecniProizvodi,
  Med,
  Dzemovi,
  UljaIOcati,
  Ostalo
}

// ignore: constant_identifier_names
enum Unit { Kilogram, Gram, Komad, Litra, Mililitar }

enum PaymentOptions { cash, creditCard }

enum DeliveryOptions { deliveryOnStation, deliveryOnAddress, pickUp }
