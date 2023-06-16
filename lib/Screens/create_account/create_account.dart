// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Components/my_texfield.dart';
import 'package:login/Components/my_button.dart';
import 'package:login/Services/auth_service.dart';
import 'package:login/Screens/create_account/name.dart';
import 'package:login/Screens/create_account/age.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final PageController controller = PageController();

  void switchpageForward() {
    controller.nextPage(
        duration: Duration(milliseconds: 250), curve: Curves.easeIn);
  }

  void submitName() async {
    switchpageForward();
  }

  void submitAge() async {
    switchpageForward();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Name(
          submit: submitName,
        ),
        Age(
          submit: submitAge,
        )
      ],
    );
  }
}
