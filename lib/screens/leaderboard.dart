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

class _LeaderBoardState extends State<LeaderBoard>
    with TickerProviderStateMixin {
  List<Chat> items = List.of(Data.chats);
  TabController _controller;
  List<bool> isInLeaderBoard;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
    isInLeaderBoard = List<bool>.filled(items.length, false);
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Colors.white,
                          child: Text(
                            '1',
                            style: TextStyle(
                                fontSize: 25, color: Color(0x80000000)),
                          ),
                        ),
                      ]),
                ],
              ),
            ),

            // نقاط التحدي

            ListView.separated(
              itemCount: items.length,
              separatorBuilder: (context, index) =>
                  Divider(thickness: 2.0, color: Color(0xffEBEBEB)),
              itemBuilder: (context, index) {
                final item = items[index]; 
                bool valLeaderboard = isInLeaderBoard[index];
                return SlidableWidget(
                  child: buildListTile(item, valLeaderboard),
                  onDismissed: (action) =>
                      dismissSlidableItem(context, index, action),
                );
              },
            ),
          ],
        ),
      ),
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
  
  Widget buildListTile(Chat item, bool valLeaderboard) => ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      leading: buildCheckBox(valLeaderboard), 
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                 
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                    child: Text(
                      '150',
                      style: TextStyle(fontSize: 20, color: Color(0x80000000)),
                    ),
                  ),
                  Text(
                    item.username,
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Spacer(),
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(item.urlAvatar),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 30.0,
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
      Widget buildCheckBox(bool leaderboard) => Checkbox( 
    

                      value: leaderboard, 
                      onChanged: (bool newValue) { 
                        setState(
                          () {
                            leaderboard = newValue;
                           //  اذا كانت التشيك بوكس كليكد نضيفه الى قائمة المتصدرين
                            if (leaderboard == true) {
                              // Here goes your functionality that add the user in list leaderboard
                              print('is clicked'); 
                            } 
                          },
                        );
                      },
                      activeColor: Colors.blue, 
                      checkColor: Colors.blue, 
  ); 
}
