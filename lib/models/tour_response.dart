// To parse this JSON data, do
//
//     final tourResponse = tourResponseFromJson(jsonString);

import 'dart:convert';

TourResponse tourResponseFromJson(String str) => TourResponse.fromJson(json.decode(str));

String tourResponseToJson(TourResponse data) => json.encode(data.toJson());

class TourResponse {
  TourResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory TourResponse.fromJson(Map<String, dynamic> json) => TourResponse(
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    required this.data,
    required this.pagination,
  });

  List<Datum>? data;
  Pagination ?pagination;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "pagination": pagination!.toJson(),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.areaId,
    required this.phone,
    required this.image,
    required this.whatsapp,
    required this.distance,
    required this.rate,
    required this.latitude,
    required this.longitude,
    required this.images,
    required this.tags,
  });

  int? id;
  String? name;
  String? description;
  int? categoryId;
  int? areaId;
  String? phone;
  String? image;
  String? whatsapp;
  int? distance;
  int? rate;
  String? latitude;
  String? longitude;
  List<String>? images;
  List<dynamic>? tags;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    categoryId: json["category_id"],
    areaId: json["area_id"],
    phone: json["phone"],
    image: json["image"],
    whatsapp: json["whatsapp"],
    distance: json["distance"],
    rate: json["rate"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    images: List<String>.from(json["images"].map((x) => x)),
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "category_id": categoryId,
    "area_id": areaId,
    "phone": phone,
    "image": image,
    "whatsapp": whatsapp,
    "distance": distance,
    "rate": rate,
    "latitude": latitude,
    "longitude": longitude,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "tags": List<dynamic>.from(tags!.map((x) => x)),
  };
}

class Pagination {
  Pagination({
    required this.total,
    required  this.count,
    required this.perPage,
    required   this.currentPage,
    required this.totalPages,
    required  this.nextPageUrl,
    required this.prevPageUrl,
  });

  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;
  dynamic nextPageUrl;
  dynamic prevPageUrl;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    count: json["count"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
    nextPageUrl: json["next_page_url"],
    prevPageUrl: json["prev_page_url"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "count": count,
    "per_page": perPage,
    "current_page": currentPage,
    "total_pages": totalPages,
    "next_page_url": nextPageUrl,
    "prev_page_url": prevPageUrl,
  };
}
