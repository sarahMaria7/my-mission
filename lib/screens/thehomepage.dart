import 'package:flutter/material.dart'; 
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart'; 
//import 'dart:io'; 


class TheHomePage extends StatefulWidget {
  TheHomePage({Key key}) : super(key: key);

  @override
  _TheHomePageState createState() => _TheHomePageState();
} 



class _TheHomePageState extends State<TheHomePage> { 
  //File _image; 
  //Image _image; 
  String urlavatar = ''; 
  bool loadPrs = false; 

  _imgFromGirl()  {
     String urlavatar1 =  'assets/imageavatar/heroine.jpg'; 
  

    setState(() {
      urlavatar = urlavatar1; 
    });
  } 
   _imgFromBoy() {
    String urlavatar2 = 'assets/imageavatar/hero.jpg'; 

    setState(() {
      urlavatar = urlavatar2; 
    });
  } 
   //function to choose what we need to do add by camera or bay gallery 

    void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(MdiIcons.genderMale), 
                      title: new Text(''),
                      onTap: () {
                        _imgFromBoy();
                        Navigator.of(context).pop(); 
                      }), 
                      new ListTile(
                    leading: new Icon(MdiIcons.genderFemale), 
                    title: new Text(''),
                    onTap: () {
                      _imgFromGirl();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  } 

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

      
       
  body: ListView( 
    padding: EdgeInsets.all(9.0), 
    scrollDirection: Axis.vertical, 
    children: <Widget>[ 
      Align( 
        alignment: Alignment.center, 
       child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 75, 
            backgroundColor: Colors.transparent,  
                child:  urlavatar == ''?
                ClipOval(child: Image.asset('assets/images/imageprofile.png', height: 150, width: 150, fit: BoxFit.cover,),): 
                ClipOval(child: Container( height: 150, width: 150, 
                 decoration: BoxDecoration( 
                   image: DecorationImage(
                 image: AssetImage(urlavatar), 
                 fit: BoxFit.cover, 
                   ), 
                  color: Colors.transparent, 
                  borderRadius: BorderRadius.all(Radius.circular(75)), 
                ),
               ),), 
              ),
              Positioned(bottom: 1.0, right: 1.0 ,child: Container(
                height: 50, width: 50,
                child: IconButton(icon: Icon(Icons.add_a_photo, color: Colors.black),
               color: Color(0xffFFFFFF), 
               iconSize: 32.0, 
                            //   هنا نبرمج الفاكشن الخاصة باضافة صورة عند الضغط على أيقونة الكامرة
                          
                          onPressed: (){
                               _showPicker(context); 
                          }, 
                
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent, 
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ))
            ],
          ),

      ), 


   
     SizedBox(height: 25.0), 
     Text("اسم البطل", 
            textAlign: TextAlign.center,  
            style: new TextStyle(
                        fontSize: 25.0, 
                        color: Color(0xff000000), 
                        fontWeight: FontWeight.bold, 
                        ), 
            ),  
          SizedBox(height: 35.0), 
          Row(
            children: <Widget>[ 
              SizedBox(width: 43.0),  
              Column( 
                         children: <Widget>[ 
           GestureDetector(
                      onTap: () {
                      print('ce ceci est un essaie'); 
                      }, 
              child: Container( 
                height: 83.0, 
                width: 83.0,  
                         decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage('assets/images/leaderboard.png'), 
               fit: BoxFit.fill,  
             ), 
           ),  
              ), 
           ),  
           Text('المتصدرين', 
            textAlign: TextAlign.center,  
            style: new TextStyle(
                        fontSize: 19.0, 
                        color: Color(0xff000000), 
                        fontWeight: FontWeight.bold, 
                        ), 
           
           ),   
               
                         ], 
              ), 
              SizedBox(width: 12.0),  
              Column( 
                         children: <Widget>[ 
           GestureDetector(
                      onTap: () {
                      print('ce ceci est un essaie'); 
                      }, 
              child: Container( 
                height: 83.0, 
                width: 83.0,  
                         decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage('assets/images/chanllenges.png'), 
               fit: BoxFit.fill,  
             ), 
           ),  
              ), 
           ),  
           Text('التحدي', 
            textAlign: TextAlign.center,  
            style: new TextStyle(
                        fontSize: 19.0, 
                        color: Color(0xff000000), 
                        fontWeight: FontWeight.bold, 
                        ), 
           
           )  
               
                         ], 
              ), 
          SizedBox(width: 12.0), 
                Column( 
                         children: <Widget>[ 
           GestureDetector(
                      onTap: () {
                      print('ce ceci est un essaie'); 
                      }, 
              child: Container( 
                height: 83.0, 
                width: 83.0,  
                         decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage('assets/images/capsule.png'), 
               fit: BoxFit.fill,  
             ), 
           ),  
              ), 
           ),  
           Text('الكبسولات', 
            textAlign: TextAlign.center,  
            style: new TextStyle(
                        fontSize: 19.0, 
                        color: Color(0xff000000), 
                        fontWeight: FontWeight.bold, 
                        ), 
           
           )  
               
                         ], 
              ),  
            ], 
          ), 
          SizedBox(height: 55.0),  
      Container( 
           //width: MeiaQuery.of(context).size.width, 
           height: 65.0, 
           width: 119.0, 
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage(loadPrs? 'assets/images/exitpressed.png': 'assets/images/exitnopressed.png'), 
               //fit: BoxFit.fill,  
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
    ], 
  )

 
      );  
    } 
} 