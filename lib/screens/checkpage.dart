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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage('assets/images/logoblack.png'),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 25.0),
            ),
            Container(
                height: 30.0,
                width: 300.0,
                child: TextField(
                  textDirection: TextDirection.rtl, 
                      textAlign: TextAlign.right, 
                  controller: _checkNum, 
                       keyboardType: TextInputType.number, 
                        decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffFFFFFF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                        borderSide: BorderSide(
                          color: Color(0xff333333),
                          //width: 2.0,
                        ),
                      ), 
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                        borderSide: BorderSide(
                          color: Color(0xffFFFFFF),
                        ),
                      ), 
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                        borderSide: BorderSide(
                            //width: 2.0,
                            ), 
                    ), 
                      hintText: (' رمز التأكيد '),
                    hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Color(0xff333333)), 
                ),),
                ),
          ],
        ),
      ),
    );
  }
}
