import 'package:drift/drift.dart';

class SearchDriftModel extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get photo => text()(); // URL посте
  DateTimeColumn get createdAt => dateTime()(); // дата создания постра
}
