



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/core/dependencies/users_providers.dart';
import 'package:user_app/core/entities/result_state.dart';
import 'package:user_app/core/entities/user_data.dart';
import 'package:user_app/core/entities/user_post.dart';
import 'package:user_app/core/models/result.dart';
import 'package:user_app/ui/screen/logic/get_user_posts_notifier.dart';
import 'package:user_app/ui/screen/logic/get_users_notifier.dart';

final getUsersNotifierProvider = StateNotifierProvider<GetUsersNotifier,
        ResultState<List<UserData>, BackendError>>(
    (ref) => GetUsersNotifier(
        getUsersUseCase: ref.watch(getUsersUseCaseProvider)));

final selectRouteProvider = StateProvider<Route?>((ref) => null);
final loadingDataFromDbProvider = StateProvider<bool>((ref) => true);

final getUserPostsNotifierProvider = StateNotifierProvider<GetUserPostsNotifier,
        ResultState<List<UserPost>, BackendError>>(
    (ref) => GetUserPostsNotifier(
        getUserPostsUseCase: ref.watch(getUserPostsUseCaseProvider)));