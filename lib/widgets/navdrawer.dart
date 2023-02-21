import 'package:flutter/material.dart';
import 'package:lend_buddy/main.dart';
import 'package:lend_buddy/screens/home_screen.dart';

class NavDrawer extends StatelessWidget {
  final int idUser;

  const NavDrawer({super.key, required this.idUser});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(userId: idUser)))
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp()))
            },
          ),
        ],
      ),
    );
  }
}
