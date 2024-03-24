// To parse this JSON data, do
//
//     final breedDetailModel = breedDetailModelFromJson(jsonString);

import 'dart:convert';

BreedDetailModel breedDetailModelFromJson(String str) =>
    BreedDetailModel.fromJson(json.decode(str));

String breedDetailModelToJson(BreedDetailModel data) =>
    json.encode(data.toJson());

class BreedDetailModel {
  String? id;
  String? url;
  int? width;
  int? height;

  BreedDetailModel({
    this.id,
    this.url,
    this.width,
    this.height,
  });

  factory BreedDetailModel.fromJson(Map<String, dynamic> json) =>
      BreedDetailModel(
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "width": width,
        "height": height,
      };
}
