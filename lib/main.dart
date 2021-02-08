import 'package:flutter/material.dart';
//import 'screens/checkpage.dart';
import 'screens/leaderboard.dart'; 
//import 'screens/newCal.dart'; 
//import 'screens/oldCalendar.dart';
//import 'screens/thehomepage.dart'; 
//import 'screens/firstScreen.dart'; 
//import 'screens/owner.dart'; 
 //import 'package:http/http.dart' as http; 
 //import 'dart:convert'; 
void main() async{ 

 

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
      home:  LeaderBoard(), 
    );
  }
}


