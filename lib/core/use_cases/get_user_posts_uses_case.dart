
import 'package:user_app/core/entities/user_post.dart';
import 'package:user_app/core/models/result.dart';
import 'package:user_app/core/repositories/users_repository.dart';

class GetUserPostsUseCase {
  GetUserPostsUseCase({
    required UsersRepository userPostsRepository,
  }) : _usersRepository = userPostsRepository;

  final UsersRepository _usersRepository;

  Future<Result<List<UserPost>, BackendError>> call(String userId) =>
      _usersRepository.getUserPostList(userId);
}
