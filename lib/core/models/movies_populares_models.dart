import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'movies_populares_models.g.dart';

@JsonSerializable()
class PopularesModel {

  PopularesModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<SeriesModel>? results;
  int? totalPages;
  int? totalResults;

  factory PopularesModel.fromRawJson(String str) => PopularesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PopularesModel.fromJson(Map<String, dynamic> json) => _$PopularesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularesModelToJson(this);

}


@JsonSerializable()
class SeriesModel {

  String? backdropPath;
  DateTime? firstAirDate;
  List<int>? genreIds;
  int? id;
  String? name;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  double? voteAverage;
  int? voteCount;

  SeriesModel({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  factory SeriesModel.fromRawJson(String str) => SeriesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SeriesModel.fromJson(Map<String, dynamic> json) => _$SeriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesModelToJson(this);

}