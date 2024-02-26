import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference naruciNaseCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name, String email, String role) async {
    try {
      return await naruciNaseCollection.doc(uid).set({
        'email': email,
        'name': name,
        'role': role,
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<QuerySnapshot> get narucinasedata {
    return naruciNaseCollection.snapshots();
  }
}
//ok expected time 15.3. zavrsena baza
//apliakcija gotova mjesec kasnije
//realno?
//ne znam
//urediti