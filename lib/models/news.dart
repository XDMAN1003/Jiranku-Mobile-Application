class News {
  String _postID;
  String _postAuthorID;
  String _location;
  String _description;
  String _status;
  String _photos;
  String _reference;
  DateTime? _publishDateTime;

  get postID => _postID;
  set postID(value) => _postID = value;

  get postAuthorID => _postAuthorID;
  set postAuthorID(value) => _postAuthorID = value;

  get location => _location;
  set location(value) => _location = value;

  get description => _description;
  set description(value) => _description = value;

  get status => _status;
  set status(value) => _status = value;

  get photos => _photos;
  set photos(value) => _photos = value;

  get reference => _reference;
  set reference(value) => _reference = value;

  get publishDateTime => _publishDateTime;
  set publishDateTime(value) => _publishDateTime = value;

  News({  
  String postID= "",
  String postAuthorID= "",
  String location= "",
  String description= "",
  String status= "",
  String photos= "",
  String reference= "",
  DateTime? publishDateTime,
  }):
   _postID= postID,
  _postAuthorID= postAuthorID,
  _location= location,
  _description= description,
  _status= status,
  _photos= photos,
  _reference= reference,
  _publishDateTime = publishDateTime;

  News.copy(News from): this(
    postID: from.postID,
    postAuthorID: from.postAuthorID,
    location: from.location,
    description: from.description,
    status: from.status,
    photos: from.photos,
    reference: from.reference,
    publishDateTime: from.publishDateTime ,
  ); 

  News.fromJson(Map<String, dynamic> json):
  this(
    postID: json["postID"] ?? "",
    postAuthorID: json["postAuthorID"] ?? "",
    location: json["location"] ?? "",
    description: json["description"] ?? "",
    status: json["status"] ?? "",
    photos: json["photos"] ?? "",
    reference: json["reference"] ?? "",
    publishDateTime: (json["reference"] == "") ? DateTime.parse(json["publishDateTime"]) : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    'postID': postID,
    'postAuthorID': postAuthorID,
    'location': location,
    'description': description,
    'status': status,
    'photos': photos,
    'reference': reference,
    'publishDateTime': publishDateTime,
  };

}
