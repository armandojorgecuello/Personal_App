
import 'package:flutter/material.dart';
import 'package:user_app/ui/utils/constants/colors.dart';
import 'package:user_app/ui/utils/constants/dimensions.dart';
import 'package:user_app/ui/utils/styles/styles.dart';

class RowItem extends StatelessWidget {

  final String data;
  final IconData icon;

  const RowItem({
    required this.data,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: kPrimaryColor, size: kDimens20,),
        const SizedBox( width: kDimens5,),
        Text(data, style: Styles.p1,)
      ],
    );
  }
}