// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Components/my_texfield.dart';
import 'package:login/Components/my_button.dart';
import 'package:login/Services/auth_service.dart';

class Name extends StatefulWidget {
  final Function()? submit;

  const Name({super.key, required this.submit});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "What's your name?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "It will be displayed on your profile",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  height: 20,
                  child: TextField(
                    onSubmitted: (val) => widget.submit,
                    controller: name,
                    decoration: InputDecoration(
                      hintText: "Enter name",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 450,
                ),
                MyButton(onTap: widget.submit, text: "Next", padding: 25)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
