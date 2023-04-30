import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/Components/my_texfield.dart';
import 'package:login/Components/my_button.dart';
import 'package:login/Services/auth_service.dart';
import 'package:flutter_animate/flutter_animate.dart';

class webLogin extends StatefulWidget {
  const webLogin({super.key});

  @override
  State<webLogin> createState() => _webLoginState();
}

class _webLoginState extends State<webLogin> {
  Future<void> signUserIn() async {
    //login
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    final responseCode = await AuthService()
        .signUserInWithEmail(usernameController.text, passwordController.text);
    Navigator.pop(context);
    if (responseCode == "success") {
      context.pop();
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
                Text("Login"),
                const SizedBox(height: 25),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Email',
                  obscureText: false,
                ).animate().slide(delay: 100.ms).fade(),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  onSubm: signUserIn,
                ).animate().slide(delay: 200.ms).fade(),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: Text('Forgot Password?',
                          style: TextStyle(color: Colors.grey[600])),
                      onTap: () => {},
                    ).animate().slide(delay: 200.ms).fade(),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: MyButton(
                    onTap: signUserIn,
                    text: "Sign In",
                    color: Colors.black,
                  ).animate().slide(delay: 300.ms).fade(),
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
                          .slide(delay: 400.ms)
                          .fade(),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ).animate().slide(delay: 400.ms).fade(),
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
                      await AuthService().signInWithGoogle();

                      context.pop();
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/google.png",
                          width: 25,
                          height: 25,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "SIGN IN WITH GOOGLE",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).animate().slide(delay: 500.ms).fade(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
