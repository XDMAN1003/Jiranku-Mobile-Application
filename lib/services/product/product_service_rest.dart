import 'package:fyp_project_v2/models/product.dart';

import '../../app/dependencies.dart';
import '../rest.dart';
import 'product_service.dart';

class ProductServiceRest implements ProductService{
  RestService get rest => dependency();

  Future<List<Product>?>? getProductByUser(dynamic postAuthorID) async {
    final listJson = await rest.get('product/${postAuthorID}');
    return (listJson as List)
        .map((itemJson) => Product.fromJson(itemJson))
        .toList();
  }

  Future<Product> updateProductStatus(Product product) async{
    final json = await rest.patch('product/${product.postID}',data: product);
    return Product.fromJson(json);
  }

  Future<Product> addProduct(Product product) async{
    final json = await rest.post('product', data: product); 
    return Product.fromJson(json);
  }

  Future<List<Product>?>? getProductWithoutUser() async{
    final listJson = await rest.get('product');
    return (listJson as List)
        .map((itemJson) => Product.fromJson(itemJson))
        .toList();
  }

  Future<void> deleteProduct(Product Product) async{
    await rest.delete('product/${Product.postID}');
  }
}
