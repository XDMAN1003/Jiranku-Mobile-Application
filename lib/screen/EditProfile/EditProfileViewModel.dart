import 'package:fyp_project_v2/app/dependencies.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/viewmodel.dart';
import 'package:fyp_project_v2/services/auth/auth_service.dart';

import '../user_viewmodel.dart';

class EditProfileViewModel extends Viewmodel {
  UserViewmodel get userViewmodel => dependency();
  AuthService get _service => dependency();
  User _current = User();
  get user => userViewmodel.user;

  String _confirmPassword = "";
  bool _showPassword = false;  

  set showPassword(val){
    turnBusy();
    _showPassword = val;
    turnIdle();
  }
  get showPassword => _showPassword;

  get address => _current.address;
  set address(value) {
    turnBusy();
    _current.address = value;
    turnIdle();
  }
  get userID => _current.userID;
  set userID(value) {
    turnBusy();
    _current.userID = value;
    turnIdle();
  }

get invitationCode => _current.invitationCode;
  set invitationCode(value) {
    turnBusy();
    _current.invitationCode = value;
    turnIdle();
  }


  get email => _current.email;
  set email(value) {
    turnBusy();
    _current.email = value;
    turnIdle();
  }

  get fullName => _current.fullName;
  set fullName(value) {
    turnBusy();
    _current.fullName = value;
    turnIdle();
  }

  get identity => _current.identity;
  set identity(value) {
    turnBusy();
    _current.identity = value;
    turnIdle();
  }

  get gender => _current.gender;
  set gender(value) {
    turnBusy();
    _current.gender = value;
    turnIdle();
  }

  get races => _current.races;
  set races(value) {
    turnBusy();
    _current.races = value;
    turnIdle();
  }

  get username => _current.username;
  set username(value) {
    turnBusy();
    _current.username = value;
    turnIdle();
  }

  get password => _current.password;
  set password(value) {
    turnBusy();
    _current.password = value;
    turnIdle();
  }

  get preference => user.preference;
  set preference(value) {
    turnBusy();
    user.preference = value;
    turnIdle();
  }

  get confirmPassword => _confirmPassword;
  set confirmPassword(value) {
    turnBusy();
    _confirmPassword = value;
    turnIdle();
  }


  Future<User?> updateUser() async {
    _current.preference = user.preference;
    userViewmodel.user = _current;
    turnBusy();
    final _result = await _service.updateUser(user: _current);
    turnIdle();
    return _result;
  }
}
