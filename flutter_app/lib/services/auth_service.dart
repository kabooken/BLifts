import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.authenticate();
    final GoogleSignInAuthentication? googleAuth = googleUser?.authentication;
    final GoogleSignInClientAuthorization? googleClientAuth = await googleUser?.authorizationClient.authorizationForScopes(['email', 'profile']);

    final credential = GoogleAuthProvider.credential(
      accessToken: googleClientAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
  }

  Future<String?> registration({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  signOut() async {
    await _firebaseAuth.signOut();
  }

  // Check if user is logged in
  bool isLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }

  // Get user email
  String? getUserEmail() {
    return _firebaseAuth.currentUser?.email;
  }

  // Get user name
  String? getUserName() {
    return _firebaseAuth.currentUser?.displayName;
  }

  // Get user photo URL
  String? getUserPhotoUrl() {
    return _firebaseAuth.currentUser?.photoURL;
  }

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
}
