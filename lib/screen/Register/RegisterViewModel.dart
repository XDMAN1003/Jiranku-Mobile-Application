import 'package:fyp_project_v2/app/dependencies.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/viewmodel.dart';
import 'package:fyp_project_v2/services/auth/auth_service.dart';

class RegisterViewModel extends Viewmodel {
  AuthService get _service => dependency();
  User _user = User();
  String _confirmPassword = "";
  bool _showPassword = false;

  set showPassword(val){
    turnBusy();
    _showPassword = val;
    turnIdle();
  }
  get showPassword => _showPassword;

  get address => _user.address;
  set address(value) {
    turnBusy();
    _user.address = value;
    turnIdle();
  }

  get email => _user.email;
  set email(value) {
    turnBusy();
    _user.email = value;
    turnIdle();
  }

  get fullName => _user.fullName;
  set fullName(value) {
    turnBusy();
    _user.fullName = value;
    turnIdle();
  }

  get identity => _user.identity;
  set identity(value) {
    turnBusy();
    _user.identity = value;
    turnIdle();
  }

  get gender => _user.gender;
  set gender(value) {
    turnBusy();
    _user.gender = value;
    turnIdle();
  }

  get races => _user.races;
  set races(value) {
    turnBusy();
    _user.races = value;
    turnIdle();
  }

  get username => _user.username;
  set username(value) {
    turnBusy();
    _user.username = value;
    turnIdle();
  }

  get password => _user.password;
  set password(value) {
    turnBusy();
    _user.password = value;
    turnIdle();
  }

  get preference => _user.preference;
  set preference(value) {
    turnBusy();
    _user.preference = value;
    turnIdle();
  }

  get confirmPassword => _confirmPassword;
  set confirmPassword(value) {
    turnBusy();
    _confirmPassword = value;
    turnIdle();
  }

  get user => _user;
  set user(value) => _user = user;

  Future<User?> registration() async {
    turnBusy();
    final User? _result = await _service.registration(user: _user);
    if (_result != null) {
      _user = _result;
    }
    turnIdle();
    return _result;
  }
}
