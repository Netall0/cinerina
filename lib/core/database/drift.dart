import 'package:cinerina/core/database/model/drift_models.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'drift.g.dart';

@DriftDatabase(tables: [SearchDriftModel])
class AppDatabase extends _$AppDatabase {
  AppDatabase({required String name})
    : super(
        driftDatabase(
          name: name,
          native: const DriftNativeOptions(shareAcrossIsolates: true),
          web: DriftWebOptions(
            sqlite3Wasm: Uri.parse('sqlite3.wasm'),
            driftWorker: Uri.parse('drift_worker.js'),
          ),
        ),
      );

  Future<List<SearchDriftModelData>> searchMovies(String query) async {
    if (query.isEmpty) return getAllMovies();
    
    return (select(
      searchDriftModel,
    )..where((m) => m.title.contains(query))).get();
  }

  Future<List<SearchDriftModelData>> getAllMovies() async {
    return (select(
      searchDriftModel,
    )..orderBy([(m) => OrderingTerm.desc(m.createdAt)])).get();
  }

  @override
  int get schemaVersion => 1;
}

