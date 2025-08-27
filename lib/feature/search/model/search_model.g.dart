// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
  docs: (json['docs'] as List<dynamic>?)
      ?.map((e) => Doc.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
  pages: (json['pages'] as num?)?.toInt(),
);

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'docs': instance.docs,
      'total': instance.total,
      'limit': instance.limit,
      'page': instance.page,
      'pages': instance.pages,
    };

Doc _$DocFromJson(Map<String, dynamic> json) => Doc(
  id: (json['id'] as num?)?.toInt(),
  name: $enumDecodeNullable(_$NameEnumEnumMap, json['name']),
  alternativeName: json['alternativeName'] as String?,
  enName: json['enName'] as String?,
  type: $enumDecodeNullable(_$TypeEnumMap, json['type']),
  year: (json['year'] as num?)?.toInt(),
  description: json['description'] as String?,
  shortDescription: json['shortDescription'] as String?,
  movieLength: (json['movieLength'] as num?)?.toInt(),
  isSeries: json['isSeries'] as bool?,
  ticketsOnSale: json['ticketsOnSale'] as bool?,
  totalSeriesLength: json['totalSeriesLength'],
  seriesLength: (json['seriesLength'] as num?)?.toInt(),
  ratingMpaa: json['ratingMpaa'] as String?,
  ageRating: (json['ageRating'] as num?)?.toInt(),
  top10: json['top10'],
  top250: json['top250'],
  typeNumber: (json['typeNumber'] as num?)?.toInt(),
  status: json['status'] as String?,
  names: (json['names'] as List<dynamic>?)
      ?.map((e) => NameElement.fromJson(e as Map<String, dynamic>))
      .toList(),
  externalId: json['externalId'] == null
      ? null
      : ExternalId.fromJson(json['externalId'] as Map<String, dynamic>),
  logo: json['logo'] == null
      ? null
      : Backdrop.fromJson(json['logo'] as Map<String, dynamic>),
  poster: json['poster'] == null
      ? null
      : Backdrop.fromJson(json['poster'] as Map<String, dynamic>),
  backdrop: json['backdrop'] == null
      ? null
      : Backdrop.fromJson(json['backdrop'] as Map<String, dynamic>),
  rating: json['rating'] == null
      ? null
      : Rating.fromJson(json['rating'] as Map<String, dynamic>),
  votes: json['votes'] == null
      ? null
      : Rating.fromJson(json['votes'] as Map<String, dynamic>),
  genres: (json['genres'] as List<dynamic>?)
      ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
      .toList(),
  countries: (json['countries'] as List<dynamic>?)
      ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
      .toList(),
  releaseYears: (json['releaseYears'] as List<dynamic>?)
      ?.map((e) => ReleaseYear.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DocToJson(Doc instance) => <String, dynamic>{
  'id': instance.id,
  'name': _$NameEnumEnumMap[instance.name],
  'alternativeName': instance.alternativeName,
  'enName': instance.enName,
  'type': _$TypeEnumMap[instance.type],
  'year': instance.year,
  'description': instance.description,
  'shortDescription': instance.shortDescription,
  'movieLength': instance.movieLength,
  'isSeries': instance.isSeries,
  'ticketsOnSale': instance.ticketsOnSale,
  'totalSeriesLength': instance.totalSeriesLength,
  'seriesLength': instance.seriesLength,
  'ratingMpaa': instance.ratingMpaa,
  'ageRating': instance.ageRating,
  'top10': instance.top10,
  'top250': instance.top250,
  'typeNumber': instance.typeNumber,
  'status': instance.status,
  'names': instance.names,
  'externalId': instance.externalId,
  'logo': instance.logo,
  'poster': instance.poster,
  'backdrop': instance.backdrop,
  'rating': instance.rating,
  'votes': instance.votes,
  'genres': instance.genres,
  'countries': instance.countries,
  'releaseYears': instance.releaseYears,
};

const _$NameEnumEnumMap = {
  NameEnum.EMPTY: 'Проклятая школа',
  NameEnum.NAME: '',
  NameEnum.THE_1: 'Гонщик Формулы-1',
};

const _$TypeEnumMap = {Type.ANIME: 'anime', Type.MOVIE: 'movie'};

Backdrop _$BackdropFromJson(Map<String, dynamic> json) => Backdrop(
  url: json['url'] as String?,
  previewUrl: json['previewUrl'] as String?,
);

Map<String, dynamic> _$BackdropToJson(Backdrop instance) => <String, dynamic>{
  'url': instance.url,
  'previewUrl': instance.previewUrl,
};

Country _$CountryFromJson(Map<String, dynamic> json) =>
    Country(name: json['name'] as String?);

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
  'name': instance.name,
};

ExternalId _$ExternalIdFromJson(Map<String, dynamic> json) => ExternalId(
  imdb: json['imdb'] as String?,
  tmdb: (json['tmdb'] as num?)?.toInt(),
  kpHd: json['kpHD'] as String?,
);

Map<String, dynamic> _$ExternalIdToJson(ExternalId instance) =>
    <String, dynamic>{
      'imdb': instance.imdb,
      'tmdb': instance.tmdb,
      'kpHD': instance.kpHd,
    };

NameElement _$NameElementFromJson(Map<String, dynamic> json) => NameElement(
  name: json['name'] as String?,
  language: json['language'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$NameElementToJson(NameElement instance) =>
    <String, dynamic>{
      'name': instance.name,
      'language': instance.language,
      'type': instance.type,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
  kp: (json['kp'] as num?)?.toDouble(),
  imdb: (json['imdb'] as num?)?.toDouble(),
  filmCritics: (json['filmCritics'] as num?)?.toInt(),
  russianFilmCritics: (json['russianFilmCritics'] as num?)?.toInt(),
  ratingAwait: (json['await'] as num?)?.toInt(),
);

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
  'kp': instance.kp,
  'imdb': instance.imdb,
  'filmCritics': instance.filmCritics,
  'russianFilmCritics': instance.russianFilmCritics,
  'await': instance.ratingAwait,
};

ReleaseYear _$ReleaseYearFromJson(Map<String, dynamic> json) => ReleaseYear(
  start: (json['start'] as num?)?.toInt(),
  end: (json['end'] as num?)?.toInt(),
);

Map<String, dynamic> _$ReleaseYearToJson(ReleaseYear instance) =>
    <String, dynamic>{'start': instance.start, 'end': instance.end};
