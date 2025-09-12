import 'package:drift/drift.dart';

class SearchDriftModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description =>
      text().withDefault(const Constant(''))(); 
  TextColumn get photo => text()();
  DateTimeColumn get createdAt => dateTime()();
}
