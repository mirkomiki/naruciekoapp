import "package:firebase_auth/firebase_auth.dart";
import 'package:naruciekoapp/models/user_model.dart';
import "package:naruciekoapp/pages/wrapper.dart";
import "package:naruciekoapp/services/database.dart";

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

  //siginwith email and password method code to firebase
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print("Error caught in signInWithEmailAndPassword");
      return null;
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

  //nadopuniti
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      await DatabaseService(uid: user!.uid)
          .updateUserData('new user', email, 'customer');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print("Error caught in registerWithEmailAndPassword");
      return null;
    }
  }

  Future registerProducerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      await DatabaseService(uid: user!.uid)
          .updateUserData('new user', email, 'producer');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print("Error caught in registerWithEmailAndPassword");
      return null;
    }
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return Wrapper();
    }
  }

  signInWithGoogle() {}
  /*
  static final GoogleSignIn _googleSignIn = GoogleSignIn(); // <----
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  Map<String, dynamic>? userData;
  signInWithGoogle() async{
    
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  */
}
