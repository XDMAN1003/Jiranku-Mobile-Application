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
}

final List<User> _users = <User>[
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
      userID: "Hello123"),
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
      userID: "Hello456"),
];
