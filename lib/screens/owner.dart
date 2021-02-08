import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class Myhomeowner extends StatefulWidget {

  Myhomeowner({Key key}) : super(key: key);
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Myhomeowner> {

  var _searchview = new TextEditingController();

  bool _firstSearch = true;
  String _query = "";

  List<String> _items;
  List<String> _filterList;



  @override

  void initState() {
    super.initState();
    _items = new List<String>();
    _items = [
      "ثائر",
      "البطل 1",
      "البطلة 1",
      "البطل 2",
      "البطلة 2",

    ];
    _items.sort();
  }

  HomeState() {
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

      padding: EdgeInsets.all(15.0),
      child: TextField(
        controller: _searchview,
        autocorrect: true,
        decoration: InputDecoration(
          suffixIcon: new Icon(Icons.search_outlined),
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



  ///create list View
  ///


  Widget _performSearch() {
    _filterList = new List<String>();
    for (int i = 0; i < _items.length; i++) {
      var item = _items[i];

      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(item);
      }
    }
    return _createFilteredListView();
  }


  Widget _createFilteredListView() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: _filterList.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: Colors.white,
              elevation: 5.0,
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: new Text("${_filterList[index]}"),
              ),
            );
          }),
    );
  }



// switch button
  bool value_1 = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(

        backgroundColor: Color(0XffEBEBEB),
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {}),
        title: Center(
          child: Text(
            "Command Center",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body:
      new Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: new Column(
          children: <Widget>[
            _createSearchView(),
            _firstSearch ? _createListView() : _performSearch()
          ],
        ),
      ),




    );
  }




  // ListView
  Widget _createListView() {
    return new Flexible(
      child: Padding(
        padding: EdgeInsets.all(15.0),

        child: new ListView.builder(
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                height: 50,
                margin: EdgeInsets.all(2),

                child: Center(


                  child: Row(
                    children: <Widget>[

                      Container(

                        child:    Image.asset(
                          'assets/images/verified.png',
                          width: 30,
                          height: 30,
                        ),
                      ),

                      Spacer(),

                      //switch
                      Container(

                        child:
                        AdvancedSwitch(
                          width: 56,
                          height: 25,
                          value: value_1,
                          onChanged: (value) => setState(() {
                            value_1 = value;
                          }),
                        ),
                      ),

                      Spacer(),


                      Container(

                        child: SingleChildScrollView(

                          child:
                          Text('${_items[index]}',
                            style: TextStyle(
                              fontFamily: "AlJazeera",
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),

                      //image of hero

                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(2),

                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 30,
                            child:
                            Image.asset(
                              'assets/images/logoblack.png',),


                          ),

                        ),
                      ),


                      Spacer(),

                      //ordre
                      Container(

                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 14.5,
                            child:Text('${index + 1}',
                              style: TextStyle(color: Colors.black),),
                          ),
                        ),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,

                          border: new Border.all(
                            color: Colors.black,

                          ),
                        ),
                      ),




                    ],
                  ),

                ),
              );
            }),

      ),
    );
  }


}
