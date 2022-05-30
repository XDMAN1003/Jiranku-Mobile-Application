import 'package:intl/intl.dart';

class Product {
  String _id;
  String _postAuthorID;
  String _location;
  String _description;
  String _photos;
  String _contactNo;
  int _stock;
  double _price;
  DateTime? _publishDateTime;

  get id => _id;
  set id(value) => _id = value;

  get postAuthorID => _postAuthorID;
  set postAuthorID(value) => _postAuthorID = value;

  get location => _location;
  set location(value) => _location = value;

  get description => _description;
  set description(value) => _description = value;

  get photos => _photos;
  set photos(value) => _photos = value;

  get contactNo => _contactNo;
  set contactNo(value) => _contactNo = value;

  get stock => _stock;
  set stock(value) => _stock = value;

  get price => _price;
  set price(value) => _price = value;

  get publishDateTime => _publishDateTime;
  set publishDateTime(value) => _publishDateTime = value;

  Product({
    String id = "",
    String postAuthorID = "",
    String location = "",
    String description = "",
    String photos = "",
    String contactNo = "",
    int stock = 0,
    double price = 0.0,
    DateTime? publishDateTime,
  })  : _id = id,
        _postAuthorID = postAuthorID,
        _location = location,
        _description = description,
        _photos = photos,
        _contactNo = contactNo,
        _stock = stock,
        _price = price,
        _publishDateTime = publishDateTime;

  Product.copy(Product from)
      : this(
          id: from.id,
          postAuthorID: from.postAuthorID,
          location: from.location,
          description: from.description,
          photos: from.photos,
          contactNo: from.contactNo,
          stock: from.stock,
          price: from.price,
          publishDateTime: from.publishDateTime,
        );

  Product.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"] ?? "",
          postAuthorID: json["postAuthorID"] ?? "",
          location: json["location"] ?? "",
          description: json["description"] ?? "",
          photos: json["photos"] ?? "",
          contactNo: json["contactNo"] ?? "",
          stock: (json["stock"] != "") ? int.parse(json["stock"]) : 0,
          price: (json["price"] != "")
              ? double.parse(json["price"])
              : 0.0,
          publishDateTime: (json["publishDateTime"] != "")
              ? DateTime.parse(json["publishDateTime"])
              : DateTime.now(),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'postAuthorID': postAuthorID,
        'location': location,
        'description': description,
        'photos': photos,
        'contactNo': contactNo,
        'price': price.toString(),
        'stock': stock.toString(),
        'publishDateTime':DateFormat('yyyy-MM-dd kk:mm:ss').format(publishDateTime),
      };
}
