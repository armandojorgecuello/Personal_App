
import 'package:user_app/core/entities/user_data.dart';
import 'package:user_app/core/entities/user_post.dart';
import 'package:user_app/core/models/result.dart';

abstract class IUserRepository {

  Future<Result<List<UserData>, BackendError>> getUserList();
  Future<Result<List<UserPost>, BackendError>> getUserPostList(String userId);

}
