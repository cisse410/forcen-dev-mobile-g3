import 'package:flutter/material.dart';
import 'package:tasks_manager_forcen/auth/login.dart';
import 'package:tasks_manager_forcen/auth/password_reset.dart';
import 'package:tasks_manager_forcen/auth/register.dart';
import 'package:tasks_manager_forcen/pages/home_page.dart';
import 'package:tasks_manager_forcen/pages/profile/change_password_page.dart';
import 'package:tasks_manager_forcen/pages/profile/profile_edit_page.dart';
import 'package:tasks_manager_forcen/pages/profile/profile_page.dart';

import '../constants/app_colors.dart';
import 'app_routes.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.kPrimaryColor,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade800),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.home : (context) => const HomePage(),
        AppRoutes.login : (context) => const LoginPage(),
        AppRoutes.register : (context) => const RegisterPage(),
        AppRoutes.profile : (context) => const ProfilePage(),
        AppRoutes.profileEdit : (context) => const ProfileEditPage(),
        AppRoutes.passwordReset : (context) => const PasswordResetPage(),
        AppRoutes.changePassword : (context) => const ChangePasswordPage()
      },
      initialRoute: "/login",
    );
  }
}
