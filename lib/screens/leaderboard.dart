import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart'; 



class LeaderBoard extends StatefulWidget {
  LeaderBoard({Key key}) : super(key: key);

  @override
  _LeaderBoardState createState() => _LeaderBoardState();
} 

class _LeaderBoardState extends State<LeaderBoard> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( 
      length: 2, 
    child: Scaffold(
      appBar: AppBar( 
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(95.0),
         bottomLeft: Radius.circular(95.0)
         )), 
         leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Color(0xff000000)), 
                   onPressed: () {}), 
        backgroundColor: Color(0xffEBEBEB), 
        elevation: 0.0,
            title: Text(''),
            automaticallyImplyLeading: false, 
            bottom:  PreferredSize(
            preferredSize: new Size(100.0, 75.0),
            child: new Container(
              width: 350.0,
            child: TabBar( 
              labelStyle: TextStyle(
                fontSize: 25.0, 
              ), 
              indicatorColor: Colors.transparent, 
               labelColor: Color(0xff000000), 
               unselectedLabelColor: Color(0x80000000),  
               indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(75), 
                color: Color(0xffF4C852), 
                
                               ),
              tabs: [ 
                 new Container(
                    height: 70.0,
                child: Tab(text: 'الكبسولات'), 
                 ), 
                  new Container(
                    height: 70.0,  
                child: Tab(text: 'نقاط التحدي'), 
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