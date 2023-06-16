import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Components/my_button.dart';
import 'package:login/Screens/login.dart';
import 'package:login/Screens/register.dart';

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
                            padding: 25.0,
                            onTap: () => Get.to(
                              () => Register(),
                              transition: Transition.upToDown,
                              duration: Duration(milliseconds: 350),
                            ),
                            text: "SIGN UP",
                            color: Colors.white,
                            textColor: Colors.black,
                          ),
                          const SizedBox(height: 10),
                          MyButton(
                            padding: 25.0,
                            onTap: () => Get.to(
                              () => Login(),
                              transition: Transition.downToUp,
                              duration: Duration(milliseconds: 350),
                            ),
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
