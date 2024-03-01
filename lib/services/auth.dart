import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:naruciekoapp/models/user_model.dart";
import "package:naruciekoapp/pages/wrapper.dart";
import "package:naruciekoapp/services/database.dart";

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(user.uid, '', '', '') : null;
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
      print("Error caught in registerWithEmailAndPassword");
      return null;
    }
  }

  Future registerProducerWithEmailAndPasswordinUsers(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      await DatabaseService(uid: user!.uid)
          .updateUserData('new user', email, 'producer');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print("Error caught in registerWithEmailAndPasswordinUsers");
      return null;
    }
  }

  Future registerProducerWithEmailAndPasswordinProducers(
      String email, String password) async {
    try {
      var currentProducer = {
        "email": email,
        "name": "new user",
        "role": "producer",
      };
      FirebaseFirestore.instance.collection("producers").add(currentProducer);
    } catch (e) {
      print("Error caught in registerWithEmailAndPasswordinProducers");
      return null;
    }
  }

  //method to sign in anonymous
  /*
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
  */

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

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return Wrapper();
    }
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return _userFromFirebaseUser(userCredential.user);
  }

  signUpWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    if (userCredential.additionalUserInfo!.isNewUser) {
      if (userCredential.user != null) {
        await DatabaseService(uid: userCredential.user!.uid).updateUserData(
            'new user', userCredential.user!.email.toString(), 'customer');
      }
    }
    return _userFromFirebaseUser(userCredential.user);
  }
}
