import 'package:flutter/material.dart';

import '../../../core/constants/strings.dart';
import '../../../data/model/character_model.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({Key? key, required this.characterModel})
      : super(key: key);

  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppStrings.characterDetailsScreen,
            arguments: characterModel);
      },
      child: GridTile(
        footer: Container(
          height: 50,
          color: Colors.black.withOpacity(.5),
          alignment: Alignment.center,
          child: Text(
            characterModel.name.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        child: FadeInImage.assetNetwork(
          placeholder: AppStrings.placeholderImage,
          fit: BoxFit.cover,
          image: characterModel.image.toString(),
        ),
      ),
    );
  }
}
