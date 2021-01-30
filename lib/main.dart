import 'package:flutter/material.dart';
import 'screens/checkpage.dart';
import 'screens/leaderBoard.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
        debugShowCheckedModeBanner: false, 
      title: 'mymission',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity, 
        fontFamily: "AlJazeera", 
      ),
      home: LeaderBoard(),
    );
  }
}
