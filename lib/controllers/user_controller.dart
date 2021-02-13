 import 'dart:convert'; 
 import 'package:http/http.dart' as http; 
import 'package:my_mission/models/user.dart'; 

  class UserController{
  


     static User user = User.fromJson(Map()); 
    var status; 
    var rsponseMsg; 
    String url    = 'https://mymission-api.herokuapp.com/api'; 
  
  void addPicture() { 
String myUrl = "$url/addPicture"; 
 http.post(myUrl, 
                  headers: {
                    'Accept':'application/json', 
                    'Authorization' : 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9teW1pc3Npb24tYXBpLmhlcm9rdWFwcC5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2MTI2MzkxMjIsIm5iZiI6MTYxMjYzOTEyMiwianRpIjoiTHcxbjZyRWx5am5adkE5ZyIsInN1YiI6NywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.KBLAgXWYxROCvnsZG9y4BOG6xxsRLvchtlc2CIASE_Q'

                  }, 
                  body: {
                        "pictureName": "heroine.jpg", 
                        "api_password": "xuqhBhc8KkajZbhHoViT" 
                  }).then((response){
                    print('Response status:  ${response.statusCode}'); 
                    print('Response body:  ${response.body}'); 
                  }); 
                  
  
} 


Future getLeaderBoard() async{  
 String myUrl = "$url/getTrandingInPoints"; 
  
    
  http.Response response = await http.post(myUrl, 
                  headers: {
                    'Accept':'application/json', 
                    'Authorization' : 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9teW1pc3Npb24tYXBpLmhlcm9rdWFwcC5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2MTI2MzkxMjIsIm5iZiI6MTYxMjYzOTEyMiwianRpIjoiTHcxbjZyRWx5am5adkE5ZyIsInN1YiI6NywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.KBLAgXWYxROCvnsZG9y4BOG6xxsRLvchtlc2CIASE_Q'

                  }, 
                  body: {
                       "api_password": "xuqhBhc8KkajZbhHoViT"
                  }
 ); 
      
    var data = json.decode(response.body); 
     status =  data['status']; 
       
    var result = data['challenges'];  
  

return  result; 
} 


  getTrandingpoint()async{
    List userList = List<User>();
    var token='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9teW1pc3Npb24tYXBpLmhlcm9rdWFwcC5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2MTI3OTM5NjgsIm5iZiI6MTYxMjc5Mzk2OCwianRpIjoiVzBHUTRJRE1QMTBuQ0VPVSIsInN1YiI6MjgsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.5e2XULJ1NshPGlRkrO7TkcF8OaolR-odQtS-yW-wlDo';
    String myUrl='$url/getTrandingInPoints';
    try{
      http.Response res= await http.post(myUrl,
        headers: { "Accept": 'application/json',
          'Authorization': 'bearer $token'},
        body: {
          "api_password": "xuqhBhc8KkajZbhHoViT"
        }
      );
     var data =  json.decode(res.body);
     List u = data["challenges"];
     for(var i =0; i<u.length; i++)
     {
       var v = User.fromJson(u[i]);
       userList.add(v);
     }
     String g=data["msg"];
     return g;
    }
    catch(e) {}
  }

  } 