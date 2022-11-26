import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/core/database/models/user_db.dart';
import 'package:user_app/core/entities/user_post.dart';
import 'package:user_app/generated/l10n.dart';
import 'package:user_app/ui/screen/logic/get_users_provider.dart';
import 'package:user_app/ui/utils/constants/constants.dart';
import 'package:user_app/ui/utils/styles/styles.dart';
import 'package:user_app/ui/widgets/custom_card.dart';

class UserPostsScreen extends ConsumerStatefulWidget {
  final UserDb user;
  const UserPostsScreen({ required this.user, super.key});

  static Route goTo({ required UserDb user }) => MaterialPageRoute(
    builder: (_) =>  UserPostsScreen( user: user, ),
    settings: const RouteSettings(name: kRouteUserPostsScreen),
  );

  @override
  ConsumerState<UserPostsScreen> createState() => _UserPostsScreenState();
}

class _UserPostsScreenState extends ConsumerState<UserPostsScreen> {

  List<UserPost> userPostsList = [];
  bool isLoadingData = true;

  @override
  void initState() {
    super.initState();
    ref.read(getUserPostsNotifierProvider.notifier).getUsers(widget.user.userId.toString()).then((value) {
      final posts = ref.read(getUserPostsNotifierProvider.notifier).state.data;
      if (posts != null) {
        userPostsList.addAll(posts);
      }
      setState(() {
        isLoadingData = false;
      });
    });
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(I18n.of(context).sUserPosts, style: Styles.appBarTitleStyle,),
      ),
      body:  CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              CustomUserCard(userDB: widget.user, isVisible: false), 
            ])
          ),
          isLoadingData 
          ? SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(child: Platform.isAndroid ? const CircularProgressIndicator() : const CupertinoActivityIndicator(),)
              ]
            )
          ) 
          : SliverList(
            delegate: SliverChildListDelegate(
              userPostsList.map((post) => Post( post: post, )).toList()
            )
          )
        ],
      ),
    );
  }
}

class Post extends StatelessWidget {
  final UserPost post;
  const Post({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDimens10),
      child: Card(
        elevation: kDimens3,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.title!.toUpperCase(), style: Styles.h1,),
              const SizedBox( height: kDimens10,),
              Text(post.body!, style: Styles.p1,)
            ],
          ),
        ),
      ),
    );
  }
}