import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart'; 



class LeaderBoard extends StatefulWidget {
  LeaderBoard({Key key}) : super(key: key);

  @override
  _LeaderBoardState createState() => _LeaderBoardState();
} 

class _LeaderBoardState extends State<LeaderBoard> {
int loadPrs = 0;  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController( 
      length: 2, 
    child: Scaffold(
      appBar: AppBar( 
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(35.0),
         bottomLeft: Radius.circular(35.0)
         )), 
         leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Color(0xff000000)), 
                   onPressed: () {}), 
        backgroundColor: Color(0xffEBEBEB), 
        elevation: 0.0,
            title: Text(''),
            automaticallyImplyLeading: false, 
            bottom:  PreferredSize(
            preferredSize: new Size(100.0, 55.0),
            child: new Container( 
              padding: EdgeInsets.only(bottom: 15.0, right: 15.0, left: 15.0), 
             
            child: TabBar( 
              labelStyle: TextStyle(
                fontSize: 19.0, 
              ), 
              indicatorColor: Colors.transparent, 
               labelColor: Color(0x80000000), 
               unselectedLabelColor: Color(0xff000000), 
                
               
            indicator: BoxDecoration( 
              image: DecorationImage(image:AssetImage(
                    'assets/images/pressed.png', 
                  ),), 
                //borderRadius: BorderRadius.circular(55), 
                //color: Color(0xffEBEBEB), 
               //boxShadow: [
            //BoxShadow(
                //color: Colors.black, 
                //blurRadius: 5.0,
                //spreadRadius: 0.0,
                //offset: Offset(5.0, 5.0), // shadow direction: bottom right
           // )
        //],
                               ), 
              tabs: [ 
            
          
                 
             Tab(  
               child: Container( 
                  
              
                                 child: Text('الكبسولات'),
                               ), 
               ),
              
               
                Tab(
                    child: Container( 
            
                           
                        
                                 child: Text('نقاط التحدي'),
                         
               ),
                ), 
             
              ], 
            
            ),
            ), 
            ), 
      ),
      body: TabBarView(
            children: [
                Center(child: Column( 
            mainAxisAlignment: MainAxisAlignment.start,  
            children: <Widget>[
              Row( 
                crossAxisAlignment: CrossAxisAlignment.start,  
                    children: <Widget>[ 
            CircleAvatar(
                radius: 15.0, 
                backgroundColor: Colors.white, 
             child: Text('1',  
               style: TextStyle(fontSize: 25, color: Color(0x80000000)),
              ), 
            ),  
                    ]
              ),
            ], 
              ), 
                ), 
                Center(child: Text('نقاط التحدي')), 
            ],
          ), 
    ),  
    ); 
  } 
} 