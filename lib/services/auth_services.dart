import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../pages/home_page.dart';

class AuthService {
  // Google signIn
  signInWithGoogle(BuildContext context) async {
    // begin interactive process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    if (gUser != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    }
    // obtain user info on request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // log user in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

/*
Future<void> _handleSignIn() async {
  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    // Handle the signed-in user here

    if (googleUser != null) {
      // Navigate to the new screen after successful sign-in
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewScreen()),
      );
    }
  } catch (error) {
    // Handle sign-in errors
  }
}
 */