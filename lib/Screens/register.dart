// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Components/my_texfield.dart';
import 'package:login/Components/my_button.dart';
import 'package:login/Services/auth_service.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    final responseCode = await AuthService().signUserUpWithEmail(
        emailController.text,
        passwordController.text,
        passwordCheckController.text);
    Navigator.pop(context);
    if (responseCode == "success") {
      Get.back();
    } else {
      // ignore: use_build_context_synchronously
      registerErrorDialogShower(responseCode, context);
    }
  }

  void registerErrorDialogShower(String responseCode, BuildContext context) {
    //wrong email
    if (responseCode == 'email-already-in-use') {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Email Already In Use'),
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
    else if (responseCode == 'passwords-do-not-match') {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Passwords Do Not Match'),
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

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordCheckController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/splash.png",
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ).animate().slide(delay: 100.ms).fade(),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ).animate().slide(delay: 200.ms).fade(),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordCheckController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                  onSubm: signUserUp,
                ).animate().slide(delay: 300.ms).fade(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: MyButton(
                    padding: 25,
                    onTap: signUserUp,
                    text: "Create Account",
                  ).animate().slide(delay: 400.ms).fade(),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Text('Or continue with')
                          .animate()
                          .slide(delay: 500.ms)
                          .fade(),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ).animate().slide(delay: 500.ms).fade(),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: StadiumBorder(),
                      ),
                      onPressed: () async {
                        CircularProgressIndicator();
                        await AuthService().signInWithGoogle();

                        Get.back();
                      },
                      child: Row(children: [
                        Image.asset(
                          "assets/google.png",
                          width: 25,
                          height: 25,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "CONTINUE WITH GOOGLE",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ])).animate().slide(delay: 600.ms).fade(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
