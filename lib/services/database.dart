import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naruciekoapp/models/user_model.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference naruciNaseCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference ProizvodiCollection =
      FirebaseFirestore.instance.collection('proizvodi');

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

<<<<<<< HEAD
  Future updateProizvodData(String name, String description) async {
    try {
      return await ProizvodiCollection.doc(uid).set({
        'name': name,
        'description': description,
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<QuerySnapshot> get narucinasedata {
    return naruciNaseCollection.snapshots();
=======
  List<UserModel> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserModel(doc.id, doc['name'] ?? 'no-name',
          doc['email'] ?? 'testnimail@mail.com', doc['role'] ?? 'customer');
    }).toList();
  }

  Stream<List<UserModel>> get users {
    return naruciNaseCollection.snapshots().map(_userListFromSnapshot);
>>>>>>> 298576901699f0ecc5ebb7c7b8d7906c09875d6b
  }
}

//ok expected time 15.3. zavrsena baza
//apliakcija gotova mjesec kasnije
//realno?
//ne znam
//urediti