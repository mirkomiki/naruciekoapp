import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/models/producer_model.dart';
import 'package:naruciekoapp/models/product_model.dart';
import 'package:naruciekoapp/models/user_model.dart';
import 'package:naruciekoapp/pages/LandingPages/home.dart';
import 'package:naruciekoapp/pages/LandingPages/pages.dart';
import 'package:naruciekoapp/pages/wrapper.dart';
import 'package:naruciekoapp/services/auth.dart';
import 'package:naruciekoapp/services/database.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDhkP8vef6HpVYg6TRKybQksP0NI-UYD8g",
        appId: "1:92670486512:android:6f4dff989f4a299828df35",
        messagingSenderId: "92670486512",
        projectId: "narucinase"),
  );
  FirebaseFirestore db = FirebaseFirestore.instance;
  ProductModel item = ProductModel("mlijko", "descripcija", 12);

  db.collection("proizvodi").add(createItem(item)); //proba
  runApp(const MyApp());
}

Map<String, String> createItem(ProductModel item) {
  Map<String, String> itemmap = <String, String>{};
  itemmap.addAll({
    'name': item.name,
    'description': item.description,
    "cost": item.cost.toString(),
  });

  return itemmap;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: UserModel('', '', '', ''), // DULJINA 11 VELIKO X
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
