import '../../app/dependencies.dart';
import '../../models/user.dart';
import 'auth_service.dart';
import '../rest.dart';

class AuthServiceFirebase implements AuthService{
  RestService get rest => dependency();

  Future<User?> registration({required User user}) async {
    try {
      final json = await rest.post('user', data: user);
      final _result = User.fromJson(json);
      return _result;
    } catch (e) {
      return null;
    }
  }

  Future<User?> login({required String email, required String password}) async {
    try {
      var json = await rest.get('/user/login/$email/$password');
      print(json);
      final _result = User.fromJson(json);
      print(_result.id);
      return _result;
    } catch(e) {
      return null;
    }
  }

  Future<List<User>?> getAllUsers() async{
    final listJson = await rest.get('user');
    return (listJson as List)
        .map((itemJson) => User.fromJson(itemJson))
        .toList();
  }

  Future<User?> updateUser({required User user}) async {
    try {
      final json = await rest.put('user/${user.id}',data: user);
      final _result = User.fromJson(json);
      return _result;
    } catch (e) {
      return null;
    }
  }
  

  // Future<String?> getUserById({id}) async {
  //   try {
  //     var json = await rest.get('user/$id');
  //     final _result = User.fromJson(json);
  //     return _result.fullName;
  //   } catch (e) {
  //     return null;
  //   }
  // }
}