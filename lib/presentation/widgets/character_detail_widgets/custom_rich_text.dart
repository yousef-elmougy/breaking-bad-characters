import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    Key? key,
    required this.textOne,
    required this.textTwo,
  }) : super(key: key);

  final String textOne;
  final String textTwo;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: textOne,
            style: const TextStyle(
              color: AppColors.myWhite,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: textTwo,
            style: const TextStyle(
              color: AppColors.myWhite,
              fontSize:18,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
