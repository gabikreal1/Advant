import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class AuthService {
  late String userToken;

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: gAuth.idToken,
        accessToken: gAuth.accessToken,
      );

      //implement link request

      //fetching the UserIdToken for  NestJs part of the backend

      var user = await FirebaseAuth.instance.signInWithCredential(credential);

      userToken = await FirebaseAuth.instance.currentUser!.getIdToken();
      try {
        var res = await http.get(
          Uri.http('localhost:3000', '/users/findall'),
          headers: {'Authorization': 'Bearer $userToken'},
        );
        print(res.statusCode);
        print(res.body);
      } catch (e) {
        print(e);
      }

      return user;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  signUserInWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      userToken = await FirebaseAuth.instance.currentUser!.getIdToken();
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return "success";
  }

  signUserUpWithEmail(
      String email, String password, String passwordconfiramtion) async {
    if (password != passwordconfiramtion) {
      return "passwords-do-not-match";
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return "success";
  }

  resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return "success";
  }
}
