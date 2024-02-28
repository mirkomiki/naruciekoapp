import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naruciekoapp/models/product_model.dart';
import 'package:naruciekoapp/models/user_model.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference naruciNaseCollection =
      FirebaseFirestore.instance.collection('users');

  //users = customers + producers
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

  //product
  Future updateProductData(String name, String productUid, String providerUid,
      double cost, String description) async {
    try {
      return await naruciNaseCollection.doc(uid).set({
        'name': name,
        'productUid': productUid,
        'providerUid': providerUid,
        'cost': cost,
        'description': description
      });
    } catch (e) {
      print(e);
    }
  }

  List<ProductModel> _productListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return ProductModel(
          id: doc.id,
          providerId: doc['providerUid'],
          name: doc['name'] ?? 'no-name',
          price: doc['cost'] ?? 'no-cost',
          description: doc['description'] ?? 'no-description');
    }).toList();
  }

  Stream<List<ProductModel>> get products {
    return naruciNaseCollection.snapshots().map(_productListFromSnapshot);
  }
}
