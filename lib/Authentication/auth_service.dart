import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Login with Email/USN and Password
  Future<User?> login(String identifier, String password) async {
    try {
      // If using USN, you might need to map USN to an email format or search Firestore first
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: identifier, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Update Password and First Login Status
  Future<bool> updateInitialPassword(String newPassword) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // 1. Update Firebase Auth Password
        await user.updatePassword(newPassword);

        // 2. Update Firestore flag
        await _firestore.collection('users').doc(user.uid).update({
          'isFirstLogin': false,
        });
        return true;
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // Check user role and login status
  Future<DocumentSnapshot> getUserData(String uid) async {
    return await _firestore.collection('users').doc(uid).get();
  }
}