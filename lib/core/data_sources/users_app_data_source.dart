import 'package:dio/dio.dart';
import 'package:user_app/core/api/api_utils.dart';
import 'package:user_app/core/models/result.dart';
import 'package:user_app/core/models/user_post_model.dart';
import 'package:user_app/core/models/users_model.dart';

class UserDataSource {
  UserDataSource({
    required ApiUtils apiUtils,
  }) : _apiUtils = apiUtils;

  final ApiUtils _apiUtils;

  Future<Result<List<UserDataModel>, BackendError>> getUserList() async {
    Result<dynamic, BackendError> result;

    const String path = "/users";

    result = await _apiUtils.makeRequest(method: Method.get, path: path);

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success((success as List)
          .map((json) => UserDataModel.fromJson(json))
          .toList()),
    );
  }

  Future<Result<List<UserPostModel>, BackendError>> getUserPostList(String userId) async {
    Result<dynamic, BackendError> result;

    String path = "/posts";

    result = await _apiUtils.makeRequest(method: Method.get, path: path, queryParameters: {'userId': userId});

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success((success as List)
          .map((json) => UserPostModel.fromJson(json))
          .toList()),
    );
  }

}
