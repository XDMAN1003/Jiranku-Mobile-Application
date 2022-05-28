class Product {
  String _postID;
  String _postAuthorID;
  String _location;
  String _description;
  String _photos;
  String _contactNo;
  int _stock;
  double _price;
  DateTime? _publishDateTime;

  get postID => _postID;
  set postID(value) => _postID = value;

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
  String postID= "",
  String postAuthorID= "",
  String location= "",
  String description= "",
  String photos= "",
  String contactNo= "",
  int stock = 0,
  double price = 0.0,
  DateTime? publishDateTime,
  }):
   _postID= postID,
  _postAuthorID= postAuthorID,
  _location= location,
  _description= description,
  _photos= photos,
  _contactNo= contactNo,
  _stock = stock,
  _price = price,
  _publishDateTime = publishDateTime;

  Product.copy(Product from): this(
    postID: from.postID,
    postAuthorID: from.postAuthorID,
    location: from.location,
    description: from.description,
    photos: from.photos,
    contactNo: from.contactNo,
    stock: from.stock,
    price: from.price,
    publishDateTime: from.publishDateTime ,
  ); 

  Product.fromJson(Map<String, dynamic> json):
  this(
    postID: json["postID"] ?? "",
    postAuthorID: json["postAuthorID"] ?? "",
    location: json["location"] ?? "",
    description: json["description"] ?? "",
    photos: json["photos"] ?? "",
    contactNo: json["contactNo"] ?? "",
    stock: json["stock"] ?? "",
    price: json["price"] ?? "",
    publishDateTime: json["publishDateTime "] ?? "",
  );

  Map<String, dynamic> toJson() => {
    'postID': postID,
    'postAuthorID': postAuthorID,
    'location': location,
    'description': description,
    'photos': photos,
    'contactNo': contactNo,
    'price': price,
    'stock': stock,
    'publishDateTime': publishDateTime ,
  };

}
