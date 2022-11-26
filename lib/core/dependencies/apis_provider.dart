import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/core/api/api_utils.dart';
import 'package:user_app/ui/utils/constants/general.dart';

final clientProvider = Provider((ref) => Dio());

final usersProvider = Provider(
  (ref) => ApiUtils(
    client: ref.watch(clientProvider),
    host: kHost,
  ),
);
