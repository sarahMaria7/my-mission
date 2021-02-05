import 'package:flutter/material.dart';

class CheckPage extends StatefulWidget {
  CheckPage({Key key}) : super(key: key);

  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  final TextEditingController _checkNum = new TextEditingController(); 
  var loadPrs = false;  
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
                radius: 75.0,
                backgroundImage: AssetImage('assets/images/logoblack.png'),
              ), 
              SizedBox(height: 73.0), 
              Padding( 
                padding: EdgeInsets.all(5.0), 
              child: Container( 
                height: 43.0, 
                width: 250,   
                //margin: EdgeInsets.only(top: 5.0, bottom: 5.0), 
                child: TextField(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center, 
                  controller: _checkNum,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration( 
                    contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),   
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      borderSide: BorderSide(
                        color: Color(0xff000000),
                        //width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide: BorderSide(
                        color: Color(0xff000000), 
                        //width: 2.0, 
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide: BorderSide(
                          //width: 2.0,
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
              //SizedBox(height: 3.0), 
                Container(
                        height: 23.0,
                        margin: const EdgeInsets.all(0),
                        padding: const EdgeInsets.all(0),  
              child: FlatButton(  
                  child: Text('اعادة ارسال رمز التأكيد   ',
                  style: new TextStyle(
                                color: Color(0xff2F80C4), 
                                fontWeight: FontWeight.bold, 
                                fontSize: 12.0, 
                              ), 
                              textAlign: TextAlign.center,  
                  ), 
                  onPressed: (){},  
              ), 
                ),    
              SizedBox(height: 25.0),  
         Container( 
           //width: MeiaQuery.of(context).size.width, 
           height: 65.0, 
           width: 125.0, 
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage(loadPrs? 'assets/images/clicked.png': 'assets/images/noclicked.png'), 
               fit: BoxFit.fill,  
             ), 
           ), 
                child: InkWell( 
                  splashColor: Colors.transparent, 
                  highlightColor: Colors.transparent, 
                  onTapCancel: (){
                      setState((){
                        loadPrs = true; 
                      }); 
                  }, 
                  onLongPress: (){
                      setState((){
                        loadPrs = false; 
                      }); 
                  }, 
                  onTapDown: (val){
                      setState((){
                        loadPrs = true; 
                      }); 
                  }, 
                  onTap: (){
                    Future.delayed(const Duration(milliseconds: 200), () => "2").then((onValue){
                      setState(() {
                        loadPrs = false; 
                      }); 
                    }); 
                  }, 
                 
                  ), 
         ),     
                
              SizedBox(height: 52.0), 
            Text("BY \n TG Developers", 
            textAlign: TextAlign.center,  
            style: new TextStyle(
                        fontSize: 20.0,  
                        fontFamily: "Aqua", 
                        color: Color(0x59000000), 
                        height: 1.3, 
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
