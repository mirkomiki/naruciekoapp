import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:naruciekoapp/datatype/customButton.dart';
import 'package:naruciekoapp/datatype/customTextField.dart';
import 'package:naruciekoapp/datatype/squareTile.dart';
import 'package:naruciekoapp/pages/authentication/login.dart';
import 'package:naruciekoapp/pages/authentication/login_or_register.dart';
import 'package:naruciekoapp/pages/authentication/search_places_screen.dart';
import 'package:naruciekoapp/services/auth.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class RegisterProducerPage extends StatefulWidget {
  const RegisterProducerPage({super.key});
  @override
  State<RegisterProducerPage> createState() => _RegisterProducerPageState();
}

class _RegisterProducerPageState extends State<RegisterProducerPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  final AuthService _auth = AuthService();

  bool validator() {
    if (emailController.text == "") return false;
    if (passwordController.text == "") return false;
    if (cpasswordController.text == "") return false;
    if (passwordController.text.length < 6 ||
        cpasswordController.text.length < 6) return false;
    if (passwordController.text != cpasswordController.text) return false;
    return true;
  }
  //DONNA!!! DONA
  //napravi funkciju sa drugacijim porukama sa alert dialogima

  void becomeProducer() async {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (validator()) {
        FirebaseAuth.instance.signOut();
        _auth.registerProducerWithEmailAndPassword(emailController.text,
            passwordController.text, selectedLocationValue);
        print('clicked on registerProducer');
        Navigator.pop(context);
      } else {
        showDialog(
            context: context,
            useSafeArea: false,
            barrierDismissible: false,
            builder: (context) {
              Future.delayed(Duration(seconds: 2), () {
                Navigator.of(context).pop(true);
              });
              return AlertDialog(title: Text("Wrong credentials"));
            });
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      wrongEmailPasswordMessage();
    }
    setState(() {});
  }

  void wrongEmailPasswordMessage() {
    showDialog(
        context: context,
        useSafeArea: false,
        builder: (context) {
          return const AlertDialog(title: Text('Wrong Credentials2'));
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future navigateAndImportSelectedLocation(BuildContext context) async {
    PickedData result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SearchPlacesScreen()));
    //if (!context.mounted) return;
    //setState(() {});
    return result;
  }

  late PickedData pickedData;
  String selectedLocationValue = " TEST ";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Registracija kao proizvođač",
              style: TextStyle(color: Colors.grey[700], fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            const Icon(
              Icons.lock,
              size: 100,
            ),
            const SizedBox(
              height: 25,
            ),
            //welcome
            Text(
              'Dobrodošli na vašu e-tržnicu',
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            ),
            const SizedBox(
              height: 25,
            ),
            // username
            CustomTextField(
                controller: emailController,
                hintText: 'Email',
                obsureText: false),
            //password
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                controller: passwordController,
                hintText: 'Loznika',
                obsureText: true),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                controller: cpasswordController,
                hintText: 'Potvrdi lozinku',
                obsureText: true),
            //forgot password
            SizedBox(
              height: 10,
            ),
            CustomButton(
                onTap: () async {
                  pickedData = await navigateAndImportSelectedLocation(context);

                  setState(() {
                    selectedLocationValue = pickedData.address;
                  });
                },
                text: "Odaberi lokaciju"),

            Text('LOKACIJA: $selectedLocationValue'),
            const SizedBox(
              height: 25,
            ),
            //sign in button
            CustomButton(
              text: 'Register as Producer',
              onTap: becomeProducer,
            ),
            //or continue with
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Ili nastavi sa',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
            //google+apple+facebook sign in button
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Već si se registrirao?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginRegisterPage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Ulogiraj se',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            //not a member register now
          ]),
        ),
      ),
    );
  }
}
