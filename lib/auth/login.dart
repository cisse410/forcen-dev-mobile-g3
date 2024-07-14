import 'package:flutter/material.dart';
import 'package:tasks_manager_forcen/widgets/custom_text_field.dart';

import '../widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/auth.png",
                  width: 171,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff112255),
                  ),
                ),
                const SizedBox(height: 30),
                const CustomTextField(
                  hintText: "Adresse email",
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                const CustomTextField(
                  hintText: "Mot de passe",
                  obscureText: true,
                  textInputType: TextInputType.text,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: isSelected,
                            onChanged: (value) {
                              setState(() {
                                isSelected = value;
                              });
                            }),
                        const Text(
                          'Se souvenir de moi',
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Mot de passe oublié?',
                        style: TextStyle(
                          color: Color(0xff7492B7),
                        ),
                      ),
                    )
                  ],
                ),
                const CustomButton(
                  btnContent: 'Sing In',
                ),
                const SizedBox(height: 30),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Vous n\'avez pas de compte?',
                      ),
                      SizedBox(width: 12),
                      Text(
                        'S\'inscrire',
                        style: TextStyle(
                          color: Color(0xff7492B7),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
