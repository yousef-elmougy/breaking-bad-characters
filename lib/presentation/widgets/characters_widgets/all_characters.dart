import 'package:breaking_bad/presentation/cubit/data_cubit/data_cubit.dart';
import 'package:flutter/material.dart';
import '../../../data/model/character_model.dart';
import 'character_item.dart';

class AllCharacters extends StatelessWidget {
  const AllCharacters({Key? key, required this.allCharacters, required this.searchList}) : super(key: key);

  final List<CharacterModel> allCharacters;
  final List<CharacterModel> searchList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 250,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemCount:DataCubit.get(context).searchController.text.isEmpty?allCharacters.length: searchList.length,
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, index) {
        return CharacterItem(characterModel:DataCubit.get(context).searchController.text.isEmpty?allCharacters[index]: searchList[index],);
      },
    );
  }
}
