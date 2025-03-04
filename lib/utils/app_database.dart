import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// Import file này sau khi chạy build_runner
part 'app_database.g.dart';

// Định nghĩa bảng "Users"
class Pomodoros extends Table {
  IntColumn get count => integer()();
  DateTimeColumn get createdAt => dateTime()();
}

// Tạo database sử dụng Drift
@DriftDatabase(tables: [Pomodoros])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Thêm một Pomodoro
  Future<int> insertPomodoro(Pomodoro pomodoro) =>
      into(pomodoros).insert(pomodoro);

  // Lấy danh sách Pomodoro
  Future<List<Pomodoro>> getAllPomodoros() => select(pomodoros).get();

  // Xóa một Pomodoro theo ID
  // Future<int> deletePomodoro(String id) =>
  //     (delete(pomodoros)..where((u) => u.id.equals(id))).go();
}

// Hàm mở database
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));
    return NativeDatabase(file);
  });
}
