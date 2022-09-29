import '../../../data/model/character_model.dart';

class DataState{}

class DataInitialState extends DataState{}

class CharactersLoaded extends DataState{
  final List<CharacterModel> characters;

  CharactersLoaded(this.characters);
}
class CharactersLoading extends DataState{}
class CharactersError extends DataState{
  final String error;

  CharactersError(this.error);

}

class ChangeSearch extends DataState{}