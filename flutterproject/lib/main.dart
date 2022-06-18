import 'package:flutter/material.dart';
import 'package:flutterproject/sideNav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black, foregroundColor: Colors.white),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sideNav(),
      appBar: AppBar(
        title: const Text('CK Flutter Hunting Ground'),
      ),
      body: const Center(
        child: Text('Home Page Display'),
      ),
    );
  }
}
