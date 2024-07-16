import 'package:flutter/material.dart';
import 'package:tasks_manager_forcen/auth/login.dart';
import 'package:tasks_manager_forcen/pages/main_page.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const String routeName = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  width: 150,
                ),
                const Text(
                  'Registration',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff112255),
                  ),
                ),
                const SizedBox(height: 30),
                const CustomTextField(
                  hintText: "First name",
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 20),
                const CustomTextField(
                  hintText: "Last name",
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 20),
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
                CustomButton(
                  btnContent: 'Sing up',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    'Vous avez déjà un compte?',
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      'Se connecter',
                      style: TextStyle(
                        color: Color(0xff7492B7),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
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
