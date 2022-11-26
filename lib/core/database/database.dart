import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_app/core/database/models/user_db.dart';

part 'user_handler.dart';

class Database {
  Future initDB() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserDbAdapter());
  }

  close() => Hive.close();

  UserHandler<UserDb> users() => UserHandler<UserDb>();
}