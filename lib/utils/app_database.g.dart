// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PomodorosTable extends Pomodoros
    with TableInfo<$PomodorosTable, Pomodoro> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PomodorosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  List<GeneratedColumn> get $columns => [count, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pomodoros';
  @override
  VerificationContext validateIntegrity(
    Insertable<Pomodoro> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    } else if (isInserting) {
      context.missing(_countMeta);
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
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Pomodoro map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pomodoro(
      count:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}count'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $PomodorosTable createAlias(String alias) {
    return $PomodorosTable(attachedDatabase, alias);
  }
}

class Pomodoro extends DataClass implements Insertable<Pomodoro> {
  final int count;
  final DateTime createdAt;
  const Pomodoro({required this.count, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['count'] = Variable<int>(count);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PomodorosCompanion toCompanion(bool nullToAbsent) {
    return PomodorosCompanion(count: Value(count), createdAt: Value(createdAt));
  }

  factory Pomodoro.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pomodoro(
      count: serializer.fromJson<int>(json['count']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'count': serializer.toJson<int>(count),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Pomodoro copyWith({int? count, DateTime? createdAt}) => Pomodoro(
    count: count ?? this.count,
    createdAt: createdAt ?? this.createdAt,
  );
  Pomodoro copyWithCompanion(PomodorosCompanion data) {
    return Pomodoro(
      count: data.count.present ? data.count.value : this.count,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pomodoro(')
          ..write('count: $count, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(count, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pomodoro &&
          other.count == this.count &&
          other.createdAt == this.createdAt);
}

class PomodorosCompanion extends UpdateCompanion<Pomodoro> {
  final Value<int> count;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const PomodorosCompanion({
    this.count = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PomodorosCompanion.insert({
    required int count,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : count = Value(count),
       createdAt = Value(createdAt);
  static Insertable<Pomodoro> custom({
    Expression<int>? count,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (count != null) 'count': count,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PomodorosCompanion copyWith({
    Value<int>? count,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return PomodorosCompanion(
      count: count ?? this.count,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PomodorosCompanion(')
          ..write('count: $count, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PomodorosTable pomodoros = $PomodorosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pomodoros];
}

typedef $$PomodorosTableCreateCompanionBuilder =
    PomodorosCompanion Function({
      required int count,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$PomodorosTableUpdateCompanionBuilder =
    PomodorosCompanion Function({
      Value<int> count,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$PomodorosTableFilterComposer
    extends Composer<_$AppDatabase, $PomodorosTable> {
  $$PomodorosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PomodorosTableOrderingComposer
    extends Composer<_$AppDatabase, $PomodorosTable> {
  $$PomodorosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PomodorosTableAnnotationComposer
    extends Composer<_$AppDatabase, $PomodorosTable> {
  $$PomodorosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PomodorosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PomodorosTable,
          Pomodoro,
          $$PomodorosTableFilterComposer,
          $$PomodorosTableOrderingComposer,
          $$PomodorosTableAnnotationComposer,
          $$PomodorosTableCreateCompanionBuilder,
          $$PomodorosTableUpdateCompanionBuilder,
          (Pomodoro, BaseReferences<_$AppDatabase, $PomodorosTable, Pomodoro>),
          Pomodoro,
          PrefetchHooks Function()
        > {
  $$PomodorosTableTableManager(_$AppDatabase db, $PomodorosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PomodorosTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PomodorosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PomodorosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> count = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PomodorosCompanion(
                count: count,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int count,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => PomodorosCompanion.insert(
                count: count,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PomodorosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PomodorosTable,
      Pomodoro,
      $$PomodorosTableFilterComposer,
      $$PomodorosTableOrderingComposer,
      $$PomodorosTableAnnotationComposer,
      $$PomodorosTableCreateCompanionBuilder,
      $$PomodorosTableUpdateCompanionBuilder,
      (Pomodoro, BaseReferences<_$AppDatabase, $PomodorosTable, Pomodoro>),
      Pomodoro,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PomodorosTableTableManager get pomodoros =>
      $$PomodorosTableTableManager(_db, _db.pomodoros);
}
