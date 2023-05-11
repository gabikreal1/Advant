// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/Screens/home.dart';
import 'package:login/Screens/login.dart';
import 'package:login/Screens/register.dart';

import 'package:login/Screens/start.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  void initState() {
    warmUp();
    super.initState();
  }

  final ValueNotifier<bool> _warmUped = ValueNotifier<bool>(false);

  Future warmUp() async {
    // This silly function is needed to remove jank from the first run screen transition...
    print('Running warmUp()');
    await Future.delayed(Duration(milliseconds: 100));
    // If not using Firebase, you'll have to add some other delay here!
    // Otherwise, you will get errors below for trying to push new screens
    // while the first one is still building.

    if (mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Register()));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Start()));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ); // Shows a spinner

      await Future.delayed(Duration(milliseconds: 1000));

      if (mounted) {
        Navigator.popUntil(context, (route) => route.isFirst);
      }
      _warmUped.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return AnimatedBuilder(
              animation: _warmUped,
              builder: (context, Widget? child) {
                if (_warmUped.value == true) {
                  return Start();
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
