import 'package:fyp_project_v2/models/product.dart';

abstract class ProductService {
  Future<List<Product>?>? getProductByUser(dynamic postAuthorID);
  Future<Product> updateProductStatus(Product product);
  Future<Product> addProduct(Product product);
  Future<List<Product>?>? getProductWithoutUser();
  Future<void> deleteProduct(Product product);
}

