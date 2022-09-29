import 'package:breaking_bad/core/constants/colors.dart';
import 'package:breaking_bad/data/model/character_model.dart';
import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';
import '../widgets/character_detail_widgets/custom_divider.dart';
import '../widgets/character_detail_widgets/custom_rich_text.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({Key? key, required this.characterModel})
      : super(key: key);

  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myGrey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            expandedHeight: 600,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(characterModel.nickName.toString(),
                  style: const TextStyle(color: AppColors.myWhite)),
              background: Hero(
                tag: characterModel.charId!.toInt(),
                child: FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: AppStrings.placeholderImage,
                  image: characterModel.image.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRichText(
                        textOne: 'Job : ',
                        textTwo: characterModel.jobs!.join('/'),
                      ),
                      const CustomDivider(
                        indent: 150,
                      ),
                      CustomRichText(
                        textOne: 'Appeared in : ',
                        textTwo: characterModel.categoryForTwoSeries.toString(),
                      ),
                      const CustomDivider(
                        indent: 200,
                      ),
                      CustomRichText(
                        textOne: 'Seasons : ',
                        textTwo: characterModel.appearanceOfSeasons!.join('/'),
                      ),
                      const CustomDivider(
                        indent: 200,
                      ),
                      CustomRichText(
                        textOne: 'Status : ',
                        textTwo: characterModel.statusIfDeadOrAlive.toString(),
                      ),
                      const CustomDivider(
                        indent: 250,
                      ),
                      CustomRichText(
                        textOne: 'Actor/Actress : ',
                        textTwo: characterModel.acotrName.toString(),
                      ),
                      const CustomDivider(
                        indent: 200,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

