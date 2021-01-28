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
         leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Color(0xff000000)), 
                   onPressed: () {}), 
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(''),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0), 
        child: SingleChildScrollView(
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.start,  
            children: <Widget>[
              CircleAvatar(
                radius: 85.0,
                backgroundImage: AssetImage('assets/images/logoblack.png'),
              ), 
              SizedBox(height: 52.0), 
              Padding( 
                padding: EdgeInsets.all(5.0), 
              child: Container( 
                height: 55.0, 
                width: 250,   
                margin: EdgeInsets.only(top: 5.0, bottom: 5.0), 
                child: TextField(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center, 
                  controller: _checkNum,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      borderSide: BorderSide(
                        color: Color(0xff333333),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide: BorderSide(
                        color: Color(0xff333333), 
                        width: 2.0, 
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide: BorderSide(
                          width: 2.0,
                          ),
                    ),
                    hintText: (' رمز التأكيد '),
                    hintStyle: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0x80000000)),
                  ),
                ),
              ), 
              ), 
              SizedBox(height: 15.0),  
         Container( 
           //width: MediaQuery.of(context).size.width, 
           height: 41.0, 
           width: 100, 
                child: RaisedButton( 
                  color: Color(0xffEBEBEB), 
                  textColor: Color(0x80000000),   
                  child: Text('ارسال',  
                  style: new TextStyle(
                        fontSize: 19.0,  
                        fontFamily: "AlJazeera", 
                        fontWeight: FontWeight.bold,
                        backgroundColor: Color(0xffEBEBEB)
                        ),
                  ), 
                   onPressed: (){}, 
                   shape: RoundedRectangleBorder( 
                     borderRadius: new BorderRadius.circular(28.0), 
                     side: BorderSide(color: Color(0xffEBEBEB)) ),
                  ), 
         ),     
                
              SizedBox(height: 62.0), 
            Text("BY \n TG Developers", 
            textAlign: TextAlign.center,  
            style: new TextStyle(
                        fontSize: 20.0,  
                        fontFamily: "Aqua", 
                        color: Color(0x59000000), 
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
