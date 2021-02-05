import 'package:flutter/material.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';


class LeaderBoardUser extends StatefulWidget {
  LeaderBoardUser({Key key}) : super(key: key);

  @override
  _LeaderBoardUserState createState() => _LeaderBoardUserState();
}

class _LeaderBoardUserState extends State<LeaderBoardUser>    with TickerProviderStateMixin{

 TabController _controller; 
 @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  
  }


@override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35.0),
                  bottomLeft: Radius.circular(35.0))),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Color(0xff000000)),
              onPressed: () {}),
          backgroundColor: Color(0xffEBEBEB),
          elevation: 0.0,
          title: Text(''),
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: new Size(100.0, 55.0),
            child: new Container(
              padding: EdgeInsets.only(bottom: 15.0, right: 15.0, left: 15.0),
              child: TabBar(
                indicatorPadding: EdgeInsets.only(right: 15.0),
                indicator: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/pressed.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                controller: _controller,
                labelStyle: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
                indicatorColor: Colors.transparent,
                labelColor: Color(0xff000000),
                tabs: [
                  Tab(
                    child: _controller.index == 1
                        ? Container(
                            padding: EdgeInsets.only(right: 12),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('الكبسولات')),
                            height: 90,
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/nopressed.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Center(child: Text('الكبسولات')),
                  ),
                  Tab(
                    child: _controller.index == 0
                        ? Container(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('نقاط التحدي')),
                            height: 90,
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/nopressed.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Center(child: Text('نقاط التحدي')),
                  ),
                ],
                onTap: (val) {
                  print(_controller.index);
                  setState(() {});
                },
              ),
            ),
          ),
        ), 

         body: TabBarView(
          controller: _controller, 

        children: [
            Center(), 
            Center(), 
  ],
        ),
      ),
    ); 
  }
} 