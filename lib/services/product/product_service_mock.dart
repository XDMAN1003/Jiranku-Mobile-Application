import 'package:fyp_project_v2/models/product.dart';
import 'package:uuid/uuid.dart';

import 'product_service.dart';

class ProductServiceMock implements ProductService {
  Future<List<Product>?>? getProductByUser(dynamic postAuthorID) async {
    //Product _Product = _Product_list.firstWhere((Product_item) => Product_item.postAuthorID == postAuthorID);
    List<Product> _product = _products
        .where((element) => element.postAuthorID == postAuthorID)
        .toList();
    return _product;
  }

  Future<Product> updateProductStatus(Product product) async {
    int index =
        _products.indexWhere((element) => element.postID == product.postID);
    _products[index].description = product.description;
    _products[index].location = product.location;
    _products[index].photos = product.photos;
    _products[index].postAuthorID = product.postAuthorID;
    _products[index].postID = product.postID;
    //_products[index].publishDateTime = product.publishDateTime;
    _products[index].contactNo = product.contactNo;
    _products
        .forEach((element) => print("${element.postID} => ${element.contactNo}"));
    return product;
  }

  Future<Product> addProduct(Product product) async {
    _products.add(product);
    return product;
  }

  Future<List<Product>?>? getProductWithoutUser() async {
    return _products;
  }

  Future<void> deleteProduct(Product product) async {
    _products.remove(product);
  }
}

List<Product> _products = [
  Product(
    postID: Uuid().v1(),
    postAuthorID: "98bfd227-18d8-4f18-bcef-dae6f94ffc95",
    location: "Bandar Laguna Merbok",
    publishDateTime: DateTime(2022, 4, 1, 20, 30),
    photos: "sample (6).jpg",
    contactNo: "011-23456789",
    stock: 100,
    price: 10.00,
    description: "Ready Stock Nike Sandal Men Fashion/Nike Slipper/Selipar Adidas Lelaki Perempuan Men Women Sandals"
  ),
  Product(
    postID: Uuid().v1(),
    postAuthorID: "98bfd227-18d8-4f18-bcef-dae6f94ffc95",
    location: "Taman Intan",
    publishDateTime: DateTime(2022, 5, 22, 23, 30),
    photos: "sample (7).jpg",
    contactNo: "011-0231003",
    stock: 5,
    price: 102.30,
    description: "Minimalist Lab GRACE Rolling Stones Sterling Silver Necklace, Bracelet"
  ),
  Product(
    postID: Uuid().v1(),
    postAuthorID: "98bfd227-18d8-4f18-bcef-dae6f94ffc95",
    location: "Bukit Bayan",
    publishDateTime: DateTime(2022, 5, 24, 20, 00),
    photos: "sample (8).jpg",
    contactNo: "012-6081619",
    stock: 50,
    price: 30.10,
    description: "Nestle Milo Activ-Go Chocolate Malt Powder Softpack 2kg"
  ),
];
