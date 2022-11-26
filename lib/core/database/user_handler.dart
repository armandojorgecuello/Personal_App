part of 'database.dart';

const String bdName = 'usersList' ;

class UserHandler<T> {
  late Box<T> _box;

  Future<void> delete() async {
    _box = await _openBox();
    _box.delete(0);
  }

  Future<List<T>> get() async {
    _box = await _openBox();
    return _box.values.toList();
  }

  Future<bool> set({required T users, required int id }) async {
    _box = await _openBox();
    await _box.put(id, users);
    return true;
  }

  _openBox() async => _box = await Hive.openBox<T>(bdName);
}
