import 'package:flutter/material.dart';
import 'package:reply/ui/ui/Home.dart';
import 'package:reply/utils/app_data.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppData.appName,
      showPerformanceOverlay: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.orange,
        canvasColor: Colors.transparent,
        fontFamily: 'WorkSans',
      ),
      home: MyHomePage(),
    );
  }
}
