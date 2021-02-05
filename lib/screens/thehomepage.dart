import 'package:flutter/material.dart'; 
import 'package:image_picker/image_picker.dart'; 
import 'dart:io'; 


class TheHomePage extends StatefulWidget {
  TheHomePage({Key key}) : super(key: key);

  @override
  _TheHomePageState createState() => _TheHomePageState();
} 



class _TheHomePageState extends State<TheHomePage> { 
  File _image; 
  bool loadPrs = false;   
   _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  } 
   _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
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
                      leading: new Icon(Icons.photo_library),
                      title: new Text('اضافة من المجلد'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }), 
                      new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('اخذ صورة'),
                    onTap: () {
                      _imgFromCamera();
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

      
  body: Container( 
       padding: EdgeInsets.all(15.0), 
  child: ListView(
    scrollDirection: Axis.vertical, 
    children: <Widget>[ 
      GestureDetector(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: Align(
                        alignment: Alignment(0.3, 0.2),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent, 
                          child: new IconButton(
                            icon: new Icon(Icons.add_a_photo,
                                color: Colors.black),
                            color: Color(0xffFFFFFF),
                            //   هنا نبرمج الفاكشن الخاصة باضافة صورة عند الضغط على أيقونة الكامرة
                          
                          onPressed: (){}, 
                          ), 
                        ),
                      ),
                    ), 
 Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 95,
                        child: _image == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: new Image.asset(
                                  'assets/images/imageprofile.png',
                                  //height: 250.0,
                                  //width: 100.0,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.file(
                                  _image,
                                  //height: 250.0,
                                  //width: 100.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                      ),
                    ), 

     SizedBox(height: 25.0), 
     Text("اسم البطل", 
            textAlign: TextAlign.center,  
            style: new TextStyle(
                        fontSize: 25.0, 
                        color: Color(0xff000000), 
                        ), 
            ),  
          SizedBox(height: 25.0), 
          Row(
            children: <Widget>[ 

            ], 
          ), 
      Container( 
           //width: MeiaQuery.of(context).size.width, 
           height: 65.0, 
           width: 65.0, 
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

  ), 
      );  
    } 
} 