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
         leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Color(0xff000000)), 
                   onPressed: () {}), 
        backgroundColor: Colors.grey, 
        elevation: 0.0,
            title: Text(''),
            automaticallyImplyLeading: false, 
            bottom: TabBar(
              indicatorColor: Colors.green, 
              indicatorWeight: 5.0,  
              tabs: [ 
                Tab(text: 'الكبسولات'), 
                Tab(text: 'نقاط التحدي'),  
              ],
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