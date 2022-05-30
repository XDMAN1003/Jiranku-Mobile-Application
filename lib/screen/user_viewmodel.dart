import '../../app/dependencies.dart';
import '../../services/auth/auth_service.dart';
import '../../models/user.dart';
import 'viewmodel.dart';

class UserViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  User? _user;

  get user => _user;
  set user(value) {
    turnBusy();
    _user = value;
    turnIdle();
  }
  bool get isUserSignedIn => _user != null;

  void authenticate(User user) async => _user =
      await _service.login(email: user.email, password: user.password);
}
