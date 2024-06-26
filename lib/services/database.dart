import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naruciekoapp/models/producer_models/producer_model.dart';
import 'package:naruciekoapp/models/user_models/user_model.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  //collections reference
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference producersCollection =
      FirebaseFirestore.instance.collection('producers');
  //update data
  Future updateUserData(String name, String email, String role) async {
    try {
      return await usersCollection.doc(uid).set({
        'id': uid,
        'email': email,
        'name': name,
        'role': role,
      });
    } catch (e) {
      print(e);
    }
  }

  Future updateProducerData(
      String name, String email, String adressName) async {
    try {
      return await producersCollection.doc(uid).set({
        'id': uid,
        'email': email,
        'name': name,
        'adress': adressName,
      });
    } catch (e) {
      print(e);
    }
  }

  List<UserModel> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserModel(
          doc.id,
          doc['name'] ?? 'no-name',
          doc['surname'] ?? 'no-surname',
          doc['email'] ?? 'testnimail@mail.com',
          doc['contactNumber'] ?? '0981940660',
          doc['adressName'] ?? 'nema adresu',
          doc['role'] ?? 'customer');
    }).toList();
  }

  Stream<List<UserModel>> get users {
    return usersCollection.snapshots().map(_userListFromSnapshot);
  }

  List<ProducerModel> _producerListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      print(doc.id);
      return ProducerModel(
          uid: doc.id,
          name: doc['name'] ?? 'no-name',
          email: doc['email'] ?? 'No Email Adress',
          address: doc['adress']);
    }).toList();
  }

  Stream<List<ProducerModel>> get producers {
    print('geta producer iz databaze');
    return producersCollection.snapshots().map(_producerListFromSnapshot);
  }
}

//ok expected time 15.3. zavrsena baza
//apliakcija gotova mjesec kasnije
//realno?
//ne znam
//urediti