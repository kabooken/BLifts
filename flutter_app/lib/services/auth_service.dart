import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthService {
  static final AuthService _instance = AuthService._internal();
  bool _googleInitialized = false; 

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<void> _ensureGoogleInitialized() async {
    try {
      if (!_googleInitialized) {
        await _googleSignIn.initialize(clientId: _firebaseAuth.app.options.appId);
        _googleInitialized = true;
      }
    } catch (e) {
      print('Error during Google Sign-In initialization: $e');
      rethrow;
    }
  }


  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      await _ensureGoogleInitialized();

      if (kIsWeb) {
        // Web-specific implementation
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        
        // Optional: Add scopes
        googleProvider.addScope('email');
        
        // Sign in with popup
        return await _firebaseAuth.signInWithPopup(googleProvider);
        
        // OR use redirect (better for mobile browsers)
        // await _firebaseAuth.signInWithRedirect(googleProvider);
        // return await _firebaseAuth.getRedirectResult();
        
      } else {
        final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate();
        
        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth = googleUser!.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(idToken: googleAuth!.idToken);

        // Once signed in, return the UserCredential
        return await _firebaseAuth.signInWithCredential(credential);
      }
    }
    catch (e) {
      print('Error during Google Sign-In: $e');
      rethrow;
    }
  }

  Future<String?> registration({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
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
      await _firebaseAuth.signInWithEmailAndPassword(
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
