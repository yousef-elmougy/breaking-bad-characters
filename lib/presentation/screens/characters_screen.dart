import 'package:breaking_bad/core/constants/colors.dart';
import 'package:breaking_bad/presentation/cubit/data_cubit/data_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/characters_widgets/all_characters.dart';
import '../../presentation/cubit/data_cubit/data_cubit.dart';
import '../widgets/characters_widgets/custom_icon.dart';
import '../widgets/characters_widgets/search_text_field.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    final dataCubit = DataCubit.get(context);

    return BlocBuilder<DataCubit, DataState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.myYellow,
            title: dataCubit.isSearch
                ? SearchTextField(
                    controller: dataCubit.searchController,
                    onChanged: (value) {
                      dataCubit.searchList =
                          dataCubit.allCharacters.where((element) {
                        return element.name!
                                .toLowerCase()
                                .contains(value.toLowerCase()) &&
                            element.name!
                                .toLowerCase()
                                .startsWith(value.toLowerCase());
                      }).toList();
                      setState(() {});
                    },
                  )
                : const Text(
                    'Characters',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
            centerTitle: true,
            actions: [
              dataCubit.isSearch
                  ? CustomIcon(
                      icon: Icons.close,
                      onPressed: () {
                        if (dataCubit.searchController.text.isEmpty) {
                          Navigator.pop(context);
                        } else {
                          dataCubit.searchController.clear();
                        }
                        // dataCubit.isSearch = false;
                      },
                    )
                  : CustomIcon(
                      icon: Icons.search,
                      onPressed: () {
                        ModalRoute.of(context)!.addLocalHistoryEntry(
                            LocalHistoryEntry(onRemove: () {
                          dataCubit.searchController.clear();
                          dataCubit.isSearch = false;
                        }));
                        dataCubit.isSearch = true;
                      },
                    ),
            ],
          ),
          body: BlocBuilder<DataCubit, DataState>(
            builder: (BuildContext context, state) {
              if (state is CharactersLoaded) {
                dataCubit.allCharacters = state.characters.where((element) {
                  return element.charId != 3 &&
                      element.charId != 6 &&
                      element.charId != 14 &&
                      element.charId != 16 &&
                      element.charId != 23 &&
                      element.charId != 24 &&
                      element.charId != 25 &&
                      element.charId != 26 &&
                      element.charId != 29 &&
                      element.charId != 30 &&
                      element.charId != 36 &&
                      element.charId != 46 &&
                      element.charId != 47 &&
                      element.charId != 52 &&
                      element.charId != 53 &&
                      element.charId != 55 &&
                      element.charId != 112;
                }).toList();
                return AllCharacters(
                    allCharacters: dataCubit.allCharacters,
                    searchList: dataCubit.searchList);
              } else if (state is CharactersLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.myYellow),
                );
              } else if (state is CharactersError) {
                Center(
                  child: Text(state.error.toString()),
                );
              }
              return const SizedBox();
            },
          ),
        );
      },
    );
  }
}


