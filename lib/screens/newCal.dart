import 'package:flutter/material.dart';

class Myhome extends StatefulWidget { 
   Myhome({Key key}) : super(key: key); 
@override
  NewCalendar createState() => NewCalendar();
}

class NewCalendar extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
        PreferredSize(
        preferredSize: Size.fromHeight(100.0),


    child:  AppBar(


        leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {}),
        title: Center(
          child: Text(
            'التحدي',
            //textAlign: TextAlign.right,
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.black,
              fontSize: 38.0,
              fontFamily: "AlJazeera",
            ),

          ),
        ),
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Color(0xffEBEBEB),
      ),
        ),

      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[



              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  height: 360.0,
                  margin: const EdgeInsets.only(bottom: 10.0),


                  ///gridview
                 child: Container(
                   margin: EdgeInsets.all(30.0),
                   height: 300,

                   child: GridView.builder(
                     itemCount: 60,
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: 7, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
                     itemBuilder: (BuildContext context, int index){

                       if(index==10){
                         return Container(
                           height: 60,
                           width: 60,

                           decoration: BoxDecoration(
                             image: DecorationImage(
                                 image: AssetImage('assets/images/10_green.png',),
                                 fit: BoxFit.cover,

                             ),
                           ),

                           child: Center(
                             child: Text('11',
                               style: TextStyle(fontFamily: "AlJazeera",
                                 fontSize: 12.0,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black,),
                             ),
                           ),
                         );
                       }

                       else{
                         return
                           Container(
                             height: 60,
                             width: 60,

                             decoration: BoxDecoration(
                               image: DecorationImage(
                                   image: AssetImage('assets/images/10_locked.png'),
                                   fit: BoxFit.cover
                               ),
                             ),


                           );
                       }

                     },
                   ),

                 ),





                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                ),
              ),






               Container(
                  height: 100,
                  margin: EdgeInsets.all(40.0),
                  child: Card(
                   // shape: ShapeBorder.,
                   child: Center(

                     child: ListTile(
                     title: Text(
                       'إنشاء تحدي',
                       textAlign: TextAlign.right,
                       style: TextStyle(
                         fontFamily: "AlJazeera",
                         fontSize: 24.0,
                         color: Colors.black,
                       ),
                     ),
                     leading: Icon(
                       Icons.arrow_back_ios_rounded,
                       color: Colors.black,
                     ),
                   ),
                 ),
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),

                  ),

                ),
       // ),


              ///
             // Padding(padding: EdgeInsets.only(top: 30.0),
             //   child:
                Container(
                  height: 100,
                margin: EdgeInsets.only(left: 40.0,right: 40.0, bottom: 40.0),
                // margin: EdgeInsets.all(40.0),
                  child: Card(
                    child: Center(

                      child: ListTile(
                        title: Text(
                          'العودة للرئيسية',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: "AlJazeera",
                            fontSize: 24.0,
                            color: Colors.black,
                          ),
                        ),
                        leading: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),

                  ),



                ),




              ///11





            ],
          ),
        ),
      ),
    );
  }
}
