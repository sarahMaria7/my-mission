import 'package:flutter/material.dart';

class CheckPage extends StatefulWidget {
  CheckPage({Key key}) : super(key: key);

  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  final TextEditingController _checkNum = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(''),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 95.0,
                backgroundImage: AssetImage('assets/images/logoblack.png'),
              ), 
              SizedBox(height: 52.0), 
              Padding( 
                padding: EdgeInsets.all(8.0), 
              child: Container( 
                margin: EdgeInsets.only(top: 9.0, bottom: 9.0), 
                //height: 57.0,
                //width: 300.0,
                child: TextField(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center, 
                  controller: _checkNum,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(52)),
                      borderSide: BorderSide(
                        color: Color(0xff333333),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(52)),
                      borderSide: BorderSide(
                        color: Color(0xff333333), 
                        width: 2.0, 
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(52)),
                      borderSide: BorderSide(
                          width: 2.0,
                          ),
                    ),
                    hintText: (' رمز التأكيد '),
                    hintStyle: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff333333)),
                  ),
                ),
              ), 
              ), 
              SizedBox(height: 35.0),  
              Container(
                child: RaisedButton( 
                  color: Colors.white12, 
                  child: Text('ارسال', 
                  style: new TextStyle(
                        fontSize: 19.0,
                        color: Color(0xffFFFFFF), 
                        fontFamily: "AlJazeera", 
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.white12),
                  ), 
                   onPressed: (){}, 
                  ), 
                   
                ),
              SizedBox(height: 50.0), 
              
            ],
          ),
        ),
      ),
    );
  }
}
