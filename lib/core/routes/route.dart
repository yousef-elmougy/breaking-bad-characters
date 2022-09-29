import 'package:breaking_bad/core/constants/strings.dart';
import 'package:breaking_bad/data/model/character_model.dart';
import 'package:breaking_bad/presentation/screens/characters_screen.dart';
import 'package:breaking_bad/presentation/screens/charcter_details_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.characterScreen:
        return MaterialPageRoute(builder: (_) => const CharacterScreen());
      case AppStrings.characterDetailsScreen:
        final character = settings.arguments as CharacterModel;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(characterModel: character));

      default:
        return defaultRoute();
    }
  }

  static MaterialPageRoute<dynamic> defaultRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'ERROR : Route Not Found',
          ),
        ),
        body: const Center(
          child: Text(
            'ERROR : Route Not Found',
          ),
        ),
      ),
    );
  }
}
