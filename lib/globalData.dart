import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/models/producer_models/producer_model.dart';
import 'package:naruciekoapp/models/user_models/user_model.dart';

int selectedPageIndex = 0;
int selectedProducerPageIndex = 0;
const double doubleGapBetweenContainers = 10.0;
const int intGapBetweenContainers = 10;
late ProducerModel globalProducer;
late String? globalUserUid;
late bool globalIsProducer;
late UserModel globalUser;

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
