import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutterproject/SideNavigation/sideNav.dart';
import 'package:flutterproject/tutorial1/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutterproject/YoutubeToturial/app_state.dart';

//Youtube channel short URL
const flutterDevAccountId = 'UCXZLmOdYB5_O8G_tjkDpTbQ';

//Youtube API key
const youTubeApiKey = 'AIzaSyCR1SXaMYuDUK7UWzf-P8eYBowcQkD-YdM';

void main() {
  runApp(ChangeNotifierProvider<FlutterDevPlaylists>(
    create: (context) => FlutterDevPlaylists(
      flutterDevAccountId: flutterDevAccountId,
      youTubeApiKey: youTubeApiKey,
    ),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider =
              Provider.of<ThemeProvider>(context, listen: true);
          // final wordPair = WordPair.random();
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme, // Add this line
            darkTheme: MyThemes.darkTheme,
            home: MyHomePage(),
          );
        },
      );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sideNav(),
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.blue,
        title: const Text('CK Flutter Hunting Ground'),
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: const Center(
        child: Text('Home Page Display'),
      ),
    );
  }
}
