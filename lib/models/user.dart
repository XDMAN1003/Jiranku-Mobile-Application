class User {
  String _address;
  String _email;
  String _fullName;
  String _gender;
  String _identity;
  String _invitationCode;
  String _password;
  String _preference;
  String _races;
  String _username;
  String _userID;

  get address => _address;
  set address(value) => _address = value;

  get email => _email;
  set email(value) => _email = value;

  get fullName => _fullName;
  set fullName(value) => _fullName = value;

  get gender => _gender;
  set gender(value) => _gender = value;

  get identity => _identity;
  set identity(value) => _identity = value;

  get invitationCode => _invitationCode;
  set invitationCode(value) => _invitationCode = value;

  get password => _password;
  set password(value) => _password = value;

  get preference => _preference;
  set preference(value) => _preference = value;

  get races => _races;
  set races(value) => _races = value;

  get username => _username;
  set username(value) => _username = value;

  get userID => _userID;
  set userID(value) => _userID = value;

  User({  
  String address= "",
  String email= "",
  String fullName= "",
  String gender= "",
  String identity= "",
  String invitationCode= "",
  String password= "",
  String preference = "FFFFFFFF",
  String races= "",
  String username= "",
  String userID= "",}):
   _address= address,
  _email= email,
  _fullName= fullName,
  _gender= gender,
  _identity= identity,
  _invitationCode= invitationCode,
  _password= password,
  _preference = preference ,
  _races= races,
  _username= username,
  _userID= userID;

  User.copy(User from): this(
    address: from.address,
    email: from.email,
    fullName: from.fullName,
    gender: from.gender,
    identity: from.identity,
    invitationCode: from.invitationCode,
    password: from.password,
    preference: from.preference ,
    races: from.races,
    username: from.username,
    userID: from.userID 
  ); 

  User.fromJson(Map<String, dynamic> json):
  this(
    address: json["address"] ?? "",
    email: json["email"] ?? "",
    fullName: json["fullName"] ?? "",
    gender: json["gender"] ?? "",
    identity: json["identity"] ?? "",
    invitationCode: json["invitationCode"] ?? "",
    password: json["password"] ?? "",
    preference: json["preference "] ?? "",
    races: json["races"] ?? "",
    username: json["username"] ?? "",
    userID: json["userID"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    'address': address,
    'email': email,
    'fullName': fullName,
    'gender': gender,
    'identity': identity,
    'invitationCode': invitationCode,
    'password': password,
    'preference': preference ,
    'races': races,
    'username': username,
    'userID': userID 
  };

}
