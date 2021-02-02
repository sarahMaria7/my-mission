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

class _LeaderBoardState extends State<LeaderBoard> {
  List<Chat> items = List.of(Data.chats);
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
                labelStyle: TextStyle(
                  fontSize: 19.0,
                ),
                indicatorColor: Colors.transparent,
                labelColor: Color(0xff000000),
                unselectedLabelColor: Color(0x80000000),
                indicator: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/pressed.png',
                    ),
                  ),
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

                return SlidableWidget(
                  child: buildListTile(item),
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

  Widget buildListTile(Chat item) => ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.white,
          child: Text(
            '150',
            style: TextStyle(fontSize: 20, color: Color(0x80000000)),
          ),
        ), 
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: <Widget>[
            Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    item.username,
                    style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ), 
                  
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(item.urlAvatar),
                  ),
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
}
