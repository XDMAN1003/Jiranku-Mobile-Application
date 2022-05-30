import '../../app/dependencies.dart';
import '../../services/auth/auth_service.dart';
import '../../models/user.dart';
import '../viewmodel.dart';

class LoginViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  User _user = User();
  bool _showPassword = false;
  bool _showErrorMessage = false;

  get user => _user;
  set user(value) => _user = value;

  get showPassword => _showPassword;
  set showPassword(value) {
    turnBusy();
    _showPassword = value;
    turnIdle();
  }

  get showErrorMessage => _showErrorMessage;
  set showErrorMessage(value) {
    turnBusy();
    _showErrorMessage = value;
    turnIdle();
  }

  get email => _user.email;
  set email(value) {
    turnBusy();
    _showErrorMessage = false;
    _user.email = value;
    turnIdle();
  }

  get password => _user.password;
  set password(value) {
    turnBusy();
    _showErrorMessage = false;
    _user.password = value;
    turnIdle();
  }

  Future<User?> authenticate() async {
    turnBusy();
    //final User _user = await _service.authenticate(login: username, password: password);
    final User? _user = await _service.login(email: email, password: password);
    if (_user == null) _showErrorMessage = true;
    turnIdle();
    return _user;
  }

  Future<User?> authenticate1() async {
    turnBusy();
    email = "xdman1221@gmail.com";
    password = "123456";
    //print("Email:$email | Password:$password");
    //final User _user = await _service.authenticate(login: username, password: password);
    final User? _user = await _service.login(email: email, password: password);
    //print(_user!.id);
    if (_user == null) _showErrorMessage = true;
    turnIdle();
    return _user;
  }
}
