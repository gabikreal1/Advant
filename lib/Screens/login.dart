// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Components/my_texfield.dart';
import 'package:login/Components/my_button.dart';
import 'package:login/Screens/forogot_pw.dart';
import 'package:login/Services/auth_service.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> signUserIn() async {
    //login
    final responseCode = await AuthService()
        .signUserInWithEmail(usernameController.text, passwordController.text);
    if (responseCode == "success") {
      Get.back();
    } else {
      // ignore: use_build_context_synchronously
      loginErrorDialogShower(responseCode, context);
    }
  }

  void loginErrorDialogShower(String responseCode, BuildContext context) {
    //wrong email
    if (responseCode == 'user-not-found') {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Incorrect Email'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text("Retry"))
            ],
            elevation: 24.0,
          );
        },
      );
    }

    //wrong password
    else if (responseCode == 'wrong-password') {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Incorrect Password'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text("Retry"))
            ],
            elevation: 24.0,
          );
        },
      );
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(responseCode),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text("Retry"))
            ],
            elevation: 24.0,
          );
        },
      );
    }
  }

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Image.asset(
                // "assets/splash.png",
                // width: 100,
                //height: 100,
                //),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  onSubm: signUserIn,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: Text('Forgot Password?',
                          style: TextStyle(color: Colors.grey[600])),
                      onTap: () => Get.to(ForgotPasswordPage(),
                          transition: Transition.rightToLeft, duration: 350.ms),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: MyButton(
                    padding: 25,
                    onTap: signUserIn,
                    text: "Sign In",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
