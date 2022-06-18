import 'package:flutter/material.dart';
import 'package:flutterproject/main.dart';
import 'package:flutterproject/randomWords.dart';

class sideNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/image/cover.jpg'),
              ),
            ),
            child: Text(
              'Side Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Home Page'),
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyApp(),
                ),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Random Words'),
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RandomWords(),
                ),
              )
            },
          )
        ],
      ),
    );
  }
}