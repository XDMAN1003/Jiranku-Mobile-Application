import '../../models/user.dart';

abstract class AuthService {
  Future<User?> registration({required User user}); 
  Future<User?> login({required String email, required String password});
  Future<List<User>?> getAllUsers();

  //Future<String?> getUserById({id});
}