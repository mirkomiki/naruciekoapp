import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naruciekoapp/datatype/custom_loader.dart';
import 'package:naruciekoapp/pages/wrapper.dart';
import 'package:naruciekoapp/services/user_managment.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => UserManagment().handleAuth()));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.blue],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            children: [
              Image.asset('assets/zecov_logo.png', scale: 3.0),
              Text(
                "Dobrodošao u",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "NaručiNase",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              const CustomLoader(
                customScale: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
