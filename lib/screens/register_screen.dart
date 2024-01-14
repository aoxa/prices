import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 50),
          children:  [
            Column(
              children: [
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Form(
                    child: Column(
                      children: [
                        TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(50)
                          ],
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none
                              )
                            )
                          ),
                        )
                      ],
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
