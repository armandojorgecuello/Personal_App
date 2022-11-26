import 'package:user_app/core/entities/user_data.dart';
import 'package:user_app/core/models/result.dart';
import 'package:user_app/core/repositories/users_repository.dart';

class GetUsersUseCase {
  GetUsersUseCase({
    required UsersRepository usersRepository,
  }) : _usersRepository = usersRepository;

  final UsersRepository _usersRepository;

  Future<Result<List<UserData>, BackendError>> call() =>
      _usersRepository.getUserList();
}
