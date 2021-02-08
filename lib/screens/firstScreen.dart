import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Myhomefirst extends StatefulWidget {
  Home createState() => Home();
}

class Home extends State<Myhomefirst> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                Image.asset('assets/images/logo.png', width: 400, height: 400, ),


               Text('MY MISSION',
                  style: TextStyle(fontSize: 30,
                  fontFamily: 'Corbel',
                  color: Color(0xffF4C852)),),


                SizedBox(height: 200.0),

                Text("اللعبة أكاديمي",
                  textAlign: TextAlign.center,

                  style: new TextStyle(
                    fontSize: 25.0,
                    fontFamily: "AlJazeera",
                    // color: Color(0x59000000),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}