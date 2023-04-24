import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthSevice {
  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: gAuth.idToken,
      accessToken: gAuth.accessToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signUserInWithEmail(String username, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username.trim(), password: password);
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return "success";
  }
}
