import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/models/producer_models/producer_model.dart';
import 'package:naruciekoapp/models/item_models/item_model.dart';
import 'package:naruciekoapp/models/user_models/user_model.dart';
import 'package:naruciekoapp/pages/user_pages/pages.dart';
import 'package:naruciekoapp/pages/splash_screen.dart';
import 'package:naruciekoapp/pages/wrapper.dart';
import 'package:naruciekoapp/services/auth.dart';
import 'package:naruciekoapp/services/database.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDhkP8vef6HpVYg6TRKybQksP0NI-UYD8g",
        appId: "1:92670486512:android:6f4dff989f4a299828df35",
        messagingSenderId: "92670486512",
        projectId: "narucinase"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: SplashScreen(),
    );
  }
}
