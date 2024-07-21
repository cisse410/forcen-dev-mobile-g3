import 'package:flutter/material.dart';

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
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xff7592B6),
          fontSize: 16,
        ),
      ),
      leading: Icon(
        icon,
        color: const Color(0xff7592B6),
      ),
    );
  }
}
