import 'package:flutter/material.dart';
import 'package:flutterproject/about.dart';
import 'package:flutterproject/main.dart';
import 'package:flutterproject/RandomWords/randomWords.dart';
import 'package:flutterproject/tutorial1/src/shared/app.dart';

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
                image: AssetImage('assets/images/cover.jpg'),
              ),
            ),
            child: Text(
              'Side Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
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
            leading: const Icon(Icons.library_books_rounded),
            title: const Text('Random Words'),
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RandomWords(),
                ),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_music),
            title: const Text('Tutorial 1'),
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyMusic(),
                ),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.computer),
            title: const Text('Device About'),
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const About(),
                ),
              )
            },
          ),
        ],
      ),
    );
  }
}
