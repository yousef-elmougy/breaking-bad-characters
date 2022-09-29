import 'package:breaking_bad/data/model/character_model.dart';
import 'package:breaking_bad/data/services/sevices.dart';
import 'package:flutter/material.dart';
import '../services/sevices.dart';

class Repository {
  final Services services;

  Repository({required this.services});
  Future<List<CharacterModel>> getCharacterData()async{
    List character =await services.getCharacterData();
    print(character.map((e) => CharacterModel.fromJson(e)).toList());
    return character.map((e) => CharacterModel.fromJson(e)).toList();
  }
}