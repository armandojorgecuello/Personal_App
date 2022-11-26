import 'package:hive_flutter/hive_flutter.dart';

part 'user_db.g.dart';

@HiveType(typeId: 0)
class UserDb extends HiveObject {
  @HiveField(0)
  int? userId;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? userName;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? phone;
  @HiveField(5)
  String? website;
  @HiveField(3)

  UserDb({ this.userId, this.name, this.userName, this.email, this.phone, this.website });

  
}
