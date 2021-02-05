import 'package:flutter/material.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:my_mission/data.dart';
import 'package:my_mission/models/chat.dart';
import 'package:my_mission/utils.dart';
import 'package:my_mission/widget/slidable_widget.dart';

class LeaderBoard extends StatefulWidget {
  LeaderBoard({Key key}) : super(key: key);

  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}


// ///////////////////////////////////////////////////////////class state
class _LeaderBoardState extends State<LeaderBoard>
    with TickerProviderStateMixin { 

 // /////////////////////////////// declaration 

  List<Chat> items = List.of(Data.chats);
  TabController _controller;
  List<bool> isInLeaderBoard;
  var _searchview = new TextEditingController(); 
  bool _firstSearch = true; 
  String _query = "";
  List<String> _filterList2; 


//      methods used  
  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
    isInLeaderBoard = List<bool>.generate(items.length, (int i) => false); 
   _filterList2 =  new List<String>(); 
   _filterList2.sort(); //////////////////////// 

  } 

_LeaderBoardState(){
  _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchview.text;
        });
      }
    }); 
}

Widget _createSearchView(){
    return new  Container(
   height: 83.0, 
   width: 325.0, 
      padding: EdgeInsets.all(15.0),
      child: TextField( 
          textDirection: TextDirection.rtl, 
          textAlign: TextAlign.right,  
        controller: _searchview,
        autocorrect: true,
        decoration: InputDecoration(
          suffixIcon: new Icon(Icons.search_outlined), 
            hintText: (' بحث '), 
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white70,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(color: Color(0xffF4C852), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(
              color: Color(0xffF4C852),
            ),
          ),
        ),
      ),
    );
  }


///create list trier 
  Widget _performSearch() { 
      //_filterList2 =  new List<String>(); 
    for (int i = 0; i < items.length; i++) {
      var item = items[i].username; 

      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList2.add(item);
      }
    }
    return _createFilteredListView();
  } 
 Widget _createFilteredListView() {
    return new ListView.builder(
          itemCount: _filterList2.length, 
          itemBuilder: (BuildContext context, int index) {
           return new Card(
              color: Colors.white,
              elevation: 5.0,
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: new Text("${_filterList2[index]}"),
              ),
            );
          } 
          );  
    
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
            preferredSize: new Size(100.0, 43.0),
            child: new Container(
              padding: EdgeInsets.only(bottom: 15.0, right: 15.0, left: 15.0),
              child: TabBar(
                indicatorPadding: EdgeInsets.only(right: 15.0),
                indicator: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/pressed.png',
                    ), 
                    fit: BoxFit.fill, 
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
                  //print(_controller.index);
                  setState(() {});
                },
              ),
            ),
          ),
        ), 
   // /////////////////////////////// body     
        body: TabBarView(
          controller: _controller,
          children: [
           // //////////////////////////////// الكبسولات
         //_createListView(), 
      _createListView(), 



            // نقاط التحدي
        Column(  
      children: <Widget>[ 

          _createSearchView(), 
      new Expanded(
              //SizedBox(height: 35.0), 
             //child: _createListView(), 
          child:  _firstSearch ? _createListView() : _performSearch(), 
      ), 
      ],     
        ), 
          ], 
      ), 
      ), 
    );
  } 
  Widget _createListView() { 
 
     
     return  ListView.separated(
              itemCount: items.length,
              separatorBuilder: (context, index) =>
                  Divider(thickness: 2.0, color: Color(0xffEBEBEB)),
              itemBuilder: (context, index) {
                final item = items[index]; 
                return SlidableWidget(
                  child: buildListTile(item, index),
                  onDismissed: (action) =>
                      dismissSlidableItem(context, index, action),
                );
              },
            );              
                
}
  
void dismissSlidableItem(
      BuildContext context, int index, SlidableAction action) {
    setState(() {
      items.removeAt(index);
    });

    switch (action) {
      case SlidableAction.more:
        Utils.showSnackBar(context, 'تم توقيف حساب البطل مؤقتا');
        break;
      case SlidableAction.delete:
        Utils.showSnackBar(context, 'تم حذف البطل من قائمة المتصدرين');
        break;
    }
  }
  
  Widget buildListTile(Chat item, index) => ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ), 
   
        title: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[ 

            Row( 
                //crossAxisAlignment: CrossAxisAlignment.end, 
                children: <Widget>[
            buildCheckBox(index), 
                  CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.white,
                    child: Text(
                      '150',
                      style: TextStyle(fontSize: 19, color: Color(0x80000000)),
                    ),
                  ),
                  Text(    item.username, 
                textAlign: TextAlign.right, 
                
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(item.urlAvatar),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 23.0,
                    backgroundColor: Colors.white,
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 17, color: Color(0x80000000)),
                    ),
                  ),
                ]),
          ],
        ),
        // هنا ننادي على حساب البطل في الانستغرام
        onTap: () {},
      ); 
      Widget buildCheckBox(index) => InkWell( 
                       onTap: () {
          setState(() {
            isInLeaderBoard[index] = !isInLeaderBoard[index];  
          });
        },  
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: isInLeaderBoard[index]
                ? Icon(
                    Icons.check,
                    size: 23.0,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.check_box_outline_blank,
                    size: 23.0,
                    color: Colors.blue,
                  ),
          ),
        ), 

                    
  ); 
}
