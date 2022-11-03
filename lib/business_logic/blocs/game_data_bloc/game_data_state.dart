// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'game_data_bloc.dart';

abstract class GameDataState {}

class GameDataInitialState extends GameDataState {}

// loading state
class GameDataLoadingState extends GameDataState {}

//loaded state
class GameDataLoadedState extends GameDataState {
  final List<DataModel> apiResult;
  GameDataLoadedState({
    required this.apiResult,
  });
}


//error state
class GameDataErrorState extends GameDataState{}
