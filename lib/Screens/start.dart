// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:login/Screens/login.dart';
import 'package:login/Components/my_button.dart';
import 'package:login/Screens/web/web_start.dart';
import 'package:login/Screens/register.dart';
import 'package:login/Services/auth_service.dart';
import 'package:lottie/lottie.dart';
import 'package:login/Screens/create_account/create_account.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  ValueNotifier<bool> _signInPressed = ValueNotifier(false);
  ValueNotifier<bool> _downAnimation = ValueNotifier(false);

  void signInWithGoogle() async {
    await AuthService().signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints) {
        if (contraints.maxWidth < 500) {
          return WillPopScope(
            onWillPop: () async {
              _signInPressed.value = false;
              _downAnimation.value = true;
              await Future.delayed(300.ms);
              return false;
            },
            child: Scaffold(
              backgroundColor: Colors.grey[300],
              body: SafeArea(
                child: Column(
                  children: [
                    Flexible(
                        flex: 4,
                        fit: FlexFit.tight,
                        child: Image.asset('assets/background.png')),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: AnimatedBuilder(
                            animation: _signInPressed,
                            builder: (context, Widget? child) {
                              if (_signInPressed.value == false) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 51,
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                          maxHeight: 275, maxWidth: 275),
                                      child: Lottie.asset("assets/people.json"),
                                    ),
                                    MyButton(
                                      padding: 15,
                                      text: "CREATE ACCOUNT",
                                      onTap: () => Get.to(
                                        () => CreateAccount(),
                                        transition: Transition.rightToLeft,
                                        duration: Duration(milliseconds: 200),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    MyButton(
                                      padding: 15,
                                      text: "SIGN IN",
                                      onTap: () => _signInPressed.value =
                                          !_signInPressed.value,
                                      color: Colors.white,
                                      textColor: Colors.black,
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                          maxHeight: 275, maxWidth: 275),
                                      child: Lottie.asset("assets/people.json"),
                                    ).animate().slideY(begin: 0.1854),
                                    IntegratedButton(
                                      text: "SIGN IN WITH APPLE",
                                      onTap: () => Get.to(
                                        () => Register(),
                                        transition: Transition.upToDown,
                                        duration: Duration(milliseconds: 200),
                                      ),
                                      iconRoute: "assets/apple.png",
                                      color: Colors.white,
                                      textColor: Colors.black,
                                    ).animate().slideY(begin: 1.8).fadeIn(),
                                    SizedBox(height: 7),
                                    IntegratedButton(
                                      text: "SIGN IN WITH GOOGLE",
                                      onTap: () => signInWithGoogle(),
                                      color: Colors.white,
                                      textColor: Colors.black,
                                      iconRoute: "assets/google.png",
                                    ).animate().slideY(begin: 0.9).fadeIn(),
                                    SizedBox(height: 7),
                                    IntegratedButton(
                                      iconRoute: "assets/email.png",
                                      text: "SIGN IN WITH EMAIL",
                                      onTap: () => Get.to(
                                        () => Login(),
                                        transition: Transition.downToUp,
                                        duration: Duration(milliseconds: 200),
                                      ),
                                      color: Colors.white,
                                      textColor: Colors.black,
                                    ),
                                  ],
                                );
                              }
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return webStart();
        }
      },
    );
  }
}
