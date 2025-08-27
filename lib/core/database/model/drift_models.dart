import 'package:drift/drift.dart';

// In your Drift table definition
class SearchDriftModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description =>
      text().withDefault(const Constant(''))(); // Non-nullable with default
  TextColumn get photo => text()();
  DateTimeColumn get createdAt => dateTime()();
}
