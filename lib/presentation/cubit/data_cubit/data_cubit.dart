import 'package:breaking_bad/data/repository/repository.dart';
import 'package:breaking_bad/presentation/cubit/data_cubit/data_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/character_model.dart';


class DataCubit extends Cubit<DataState> {
  DataCubit({required this.repository}) : super(DataInitialState());
 final Repository repository ;
  static DataCubit get(context) => BlocProvider.of<DataCubit>(context);

  void getCharacterData()   {
    emit(CharactersLoading());
    repository.getCharacterData().then((character) {
       emit(CharactersLoaded(character));
    }).catchError((error) {
      emit(CharactersError(error.toString()));
    });
  }

  TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  List<CharacterModel> allCharacters = [] ;
  List<CharacterModel> searchList = [] ;

  @override
  Future<void> close() {
    searchController;
    return super.close();
  }


}
