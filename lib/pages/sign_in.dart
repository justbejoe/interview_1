import 'package:flutter/material.dart';
import 'package:interview_1/services/auth_services.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Sign In with Google"),
          Center(
            child: GestureDetector(
              onTap: () {
                AuthService().signInWithGoogle(context);
              },
              child: Image.asset(
                "assets/images/logo.png",
                scale: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
