import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/core/dependencies/database_provider.dart';
import 'package:user_app/ui/screen/home_screen.dart';
import 'package:user_app/ui/screen/logic/get_users_provider.dart';
import 'package:user_app/ui/screen/splash_screen.dart';

final   initialLoadProvider = FutureProvider((ref) async {
  await ref.watch(databaseProvider).initDB();

  final userDb = await ref.watch(databaseProvider).users().get();
  if (userDb.isEmpty ) {
    ref.read(getUsersNotifierProvider.notifier).getUsers().then((value) async {
      final usersList = ref.read(getUsersNotifierProvider.notifier).state;
      if(usersList.data != null){
        final users = usersList.data;
        for (var user in users!){
          ref.read(databaseProvider).users().set(users: user.toUserDb(), id: user.id!);
        }
        final listUser = await ref.watch(databaseProvider).users().get();
        if (listUser.isNotEmpty){
          ref.read(selectRouteProvider.notifier).update((state) => HomeScreen.goTo());
        }else{
          ref.read(selectRouteProvider.notifier).update((state) => SplashScreen.goTo());
        }
      }
    });
  }else{
    ref.read(selectRouteProvider.notifier).update((state) => HomeScreen.goTo());
  }
});

