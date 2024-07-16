import 'package:flutter/material.dart';
import 'package:tasks_manager_forcen/constants/app_colors.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedColor: AppColors.kPrimaryColor,
      title: Text(
        title,
        style: const TextStyle(
          //color: Colors.black,
          fontSize: 20,
        ),
      ),
      leading: Icon(
        icon,
        //color: const Color(0xff7592B6),
      ),
    );
  }
}
