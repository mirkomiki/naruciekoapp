import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/pages/splash_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'narucinase',
    options: const FirebaseOptions(
        apiKey: "AIzaSyDhkP8vef6HpVYg6TRKybQksP0NI-UYD8g",
        appId: "1:92670486512:android:6f4dff989f4a299828df35",
        messagingSenderId: "92670486512",
        storageBucket: "gs://narucinase.appspot.com",
        projectId: "narucinase"),
  );
  //proba, maknuti
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
