// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Screens/login.dart';
import 'package:login/Components/my_button.dart';
import 'package:login/Screens/web/web_start.dart';
import 'package:login/Screens/register.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints) {
        if (contraints.maxWidth < 500) {
          return Scaffold(
            backgroundColor: Colors.grey[300],
            body: SafeArea(
              child: Column(
                children: [
                  Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Image.asset('assets/background.png')),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        children: [
                          MyButton(
                            text: "SIGN UP",
                            onTap: () => Get.to(
                              () => Register(),
                              transition: Transition.upToDown,
                              duration: Duration(milliseconds: 350),
                            ),
                            color: Colors.white,
                            textColor: Colors.black,
                          ),
                          SizedBox(height: 15),
                          MyButton(
                            color: Colors.black,
                            text: "SIGN IN",
                            onTap: () => Get.to(
                              () => Login(),
                              transition: Transition.downToUp,
                              duration: Duration(milliseconds: 350),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
