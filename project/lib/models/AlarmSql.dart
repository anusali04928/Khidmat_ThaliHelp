import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AlarmClass {
  int id;
  String title;
  String time;
  String days;
  String note;

  AlarmClass(this.id, this.title, this.time, this.days, this.note);

  AlarmClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    time = json['timeOfday'];
    days = json['days'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['timeOfday'] = this.time;
    data['days'] = this.days;
    data['note'] = this.note;
    return data;
  }

  @override
  String toString() {
    return 'AlarmClass{id: $id, title: $title,time:$time, days:$days note: $note}';
  }

  DateTime timeOfDay() {
    DateTime time =
        new DateFormat('Hm', 'en_US').parse(this.time.substring(10, 15));
    return time;
  }

  List<int> DaysofWeek() {
    List<int> DaysofWeek = [];
    for (var i = 0; i < 7; i++) {
      if (this.days[i] == '1') {
        if (i == 0) {
          DaysofWeek.add(7);
          continue;
        } else {
          DaysofWeek.add(i);
        }
      }
    }
    return DaysofWeek;
  }
}

class DBHelper {
  static Database _database;
  static DBHelper _dbHelper;

  DBHelper._createInstance() {
    _dbHelper = this;
  }

  factory DBHelper() => _dbHelper ?? DBHelper._createInstance();

  Future<Database> get database async {
    if (_database != null) {
      print(_database);
      return DBHelper._database;
    }
    _database = await initializeDatabase();
    //  print(_database);
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = join(dir, "alarms_Thalime.db");
    await deleteDatabase(path);
    return await openDatabase(path, version: 2,
        onCreate: (db, int version) async {
      await db.execute("""CREATE TABLE alarms(
	id INTEGER PRIMARY Key AUTOINCREMENT,
	title TEXT not NULL,
	timeOfday time not NULL,
	days VARCHAR(7) not NULL,
	note TEXT not NULL
);""");
    });
  }

  Future insertAlarm(AlarmClass con) async {
    var db = await database;
    await db.insert('alarms', con.toJson());
    // print('result = $result');
  }

  Future<List<AlarmClass>> alarm() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('alarms');
    //print(maps);
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return AlarmClass(maps[i]['id'], maps[i]['title'], maps[i]['timeOfday'],
          maps[i]['days'], maps[i]['note']);
    });
  }

  Future<void> deleteAlarm(int id) async {
    // Get a reference to the database.
    final db = await database;
    await db.delete(
      'alarms',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateAlarm(AlarmClass alarm) async {
    // Get a reference to the database.
    final db = await database;
    await db.update(
      'alarms',
      alarm.toJson(),
      where: 'id = ?',
      whereArgs: [alarm.id],
    );
  }
}
