import 'package:uuid/uuid.dart';

import '../../models/user.dart';
import 'auth_service.dart';

class AuthServiceMock implements AuthService {

  Future<User?> login({required String email, required String password}) async {
    // User _user = _users.firstWhere(
    //     (user) => user.email == email && user.password == password,
    //     orElse: () => null as User);
    // return _user;
    try {
      final _result = _users.firstWhere(
          (user) => user.email == email && user.password == password);
      return _result;
    } catch (e) {
      return null;
    }
  }

  Future<User?> registration({required User user}) async {
    _users.add(user);
    return user;
  }

  Future<List<User>> getAllUsers() async {
    return _users;
    // User _user = _users.firstWhere(
    //     (user) => user.email == email && user.password == password,
    //     orElse: () => null as User);
    // return _user;
  }
  Future<User?> updateUser({required User user}) async {
    // int index = _news_list.indexWhere((element) =>element.id == news.id );
    // _news_list[index].description = news.description;
    // _news_list[index].location = news.location;
    // _news_list[index].photos = news.photos;
    // _news_list[index].postAuthorID = news.postAuthorID;
    // _news_list[index].id = news.id;
    // //_news_list[index].publishDateTime = news.publishDateTime;
    // _news_list[index].status = news.status;
    // _news_list[index].reference = news.reference;    
    // _news_list.forEach((element)=> print("${element.id} => ${element.status}"));
    // return _news;
    int index = _users.indexWhere((element) => element.id == user.id);
    _users[index].address = user.address;
    _users[index].email = user.email;
    _users[index].fullName = user.fullName;
    _users[index].gender = user.gender;
    _users[index].identity = user.identity;
    _users[index].invitationCode = user.invitationCode;
    _users[index].password = user.password;
    _users[index].preference = user.preference;
    _users[index].races = user.races;
    _users[index].username = user.username;
    return user;
  }
  
}
List<User> _users = <User>[
  User(
      address: "Bandar Laguna Merbok",
      email: "abc@gmail.com",
      fullName: "Anya Forger",
      gender: "Female",
      identity: "SP Resident",
      invitationCode: "Hello123",
      password: "123456",
      preference: "TTTTFFFF",
      races: "Malay",
      username: "10ve23iserable",
      id: "3a82ac64-340b-4a2d-8c39-4957f0d401cf"),
  User(
      address: "Sungai Petani",
      email: "xdman1221@gmail.com",
      fullName: "Lim Bao Ren",
      gender: "Male",
      identity: "Admin",
      invitationCode: "Hello123",
      password: "123456",
      preference: "TTTTFFFF",
      races: "Malay",
      username: "XDman",
      id: "94eb65c1-1fd7-4e2d-aae5-ce5432681a9e"),
  User(
      address: "Ayer Tawar",
      email: "brother0330@gmail.com",
      fullName: "Kong Xiao Ying",
      gender: "Female",
      identity: "Admin",
      invitationCode: "Hello123",
      password: "123456",
      preference: "TFTFTFTF",
      races: "Chinese",
      username: "XYing",
      id: "98bfd227-18d8-4f18-bcef-dae6f94ffc95"),
];
