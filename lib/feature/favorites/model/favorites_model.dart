import 'package:cinerina/core/database/drift.dart';
import 'package:cinerina/feature/search/model/search_model.dart';
import 'package:drift/drift.dart';

final class FavoritesModel {
  final String heroTag;
  final String name;
  final String imageUrl;
  final String description;
  final Doc? movie;
  final bool isFavorite;

  const FavoritesModel({
    required this.heroTag,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.movie,
    this.isFavorite = false,
  });

  factory FavoritesModel.fromDoc(Doc doc) {
    return FavoritesModel(
      heroTag: "${doc.id ?? DateTime.now().millisecondsSinceEpoch}",
      name: doc.name ?? doc.alternativeName ?? "Без названия",
      imageUrl: doc.poster?.url ?? "",
      description: doc.description ?? doc.shortDescription ?? "Нет описания",
      movie: doc,
      isFavorite: true,
    );
  }
  SearchDriftModelCompanion toDriftCompanion() {
    return SearchDriftModelCompanion.insert(
      title: name,
      description: Value(description),
      photo: imageUrl,
      createdAt: DateTime.now(),
    );
  }
}

extension DriftRowMapper on SearchDriftModelData {
  FavoritesModel toFavorite({Doc? movie}) {
    return FavoritesModel(
      heroTag: id.toString(),
      name: title,
      imageUrl: photo,
      description: description,
      movie: movie, // можно подтягивать Doc из API или кеша
      isFavorite: true,
    );
  }
}
