import '../../models/user.dart';

abstract class AuthService {
  Future<User?> registration({required User user}); 
  Future<User?> login({required String email, required String password});
  Future<List<User>?> getAllUsers();
  Future<User?> updateUser({required User user});

  //Future<String?> getUserById({id});
}