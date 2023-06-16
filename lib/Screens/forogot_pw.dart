// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Components/my_texfield.dart';
import 'package:login/Components/my_button.dart';
import 'package:login/Services/auth_service.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController email = TextEditingController();

  void resetPasswordSubm() async {
    final responseCode = await AuthService().resetPassword(email.text);
    if (responseCode != "success") {
      errorDialogShower(responseCode, context);
    } else {
      Get.back();
    }
  }

  void errorDialogShower(String responseCode, BuildContext context) {
    //wrong email
    if (responseCode == 'user-not-found') {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('No user found with this Email address'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text("Retry"))
            ],
            elevation: 24.0,
          );
        },
      );
    } else {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Enter your Email and we will send you \n a password reset link",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MyTextField(
                controller: email,
                hintText: "Email",
                onSubm: resetPasswordSubm,
                obscureText: false,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: MyButton(
                padding: 25,
                onTap: resetPasswordSubm,
                text: "Reset Password",
              ),
            )
          ],
        ),
      ),
    );
  }
}
