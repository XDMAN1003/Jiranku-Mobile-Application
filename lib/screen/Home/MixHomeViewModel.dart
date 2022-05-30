import 'package:fyp_project_v2/app/dependencies.dart';
import 'package:fyp_project_v2/models/news.dart';
import 'package:fyp_project_v2/models/product.dart';
import 'package:fyp_project_v2/models/user.dart';
import 'package:fyp_project_v2/screen/Home/HomeViewModel.dart';
import 'package:fyp_project_v2/screen/viewmodel.dart';
import 'package:fyp_project_v2/services/auth/auth_service.dart';
import 'package:fyp_project_v2/services/news/news_service.dart';
import 'package:fyp_project_v2/services/product/product_service.dart';

class MixHomeScreenViewModel extends Viewmodel {
  final HomeViewmodel _homeViewmodel;

  MixHomeScreenViewModel({homeViewmodel}) : _homeViewmodel = homeViewmodel {
    _loadHome();
    //_loadHomeProduct();
    _loadAllUsers();
    //_loadHomeNews();
    
  }

  ProductService get service => dependency();
  NewService get service2 => dependency();
  AuthService get userService => dependency();
  bool _react1 = true;
  bool _react2 = true;
  bool _react3 = true;
  bool _react4 = true;

  set react1(val) {
    turnBusy();
    _react1 = val;
    turnIdle();
  }

  get react1 => _react1;

  set react2(val) {
    turnBusy();
    _react2 = val;
    turnIdle();
  }

  get react2 => _react2;

  set react3(val) {
    turnBusy();
    _react3 = val;
    turnIdle();
  }

  get react3 => _react3;

  set react4(val) {
    turnBusy();
    _react4 = val;
    turnIdle();
  }

  get react4 => _react4;

  List<User>? _usersList;
  get usersList => _usersList;
  void _loadAllUsers() =>
      update(() async => _usersList = await userService.getAllUsers());

  User getAuthor(id) =>
      usersList.firstWhere((element) => element.id == id);

  List<Product>? _products;
  get products => _products;
  List<News>? _news;
  get news => _news;
  List<dynamic>? _items;
  set items(val) {
    turnBusy();
    _items = val;
    //print(_items);
    turnIdle();
  }

  get items => _items;

  User? get user => _homeViewmodel.user;
  void _loadHome() {
    List<dynamic> myHome = [];
    turnBusy();
    update(() async {
      List<Product>? _productList = await service.getProductWithoutUser();
      List<News>? _newsList = await service2.getNewsWithoutUser();
      //print(_newsList);
      //print(_productList);
      myHome.addAll(_productList!);
      myHome.addAll(_newsList!);
      myHome.shuffle();
      items = myHome;
    });
    turnIdle();
  }

  void _loadHomeProduct() =>
      update(() async => _products = await service.getProductWithoutUser());
  void _loadHomeNews() =>
      update(() async => _news = await service2.getNewsWithoutUser());
}
