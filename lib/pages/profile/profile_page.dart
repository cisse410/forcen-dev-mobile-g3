import 'package:flutter/material.dart';
import 'package:tasks_manager_forcen/constants/app_colors.dart';
import 'package:tasks_manager_forcen/pages/profile/profile_edit_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        'assets/images/profile_image.jpg'
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'DJERABE Fabrice',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'fabricedjerabe01@gmail.com',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: [
                    buildListTile(
                        Icons.person,
                        'Edit profile',
                        AppColors.kPrimaryColor,
                        () {
                          Navigator.of(context).pushNamed('/profile-edit');
                      },
                    ),
                    buildListTile(
                        Icons.edit,
                        'Change password',
                        AppColors.kPrimaryColor,
                          () {
                            Navigator.of(context).pushNamed('/change-password');
                      },
                    ),
                    buildListTile(
                        Icons.notifications,
                        'Notifications',
                        AppColors.kPrimaryColor,
                          () {
                        Navigator.pushNamed(context, 'ProfileEditPage');
                      },
                    ),
                    buildListTile(
                        Icons.dashboard,
                        'Statistiques',
                        AppColors.kPrimaryColor,
                          () {
                        Navigator.pushNamed(context, 'ProfileEditPage');
                      },
                    ),
                    buildListTile(
                        Icons.delete,
                        'Delete your account',
                        Colors.red,
                          () {
                        Navigator.pushNamed(context, 'ProfileEditPage');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(IconData icon, String title, Color textColor, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(title, style: TextStyle(color: textColor)),
      trailing: Icon(Icons.chevron_right, color: textColor),
      onTap: onTap,
    );
  }
}
