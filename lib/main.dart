import 'package:flutter/material.dart';
import 'package:reply/ui/ui/detail.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reply',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: DetailView(),
    );
  }
}
