import 'package:flutter/material.dart';
import 'package:tasks_manager_forcen/widgets/drawer_items.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Drawer(
        width: 270,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: FlutterLogo(),
              accountName: Text('CISSE410'),
              accountEmail: Text('formation@forcen.sn'),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.zero,
              ),
            ),
            const DrawerItems(
              title: 'Home',
              icon: Icons.home_outlined,
            ),
            DrawerItems(
              title: 'Dashboard',
              icon: Icons.dashboard_outlined,
            ),
            DrawerItems(
              title: 'Completed tasks',
              icon: Icons.list_alt_sharp,
            ),
            DrawerItems(
              title: 'Uncompleted tasks',
              icon: Icons.incomplete_circle_outlined,
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
