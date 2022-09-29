import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    required this.indent,
  }) : super(key: key);

  final double indent;

  @override
  Widget build(BuildContext context) {
    return Divider(
        color: AppColors.myYellow, thickness: 2, height: 20, endIndent: indent);
  }
}
