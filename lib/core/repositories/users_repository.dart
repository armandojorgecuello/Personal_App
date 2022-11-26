import 'package:user_app/core/data_sources/users_app_data_source.dart';
import 'package:user_app/core/entities/user_data.dart';
import 'package:user_app/core/entities/user_post.dart';
import 'package:user_app/core/models/result.dart';
import 'package:user_app/core/repositories/iuser_repository.dart';

class UsersRepository extends IUserRepository {
  UsersRepository({required UserDataSource userDataSource})
      : _userDataSource = userDataSource;

  final UserDataSource _userDataSource;

  @override
  Future<Result<List<UserData>, BackendError>> getUserList() async {
    final result = await _userDataSource.getUserList();
    return result.when(
      fail: (fail) => Fail(fail), 
      success: (success) =>
          Success(success.map((user) => user.toEntity()).toList()),
    );
  }

  @override
  Future<Result<List<UserPost>, BackendError>> getUserPostList(String userId) async {
    final result = await _userDataSource.getUserPostList(userId);
    return result.when(
      fail: (fail) => Fail(fail), 
      success: (success) =>
          Success(success.map((user) => user.toEntity()).toList()),
    );
  }

}
