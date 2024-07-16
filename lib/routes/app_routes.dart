import 'package:tasks_manager_forcen/auth/login.dart';
import 'package:tasks_manager_forcen/auth/register.dart';
import 'package:tasks_manager_forcen/pages/home_page.dart';
import 'package:tasks_manager_forcen/pages/profile/change_password_page.dart';
import 'package:tasks_manager_forcen/pages/profile/profile_edit_page.dart';
import 'package:tasks_manager_forcen/pages/profile/profile_page.dart';

import '../auth/password_reset.dart';
import '../pages/splash_screen_page.dart';

class AppRoutes {
  static const String splash = SplashScreenPage.routeName;
  static const String home = HomePage.routeName;
  static const String login = LoginPage.routeName;
  static const String register = RegisterPage.routeName;
  static const String passwordReset = PasswordResetPage.routeName;
  static const String profile = ProfilePage.routeName;
  static const String profileEdit = ProfileEditPage.routeName;
  static const String changePassword = ChangePasswordPage.routeName;
}