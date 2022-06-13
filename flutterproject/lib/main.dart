import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome To Flutter ABC'),
          ),
          body: Center(
            //child: Text("Hello World"),
            child: Text(wordPair.asPascalCase),
          ),
        ));
  }
}
