class User{
  String _token;
  int    _id;
  String _hero_instagram;
  String _social_id;
  String _hero_target;
  int    _n_leader_board;
  int    _is_emailVerefied;
  String _created_at;
  String _updated_at;
  String _user_id;
  String _role;
  int    _points;
  int    _capsules;
  bool    isAdmin;
  String  password;
  String  _name;
  String _pictureName;
  bool   _is_banned;

  User(this._id, this._user_id, _name, _social_id, this._hero_instagram, this._hero_target, this._capsules, this._points, this.isAdmin,
       this._n_leader_board, this._is_emailVerefied,this._is_banned, this._role, this._created_at, this._updated_at, this._pictureName);

  
  String get token          => _token;
  int    get id             => _id;
  String get name           => _name;
  String get user_id        => _user_id;
  String get hero_instagram => _hero_instagram;
  String get hero_target    => _hero_target;
  int    get n_leader_board => _n_leader_board;
  int    get is_verefied    => _is_emailVerefied;
  String get social_id      => _social_id;
  int    get points         => _points;
  int    get capsules       => _capsules;
  String get created_at     => created_at;
  String get updated_at     => _updated_at;
  String get role           => _role;
  String get pictureName    => _pictureName;
  bool   get is_banned      => _is_banned;
  
  set setToken(String token)           => _token = token;
  set setId(int id)                    => _id = id;
  set setUserId(String userId)         => _user_id = userId;
  set setName(String dysplay_name)     => _name = dysplay_name;
  set setEmail(String social_id)       => _social_id = social_id;
  set setRole(String role)             => _role = _role;
  set setInstagram(String instagram)   => _hero_instagram = instagram;
  set setHero_target(String target)    => _hero_target;
  set setIsMailVerefied(int isVerefied)=> _is_emailVerefied = isVerefied;
  set setNleader(int n_leader_board)   => _n_leader_board = n_leader_board; 
  set setPoints(int points)            => _points = points;
  set setCapsules(int capsules)        => _capsules = capsules;                 
  set setPictureName(String picture)   => _pictureName;
  set setIs_banned(bool isbanned)      => _is_banned;

  User.fromJson(Map<String, dynamic> map){
   _id             = map["id"];
   _social_id      = map["social_id"];
   _name           = map["display_name"];
   _role           = map["role"];
   _user_id        = map["user_Id"];
   _hero_instagram = map["hero_instagram"];
   _hero_target    = map["hero_target"];
   _is_emailVerefied = map["is_erefied"];
   _n_leader_board = map["n_leader_board"]; 
   _points         = map["points"];
    _capsules      = map["capsules"];  
   _created_at     = map["created_at"];
   _updated_at     = map["_updated_at"]; 
   _pictureName    = map["pictureName"];
   _is_banned      = map["is_banned"];
 }
  
 
  Map<String, dynamic> toMap(){
    Map map = Map<String, dynamic>();
      map["id"]             = _id             ;
      map["social_id"]      = _social_id      ;
      map["display_name"]   = _name           ;
      map["role"]           = _role           ;
      map["user_Id"]        = _user_id        ;
      map["hero_instagram"] = _hero_instagram ;
      map["is_erefied"]     = _is_emailVerefied    ;
      map["n_leader_board"] = _n_leader_board ;
      map["points"]         = _points         ;
      map["capsules"]       =  _capsules      ;
      map["created_at"]     = _created_at     ;
      map["updated_at"]     = _updated_at     ;  
      map["pictureName"]    = _pictureName    ; 
      map["is_banned"]      = _is_banned   ;

   return map;
 }
} 