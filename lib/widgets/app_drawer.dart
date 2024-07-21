import 'package:flutter/material.dart';
import 'package:tasks_manager_forcen/widgets/drawer_items.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      width: 270,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: FlutterLogo(),
            accountName: Text('CISSE410'),
            accountEmail: Text('formation@forcen.sn'),
          ),
          DrawerItems(
            title: 'Home',
            icon: Icons.home_outlined,
          ),
          SizedBox(height: 15),
          DrawerItems(
            title: 'Dashboard',
            icon: Icons.dashboard_outlined,
          ),
          SizedBox(height: 15),
          DrawerItems(
            title: 'Completed tasks',
            icon: Icons.list_alt_sharp,
          ),
          SizedBox(height: 15),
          DrawerItems(
            title: 'Uncompleted tasks',
            icon: Icons.list_alt_sharp,
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
