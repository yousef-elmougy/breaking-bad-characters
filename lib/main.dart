import 'package:breaking_bad/core/routes/route.dart';
import 'package:breaking_bad/presentation/cubit/data_cubit/data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repository/repository.dart';
import 'data/services/sevices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => DataCubit( repository:  Repository( services: Services(),),)..getCharacterData(),
      child:  const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
