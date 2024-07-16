import 'package:flutter/material.dart';
import 'package:tasks_manager_forcen/constants/app_colors.dart';

import 'home_page.dart';
import 'profile/profile_page.dart';
import 'tasks_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const String routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  final _pages = [
    const HomePage(),
    const TasksPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE8E7E7),
      bottomNavigationBar: BottomNavigationBarTheme(
        data: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.kPrimaryColor,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold
          )
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_sharp),
              label: 'My Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: _pages[selectedIndex],
    );
  }
}
