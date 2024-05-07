import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:naruciekoapp/models/cart_models/cart_model.dart';
import 'package:naruciekoapp/models/item_models/item_model.dart';
import 'package:naruciekoapp/models/market_models/market_model.dart';
import 'package:naruciekoapp/models/order_model.dart';
import 'package:naruciekoapp/models/order_producer_model.dart';
import 'package:naruciekoapp/models/producer_models/producer_model.dart';
import 'package:naruciekoapp/models/product_for_order.dart';
import 'package:naruciekoapp/models/user_models/user_model.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

int selectedPageIndex = 0;
int selectedProducerPageIndex = 0;
const double doubleGapBetweenContainers = 10.0;
const int intGapBetweenContainers = 10;
ProducerModel globalProducer =
    ProducerModel(uid: '', name: 'Nema ime', email: '', address: '');
String globalUserUid = FirebaseAuth.instance.currentUser!.uid;
late bool globalIsProducer;
UserModel globalUser = UserModel('', '', '', '', 'Number', '', 'user');
//CartModel cart = CartModel(globalUser.uid, List.empty());
List<ItemModel> cart = [];

// ignore: constant_identifier_names
enum Category {
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

enum MarketsEnum { Dolac, DubravaG, Tresnjevka }

List<MarketModel> markets = [
  MarketModel(
      latLong: LatLong(45.8142658, 15.977333529826247),
      marketEnum: MarketsEnum.Dolac),
  MarketModel(
      latLong: LatLong(45.8313009, 16.05778658551654),
      marketEnum: MarketsEnum.DubravaG),
  MarketModel(
      latLong: LatLong(45.798675900000006, 15.953866778021933),
      marketEnum: MarketsEnum.Tresnjevka)
];

List<OrderedItem> orders = [
  OrderedItem(
      uid: "1",
      product: ItemModel(
          uid: '1',
          producerUid: globalUser.uid,
          name: "Jabuke",
          price: 7,
          description: "Voce neko",
          category: Category.Voce,
          unit: Unit.Kilogram,
          quantity: 5),
      quantity: 7),
  OrderedItem(
      uid: "2",
      product: ItemModel(
          uid: '2',
          producerUid: globalUser.uid,
          name: "Jabuke2",
          price: 7,
          description: "Voce neko2",
          category: Category.Voce,
          unit: Unit.Kilogram,
          quantity: 3),
      quantity: 4),
];
List<ItemModel> items = [];
