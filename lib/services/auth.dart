import "package:firebase_auth/firebase_auth.dart";
import "package:naruciekoapp/models/userModel.dart";
import "package:naruciekoapp/pages/wrapper.dart";

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserModel?> get user {
    try {
      return _auth.authStateChanges().map(_userFromFirebaseUser);
    } catch (e) {
      print("Caught an error in AuthService: $e");
      return Stream.empty();
    }
  }

  //method to sign in anonymous
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print("Caught an error in signInAnon: $e");
      return null; // Return null or handle the error as needed
    }
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return Wrapper();
    }
  }
}
