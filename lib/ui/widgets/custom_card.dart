
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/core/database/models/user_db.dart';
import 'package:user_app/generated/l10n.dart';
import 'package:user_app/ui/screen/user_posts_screen.dart';
import 'package:user_app/ui/utils/constants/constants.dart';
import 'package:user_app/ui/utils/responsive.dart';
import 'package:user_app/ui/utils/styles/styles.dart';
import 'package:user_app/ui/widgets/custom_row_item.dart';

class CustomUserCard extends ConsumerWidget {
  final UserDb userDB; 
  final bool isVisible;
  const CustomUserCard({
    required this.userDB,
    required this.isVisible,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: Responsive.of(context).hp( isVisible ? kDimens20 : kDimens15 ),
        child: Card(
          elevation: kDimens5,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: kDimens15, left: kDimens15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userDB.name!,style: Styles.h1, ),
                    const SizedBox(height: kDimens5,),
                    RowItem(  data: userDB.phone!, icon: Icons.phone,  ),
                    const SizedBox(height: kDimens5,),
                    RowItem(  data: userDB.email!, icon: Icons.email,  ),
                    const SizedBox(height: kDimens5,),
                  ],
                ),
              ),
              isVisible ? Positioned(
                bottom: kDimens5,
                right: kDimens5,
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, UserPostsScreen.goTo(user: userDB));
                  }, 
                  child:  Text( I18n.of(context).sViewPublications ),
                ),
              ) : const SizedBox()
            ],
          )
        ),
      ),
    );
  }
}