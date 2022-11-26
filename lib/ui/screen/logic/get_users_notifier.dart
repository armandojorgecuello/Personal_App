import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/core/entities/result_state.dart';
import 'package:user_app/core/entities/user_data.dart';
import 'package:user_app/core/models/result.dart';
import 'package:user_app/core/use_cases/get_user_use_case.dart';

class GetUsersNotifier
    extends StateNotifier<ResultState<List<UserData>, BackendError>> {
  GetUsersNotifier({
    required GetUsersUseCase getUsersUseCase,
  })  : _getUsersUseCase = getUsersUseCase,
        super(ResultState.initial());

  final GetUsersUseCase _getUsersUseCase;

  Future<void> getUsers() async {
    state = ResultState.loading();
    final response = await _getUsersUseCase.call();

    state = response.when(
      fail: (fail) => ResultState.error(fail),
      success: (success) => ResultState.data(success),
    );
  }
}
