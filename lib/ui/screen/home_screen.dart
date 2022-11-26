import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/core/database/models/user_db.dart';
import 'package:user_app/core/dependencies/database_provider.dart';
import 'package:user_app/generated/l10n.dart';
import 'package:user_app/ui/screen/logic/get_users_provider.dart';
import 'package:user_app/ui/utils/constants/constants.dart';
import 'package:user_app/ui/utils/styles/styles.dart';
import 'package:user_app/ui/widgets/custom_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  
  const HomeScreen({  super.key});

  static Route goTo() => MaterialPageRoute(
    builder: (_) =>  HomeScreen(  ),
    settings: const RouteSettings(name: kRouteLoginScreen),
  );

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState(); 
}
  
class _HomeScreenState extends ConsumerState<HomeScreen>{

  late TextEditingController _searchController; 
  List<UserDb> initialUsersList = [];
  List<UserDb> user = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      getusersFromDb();
    });
    _searchController = TextEditingController();

  }

  getusersFromDb()async{
    initialUsersList = await ref.watch(databaseProvider).users().get();
    if (initialUsersList.isNotEmpty) {
      ref.read(loadingDataFromDbProvider.notifier).update((state) => false);
      user.clear();
      user.addAll(initialUsersList);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void filterSearchResults({required String query } ){
    List<UserDb> dummySearchList = [];
    dummySearchList.addAll(initialUsersList);
    if(query.isNotEmpty && query != "" ){
      user.clear();
      user = dummySearchList.where((user) => user.name!.toLowerCase().contains(query.toLowerCase())).toList();
      setState(() {});
      return;
    }else{
        user.clear();
        user.addAll(initialUsersList);
        setState(() {});
    }
  }

  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      appBar: AppBar(
        title: Text(I18n.of(context).sAppBarTitle, style: Styles.appBarTitleStyle,),
        centerTitle: false,
      ),
      body: SafeArea(
        child: ref.watch(loadingDataFromDbProvider) 
        ? Platform.isAndroid ? const CircularProgressIndicator() : const CupertinoActivityIndicator() 
        :CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: kDimens20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDimens10),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      filterSearchResults(query: value);
                    },
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: kDimens5),
                      focusColor: kPrimaryColor,
                      label: Text(I18n.of(context).sSearchUser)
                    ),
                  ),
                )
              ])
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                user.map(( user ) =>  CustomUserCard( userDB: user, isVisible: true, )).toList()
              )
            )  
          ],
        ),
      ),
    );
  }
  
  
}

