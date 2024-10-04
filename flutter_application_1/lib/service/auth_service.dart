import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<String?> reqistration(
      {required String email,
      required String password,
      required String confirm}) async {
    try {
      // Check if password matches confirm password
      if (password != confirm) {
        return 'Passwords do not match';
      }

      // Proceed with user creation
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> signin({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }
}
