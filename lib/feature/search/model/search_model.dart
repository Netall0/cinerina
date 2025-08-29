import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  @JsonKey(name: "docs")
  final List<Doc>? docs;
  @JsonKey(name: "total")
  final int? total;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "page")
  final int? page;
  @JsonKey(name: "pages")
  final int? pages;

  SearchModel({this.docs, this.total, this.limit, this.page, this.pages});

  SearchModel copyWith({
    List<Doc>? docs,
    int? total,
    int? limit,
    int? page,
    int? pages,
  }) => SearchModel(
    docs: docs ?? this.docs,
    total: total ?? this.total,
    limit: limit ?? this.limit,
    page: page ?? this.page,
    pages: pages ?? this.pages,
  );

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}

@JsonSerializable()
class Doc {
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "name")
  final String? name; 

  @JsonKey(name: "alternativeName")
  final String? alternativeName;

  @JsonKey(name: "enName")
  final String? enName;

  @JsonKey(name: "type", unknownEnumValue: Type.UNKNOWN)
  final Type? type; 

  @JsonKey(name: "year")
  final int? year;

  @JsonKey(name: "description")
  final String? description;

  @JsonKey(name: "shortDescription")
  final String? shortDescription;

  @JsonKey(name: "movieLength")
  final int? movieLength;

  @JsonKey(name: "isSeries")
  final bool? isSeries;

  @JsonKey(name: "ticketsOnSale")
  final bool? ticketsOnSale;

  @JsonKey(name: "totalSeriesLength")
  final dynamic totalSeriesLength;

  @JsonKey(name: "seriesLength")
  final int? seriesLength;

  @JsonKey(name: "ratingMpaa")
  final String? ratingMpaa;

  @JsonKey(name: "ageRating")
  final int? ageRating;

  @JsonKey(name: "top10")
  final dynamic top10;

  @JsonKey(name: "top250")
  final dynamic top250;

  @JsonKey(name: "typeNumber")
  final int? typeNumber;

  @JsonKey(name: "status")
  final String? status;

  @JsonKey(name: "names")
  final List<NameElement>? names;

  @JsonKey(name: "externalId")
  final ExternalId? externalId;

  @JsonKey(name: "logo")
  final Backdrop? logo;

  @JsonKey(name: "poster")
  final Backdrop? poster;

  @JsonKey(name: "backdrop")
  final Backdrop? backdrop;

  @JsonKey(name: "rating")
  final Rating? rating;

  @JsonKey(name: "votes")
  final Rating? votes;

  @JsonKey(name: "genres")
  final List<Country>? genres;

  @JsonKey(name: "countries")
  final List<Country>? countries;

  @JsonKey(name: "releaseYears")
  final List<ReleaseYear>? releaseYears;

  Doc({
    this.id,
    this.name,
    this.alternativeName,
    this.enName,
    this.type,
    this.year,
    this.description,
    this.shortDescription,
    this.movieLength,
    this.isSeries,
    this.ticketsOnSale,
    this.totalSeriesLength,
    this.seriesLength,
    this.ratingMpaa,
    this.ageRating,
    this.top10,
    this.top250,
    this.typeNumber,
    this.status,
    this.names,
    this.externalId,
    this.logo,
    this.poster,
    this.backdrop,
    this.rating,
    this.votes,
    this.genres,
    this.countries,
    this.releaseYears,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => _$DocFromJson(json);

  Map<String, dynamic> toJson() => _$DocToJson(this);
}

@JsonSerializable()
class Backdrop {
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "previewUrl")
  final String? previewUrl;

  Backdrop({this.url, this.previewUrl});

  Backdrop copyWith({String? url, String? previewUrl}) =>
      Backdrop(url: url ?? this.url, previewUrl: previewUrl ?? this.previewUrl);

  factory Backdrop.fromJson(Map<String, dynamic> json) =>
      _$BackdropFromJson(json);

  Map<String, dynamic> toJson() => _$BackdropToJson(this);
}

@JsonSerializable()
class Country {
  @JsonKey(name: "name")
  final String? name;

  Country({this.name});

  Country copyWith({String? name}) => Country(name: name ?? this.name);

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class ExternalId {
  @JsonKey(name: "imdb")
  final String? imdb;
  @JsonKey(name: "tmdb")
  final int? tmdb;
  @JsonKey(name: "kpHD")
  final String? kpHd;

  ExternalId({this.imdb, this.tmdb, this.kpHd});

  ExternalId copyWith({String? imdb, int? tmdb, String? kpHd}) => ExternalId(
    imdb: imdb ?? this.imdb,
    tmdb: tmdb ?? this.tmdb,
    kpHd: kpHd ?? this.kpHd,
  );

  factory ExternalId.fromJson(Map<String, dynamic> json) =>
      _$ExternalIdFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalIdToJson(this);
}

enum NameEnum {
  @JsonValue("Проклятая школа")
  EMPTY,
  @JsonValue("")
  NAME,
  @JsonValue("Гонщик Формулы-1")
  THE_1,
  @JsonValue("unknown")
  UNKNOWN,
}

@JsonSerializable()
class NameElement {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "language")
  final String? language;
  @JsonKey(name: "type")
  final String? type;

  NameElement({this.name, this.language, this.type});

  NameElement copyWith({String? name, String? language, String? type}) =>
      NameElement(
        name: name ?? this.name,
        language: language ?? this.language,
        type: type ?? this.type,
      );

  factory NameElement.fromJson(Map<String, dynamic> json) =>
      _$NameElementFromJson(json);

  Map<String, dynamic> toJson() => _$NameElementToJson(this);
}

@JsonSerializable()
class Rating {
  @JsonKey(name: "kp")
  final double? kp;
  @JsonKey(name: "imdb")
  final double? imdb;
  @JsonKey(name: "filmCritics")
  final int? filmCritics;
  @JsonKey(name: "russianFilmCritics")
  final int? russianFilmCritics;
  @JsonKey(name: "await")
  final int? ratingAwait;

  Rating({
    this.kp,
    this.imdb,
    this.filmCritics,
    this.russianFilmCritics,
    this.ratingAwait,
  });

  Rating copyWith({
    double? kp,
    double? imdb,
    int? filmCritics,
    int? russianFilmCritics,
    int? ratingAwait,
  }) => Rating(
    kp: kp ?? this.kp,
    imdb: imdb ?? this.imdb,
    filmCritics: filmCritics ?? this.filmCritics,
    russianFilmCritics: russianFilmCritics ?? this.russianFilmCritics,
    ratingAwait: ratingAwait ?? this.ratingAwait,
  );

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}

@JsonSerializable()
class ReleaseYear {
  @JsonKey(name: "start")
  final int? start;
  @JsonKey(name: "end")
  final int? end;

  ReleaseYear({this.start, this.end});

  ReleaseYear copyWith({int? start, int? end}) =>
      ReleaseYear(start: start ?? this.start, end: end ?? this.end);

  factory ReleaseYear.fromJson(Map<String, dynamic> json) =>
      _$ReleaseYearFromJson(json);

  Map<String, dynamic> toJson() => _$ReleaseYearToJson(this);
}

enum Type {
  @JsonValue("anime")
  ANIME,
  @JsonValue("movie")
  MOVIE,
  UNKNOWN, // 👈 добавлен fallback
}
