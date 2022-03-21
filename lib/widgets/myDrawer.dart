// ignore_for_file: file_names, prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final auth = FirebaseAuth.instance;
final userEmail = auth.currentUser!.email;

class myDrawer extends StatelessWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Welcome',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            decoration: BoxDecoration(color: Color(0xfff0f2f2)),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/userDefault.png'),
            ),
            accountEmail: Text('${userEmail}',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
            leading: Icon(Icons.info),
            title: Text('About'),
          ),
          ListTile(
            onTap: () async {
              await FirebaseAuth.instance.signOut();

              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login', (Route<dynamic> route) => false);
            },
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
