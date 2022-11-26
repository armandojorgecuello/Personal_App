import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/core/data_sources/users_app_data_source.dart';
import 'package:user_app/core/dependencies/apis_provider.dart';
import 'package:user_app/core/repositories/users_repository.dart';
import 'package:user_app/core/use_cases/get_user_posts_uses_case.dart';
import 'package:user_app/core/use_cases/get_user_use_case.dart';

final userDataSourceProvider = Provider((ref) => UserDataSource(
  apiUtils: ref.watch(usersProvider),
));

final usersRepositoryProvider = Provider((ref) => UsersRepository(
userDataSource: ref.watch(userDataSourceProvider),
));

final getUsersUseCaseProvider = Provider((ref) => GetUsersUseCase(
  usersRepository: ref.watch(usersRepositoryProvider),
));

final getUserPostsUseCaseProvider = Provider((ref) => GetUserPostsUseCase(
  userPostsRepository: ref.watch(usersRepositoryProvider),
));

