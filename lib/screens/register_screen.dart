import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prices_app/global/global.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _submit() async {
    if(_formKey.currentState!.validate()) {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: "test@test.com",
          password: "password"
      ).then((auth) async {
        currentUser = auth.user;
      });
    }
  }

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
                    key: _formKey,
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
                            ),
                          ),
                          onChanged: (text) => setState(() {
                            nameController.text = text;
                          }),
                        ),
                        const SizedBox(height: 20,),
                        ElevatedButton(
                            onPressed: _submit,
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 20
                              ),
                            )
                        )
                      ],
                    ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
