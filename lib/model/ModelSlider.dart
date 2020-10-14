// To parse this JSON data, do
//
//     final modelSlider = modelSliderFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ModelSlider modelSliderFromJson(String str) => ModelSlider.fromJson(json.decode(str));

String modelSliderToJson(ModelSlider data) => json.encode(data.toJson());

class ModelSlider {
  ModelSlider({
    @required this.message,
    @required this.status,
    @required this.dataslider,
  });

  String message;
  int status;
  List<Dataslider> dataslider;

  factory ModelSlider.fromJson(Map<String, dynamic> json) => ModelSlider(
    message: json["message"],
    status: json["status"],
    dataslider: List<Dataslider>.from(json["dataslider"].map((x) => Dataslider.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "dataslider": List<dynamic>.from(dataslider.map((x) => x.toJson())),
  };
}

class Dataslider {
  Dataslider({
    @required this.idSlider,
    @required this.imageSlider,
    @required this.idUser,
  });

  String idSlider;
  String imageSlider;
  String idUser;

  factory Dataslider.fromJson(Map<String, dynamic> json) => Dataslider(
    idSlider: json["id_slider"],
    imageSlider: json["image_slider"],
    idUser: json["id_user"],
  );

  Map<String, dynamic> toJson() => {
    "id_slider": idSlider,
    "image_slider": imageSlider,
    "id_user": idUser,
  };
}
