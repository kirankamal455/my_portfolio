import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DashboardDrawer extends StatelessWidget {
  final GlobalKey homeKey;
  final GlobalKey aboutKey;
  final GlobalKey serviceKey;
  final GlobalKey projectKey;
  final VoidCallback onDownload;

  const DashboardDrawer({
    super.key,
    required this.homeKey,
    required this.aboutKey,
    required this.serviceKey,
    required this.projectKey,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: context.primaryColor),
            child: const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              accountName: Text("Kiran Kamal", style: TextStyle(fontSize: 18)),
              accountEmail: Text("Kirankamal45@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("K", style: TextStyle(fontSize: 30)),
              ),
            ),
          ),
          _drawerItem(Icons.person, "HOME", () => _scrollTo(homeKey, context)),
          _drawerItem(Icons.book, "ABOUT", () => _scrollTo(aboutKey, context)),
          _drawerItem(Icons.workspace_premium, "SERVICES",
                  () => _scrollTo(serviceKey, context)),
          _drawerItem(Icons.video_label, "PROJECTS",
                  () => _scrollTo(projectKey, context)),
          _drawerItem(Icons.edit, "RESUME", () {
            onDownload();
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }

  ListTile _drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
  }

  void _scrollTo(GlobalKey key, BuildContext context) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
    Navigator.pop(context);
  }
}
