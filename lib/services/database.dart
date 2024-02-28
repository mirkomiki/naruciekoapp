import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naruciekoapp/models/user_model.dart';

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

  List<UserModel> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserModel(doc.id, doc['name'] ?? 'no-name',
          doc['email'] ?? 'testnimail@mail.com', doc['role'] ?? 'customer');
    }).toList();
  }

  Stream<List<UserModel>> get users {
    return naruciNaseCollection.snapshots().map(_userListFromSnapshot);
  }
}
//ok expected time 15.3. zavrsena baza
//apliakcija gotova mjesec kasnije
//realno?
//ne znam
//urediti