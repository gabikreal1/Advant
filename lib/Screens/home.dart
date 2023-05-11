// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/Components/my_button.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<bool> _verificationReset = ValueNotifier<bool>(false);
  int _verificationTimerCounter = 60;
  Timer? verificationTimer;
  Timer? timer;
  final ValueNotifier<bool> _isEmailVerified = ValueNotifier<bool>(false);
  @override
  void initState() {
    super.initState();

    _isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!_isEmailVerified.value) {
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      verificationTimer = Timer.periodic(
          Duration(seconds: 1), (_) => {changeVerificationTimer()});
      timer =
          Timer.periodic(Duration(seconds: 3), (_) => {checkEmailVerified()});
    }
  }

  @override
  void dispose() {
    verificationTimer?.cancel();
    timer?.cancel();
    super.dispose();
  }

  void changeVerificationTimer() {
    if (_verificationTimerCounter > 1) {
      setState(() {
        _verificationTimerCounter -= 1;
      });
    } else {
      _verificationReset.value = true;
      setState(() {
        _verificationTimerCounter = 60;
      });
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    _isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;
    if (_isEmailVerified.value == true) {
      timer?.cancel();
      verificationTimer?.cancel();
    }
  }

  Future sendVerificationMail() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      setState(() {
        _verificationTimerCounter = 60;
      });
      _verificationReset.value = false;
    } finally {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: widget.signUserOut, icon: Icon(Icons.logout)),
      ]),
      body: AnimatedBuilder(
        animation: _isEmailVerified,
        builder: (context, Widget? child) {
          if (_isEmailVerified.value == true) {
            return Center(
              child: Text(
                "Logged In ${widget.user.email!}",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Verify Your Mail",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  AnimatedBuilder(
                      animation: _verificationReset,
                      builder: (context, Widget? child) {
                        if (_verificationReset.value == true) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: MyButton(
                              onTap: sendVerificationMail,
                              text: "Resend Verification",
                              color: Colors.white,
                              textColor: Colors.black,
                            ),
                          );
                        } else {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: MyButton(
                              onTap: () => {},
                              text:
                                  "Resend Verification ($_verificationTimerCounter) s",
                              color: Colors.grey,
                              textColor: Colors.black,
                            ),
                          );
                        }
                      }),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
