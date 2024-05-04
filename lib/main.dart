import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/pages/splash_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "narucinase",
    options: const FirebaseOptions(
        apiKey: "AIzaSyDhkP8vef6HpVYg6TRKybQksP0NI-UYD8g",
        appId: "1:92670486512:android:6f4dff989f4a299828df35",
        messagingSenderId: "92670486512",
        storageBucket: "gs://narucinase.appspot.com",
        projectId: "narucinase"),
  );
  final storageRef = FirebaseStorage.instance.ref();
  // Create a reference to "mountains.jpg"
  final mountainsRef = storageRef.child("apple1.jpg");

  // Create a reference to 'images/mountains.jpg'
  final mountainImagesRef = storageRef.child("assets/apple1.jpg");

  // While the file names are the same, the references point to different files
  assert(mountainsRef.name == mountainImagesRef.name);
  assert(mountainsRef.fullPath != mountainImagesRef.fullPath);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: SplashScreen(),
    );
  }
}
