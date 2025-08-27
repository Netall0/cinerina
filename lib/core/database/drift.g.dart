// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift.dart';

// ignore_for_file: type=lint
class $SearchDriftModelTable extends SearchDriftModel
    with TableInfo<$SearchDriftModelTable, SearchDriftModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchDriftModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<String> photo = GeneratedColumn<String>(
    'photo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    photo,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_drift_model';
  @override
  VerificationContext validateIntegrity(
    Insertable<SearchDriftModelData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('photo')) {
      context.handle(
        _photoMeta,
        photo.isAcceptableOrUnknown(data['photo']!, _photoMeta),
      );
    } else if (isInserting) {
      context.missing(_photoMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SearchDriftModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchDriftModelData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      photo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SearchDriftModelTable createAlias(String alias) {
    return $SearchDriftModelTable(attachedDatabase, alias);
  }
}

class SearchDriftModelData extends DataClass
    implements Insertable<SearchDriftModelData> {
  final int id;
  final String title;
  final String description;
  final String photo;
  final DateTime createdAt;
  const SearchDriftModelData({
    required this.id,
    required this.title,
    required this.description,
    required this.photo,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['photo'] = Variable<String>(photo);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SearchDriftModelCompanion toCompanion(bool nullToAbsent) {
    return SearchDriftModelCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      photo: Value(photo),
      createdAt: Value(createdAt),
    );
  }

  factory SearchDriftModelData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchDriftModelData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      photo: serializer.fromJson<String>(json['photo']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'photo': serializer.toJson<String>(photo),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SearchDriftModelData copyWith({
    int? id,
    String? title,
    String? description,
    String? photo,
    DateTime? createdAt,
  }) => SearchDriftModelData(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    photo: photo ?? this.photo,
    createdAt: createdAt ?? this.createdAt,
  );
  SearchDriftModelData copyWithCompanion(SearchDriftModelCompanion data) {
    return SearchDriftModelData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      photo: data.photo.present ? data.photo.value : this.photo,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchDriftModelData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('photo: $photo, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, photo, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchDriftModelData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.photo == this.photo &&
          other.createdAt == this.createdAt);
}

class SearchDriftModelCompanion extends UpdateCompanion<SearchDriftModelData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> photo;
  final Value<DateTime> createdAt;
  const SearchDriftModelCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.photo = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SearchDriftModelCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required String photo,
    required DateTime createdAt,
  }) : title = Value(title),
       photo = Value(photo),
       createdAt = Value(createdAt);
  static Insertable<SearchDriftModelData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? photo,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (photo != null) 'photo': photo,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SearchDriftModelCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<String>? photo,
    Value<DateTime>? createdAt,
  }) {
    return SearchDriftModelCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      photo: photo ?? this.photo,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (photo.present) {
      map['photo'] = Variable<String>(photo.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchDriftModelCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('photo: $photo, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SearchDriftModelTable searchDriftModel = $SearchDriftModelTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [searchDriftModel];
}

typedef $$SearchDriftModelTableCreateCompanionBuilder =
    SearchDriftModelCompanion Function({
      Value<int> id,
      required String title,
      Value<String> description,
      required String photo,
      required DateTime createdAt,
    });
typedef $$SearchDriftModelTableUpdateCompanionBuilder =
    SearchDriftModelCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<String> photo,
      Value<DateTime> createdAt,
    });

class $$SearchDriftModelTableFilterComposer
    extends Composer<_$AppDatabase, $SearchDriftModelTable> {
  $$SearchDriftModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photo => $composableBuilder(
    column: $table.photo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SearchDriftModelTableOrderingComposer
    extends Composer<_$AppDatabase, $SearchDriftModelTable> {
  $$SearchDriftModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photo => $composableBuilder(
    column: $table.photo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SearchDriftModelTableAnnotationComposer
    extends Composer<_$AppDatabase, $SearchDriftModelTable> {
  $$SearchDriftModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get photo =>
      $composableBuilder(column: $table.photo, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SearchDriftModelTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SearchDriftModelTable,
          SearchDriftModelData,
          $$SearchDriftModelTableFilterComposer,
          $$SearchDriftModelTableOrderingComposer,
          $$SearchDriftModelTableAnnotationComposer,
          $$SearchDriftModelTableCreateCompanionBuilder,
          $$SearchDriftModelTableUpdateCompanionBuilder,
          (
            SearchDriftModelData,
            BaseReferences<
              _$AppDatabase,
              $SearchDriftModelTable,
              SearchDriftModelData
            >,
          ),
          SearchDriftModelData,
          PrefetchHooks Function()
        > {
  $$SearchDriftModelTableTableManager(
    _$AppDatabase db,
    $SearchDriftModelTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchDriftModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchDriftModelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchDriftModelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> photo = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SearchDriftModelCompanion(
                id: id,
                title: title,
                description: description,
                photo: photo,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String> description = const Value.absent(),
                required String photo,
                required DateTime createdAt,
              }) => SearchDriftModelCompanion.insert(
                id: id,
                title: title,
                description: description,
                photo: photo,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SearchDriftModelTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SearchDriftModelTable,
      SearchDriftModelData,
      $$SearchDriftModelTableFilterComposer,
      $$SearchDriftModelTableOrderingComposer,
      $$SearchDriftModelTableAnnotationComposer,
      $$SearchDriftModelTableCreateCompanionBuilder,
      $$SearchDriftModelTableUpdateCompanionBuilder,
      (
        SearchDriftModelData,
        BaseReferences<
          _$AppDatabase,
          $SearchDriftModelTable,
          SearchDriftModelData
        >,
      ),
      SearchDriftModelData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SearchDriftModelTableTableManager get searchDriftModel =>
      $$SearchDriftModelTableTableManager(_db, _db.searchDriftModel);
}
