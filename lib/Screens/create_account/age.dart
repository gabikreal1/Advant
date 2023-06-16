import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Components/my_texfield.dart';
import 'package:login/Components/my_button.dart';
import 'package:login/Services/auth_service.dart';

class Age extends StatefulWidget {
  final Function()? submit;

  const Age({super.key, required this.submit});

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
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
                  alignment: Alignment.center,
                  child: Text(
                    "What's your Age?",
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
                  alignment: Alignment.center,
                  child: Text(
                    "Only age will be displayed on the profile",
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
                      hintText: "EnterAge",
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
