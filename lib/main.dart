import 'package:flutter/material.dart';
import 'package:reply/ui/Home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reply',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          fontFamily: 'WorkSans'
      ),
      home: MyHomePage(),
    );
  }
}
