
import 'package:fyp_project_v2/app/dependencies.dart';
import 'package:fyp_project_v2/models/product.dart';
import 'package:fyp_project_v2/services/product/product_service.dart';

import '../user_viewmodel.dart';
import '../viewmodel.dart';

class PostProductViewModel extends Viewmodel {
  UserViewmodel get userViewmodel => dependency();
  ProductService get _service => dependency();
  get user => userViewmodel.user;
  Product _product= Product();

  String _map = "";
  get map => _map;
  set map(value) {
    turnBusy();
     _map = value;
     turnIdle();
  }

  get postID => _product.postID;
  set postID(value) => update( () async=> _product.postID = value) ;

  get location => _product.location;
  set location(value) =>  update( () async=> _product.location = value);

  get description => _product.description;
  set description(value) =>  update( () async=> _product.description = value);

  get photos => _product.photos;
  set photos(value) {
     turnBusy();
     _product.photos = value;
     turnIdle();
  }

  get contactNo => _product.contactNo;
  set contactNo(value) =>  update( () async=> _product.contactNo = value);

  get stock => _product.stock;
  set stock(value) =>  update( () async=> _product.stock = value);

  get price => _product.price;
  set price(value) =>  update(() async=> _product.price = value);

  Future<Product?> postProduct() async {
    _product.postAuthorID = user.userID;
    _product.publishDateTime = new DateTime.now();
    //_post.postID = uuid.v1();
    turnBusy();
    //final User? _result = await _service.registration(user: _user);
    final Product _result = await _service.addProduct(_product);
    // if (_result != null) {
    //   _user = _result;
    // }
    turnIdle();
    return _result;
  }
}