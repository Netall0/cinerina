import 'package:cinerina/core/database/drift.dart';
import 'package:drift/drift.dart';

class SearchModel {
  final int id;
  final String title;
  final String description;
  final String photo;
  final DateTime createdAt;

  const SearchModel({
    required this.id,
    required this.title,
    required this.description,
    required this.photo,
    required this.createdAt,
  });

  SearchModel copyWith({
    int? id,
    String? title,
    String? description,
    String? photo,
    DateTime? createdAt,
  }) {
    return SearchModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      photo: photo ?? this.photo,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'SearchModel(id: $id, title: $title, description: $description, photo: $photo, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchModel &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.photo == photo &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        photo.hashCode ^
        createdAt.hashCode;
  }


  
}
extension SearchDriftMapper on SearchDriftModelData {
  SearchModel toDomain() {
    return SearchModel(
      id: id,
      title: title,
      description: description ?? '',
      photo: photo,
      createdAt: createdAt,
    );
  }
}

extension SearchModelMapper on SearchModel {
  SearchDriftModelCompanion toCompanion() {
    return SearchDriftModelCompanion.insert(
      id: Value(id),
      title: title,
      description: Value(description),
      photo: photo,
      createdAt: createdAt,
    );
  }
}
