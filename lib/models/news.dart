import 'package:intl/intl.dart';

class News {
  String _id;
  String _postAuthorID;
  String _location;
  String _description;
  String _status;
  String _photos;
  String _reference;
  DateTime? _publishDateTime;

  get id => _id;
  set id(value) => _id = value;

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
  String id= "",
  String postAuthorID= "",
  String location= "",
  String description= "",
  String status= "",
  String photos= "",
  String reference= "",
  DateTime? publishDateTime,
  }):
   _id= id,
  _postAuthorID= postAuthorID,
  _location= location,
  _description= description,
  _status= status,
  _photos= photos,
  _reference= reference,
  _publishDateTime = publishDateTime;

  News.copy(News from): this(
    id: from.id,
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
    id: json["id"] ?? "",
    postAuthorID: json["postAuthorID"] ?? "",
    location: json["location"] ?? "",
    description: json["description"] ?? "",
    status: json["status"] ?? "",
    photos: json["photos"] ?? "",
    reference: json["reference"] ?? "",
    publishDateTime: (json["publishDateTime"] != "") ? DateTime.parse(json["publishDateTime"]) : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'postAuthorID': postAuthorID,
    'location': location,
    'description': description,
    'status': status,
    'photos': photos,
    'reference': reference,
    'publishDateTime':  DateFormat('yyyy-MM-dd kk:mm:ss').format(publishDateTime),
  };

}
