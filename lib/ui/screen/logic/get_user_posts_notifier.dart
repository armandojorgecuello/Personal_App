import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/core/entities/result_state.dart';
import 'package:user_app/core/entities/user_post.dart';
import 'package:user_app/core/models/result.dart';
import 'package:user_app/core/use_cases/get_user_posts_uses_case.dart';

class GetUserPostsNotifier
    extends StateNotifier<ResultState<List<UserPost>, BackendError>> {
  GetUserPostsNotifier({
    required GetUserPostsUseCase getUserPostsUseCase,
  })  : _getUserPostsUseCase = getUserPostsUseCase,
        super(ResultState.initial());

  final GetUserPostsUseCase _getUserPostsUseCase;

  Future<void> getUsers(String userId) async {
    state = ResultState.loading();
    final response = await _getUserPostsUseCase.call(userId);

    state = response.when(
      fail: (fail) => ResultState.error(fail),
      success: (success) => ResultState.data(success),
    );
  }
}
