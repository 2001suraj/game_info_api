import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:load_api/business_logic/blocs/game_data_bloc/game_data_bloc.dart';
import 'package:load_api/data/repositories/games_repo.dart';
import 'package:load_api/presentation/routes/route.dart';

void main() {
 
  runApp( BlocProvider<GameDataBloc>(
    create: (context) => GameDataBloc(GamesRepo()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreenRoute,
      routes: routeName,
    );
  }
}
