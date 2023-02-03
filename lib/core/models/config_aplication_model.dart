import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'config_aplication_model.g.dart';

@JsonSerializable()
class ConfigAplicationModel {

  final String? apiKey;
  final String? baseUrl;
  final String? lenguaje;
  final String? name;
  final String? version;

  ConfigAplicationModel({
    this.apiKey, 
    this.baseUrl, 
    this.lenguaje, 
    this.name, 
    this.version
  });

  factory ConfigAplicationModel.fromRawJson(String str) => ConfigAplicationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ConfigAplicationModel.fromJson(Map<String, dynamic> json) => _$ConfigAplicationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigAplicationModelToJson(this);


}