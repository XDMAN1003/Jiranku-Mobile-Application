import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../user_viewmodel.dart';
import '../viewmodel.dart';

class HomeViewmodel extends Viewmodel {
  UserViewmodel get _userViewmodel => dependency();
  User? get user => _userViewmodel.user;
  int _selectedIndex = 1;

  get selectedIndex => _selectedIndex;
  set selectedIndex(value) {
    turnBusy();
    _selectedIndex = value;
    turnIdle();
  }

  set user(User? value) => update(() async => _userViewmodel.user = value);
  void authenticate(User user) =>
      update(() async => _userViewmodel.authenticate(user));

  bool get isUserSignedIn => _userViewmodel.isUserSignedIn;
}
