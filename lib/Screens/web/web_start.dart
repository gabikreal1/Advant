import 'package:flutter/material.dart';
import 'package:login/Components/my_button.dart';
import 'package:login/Screens/login.dart';
import 'package:login/Screens/register.dart';
import 'package:go_router/go_router.dart';

class webStart extends StatefulWidget {
  const webStart({super.key});

  @override
  State<webStart> createState() => _webStartState();
}

class _webStartState extends State<webStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(flex: 1, child: Container()),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: SizedBox(
                  width: 450,
                  child: Material(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              "assets/background.png",
                              width: 250,
                              height: 250,
                            ),
                          ),
                          MyButton(
                            onTap: () => context.push("/register"),
                            text: "SIGN UP",
                            color: Colors.white,
                            textColor: Colors.black,
                          ),
                          const SizedBox(height: 10),
                          MyButton(
                            onTap: () => context.push("/login"),
                            text: "SIGN IN",
                            color: Colors.black,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(flex: 1, child: Container())
          ],
        ),
      ),
    );
  }
}
