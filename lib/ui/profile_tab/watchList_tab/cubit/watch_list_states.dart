import 'package:movies_app/model/FavoriteResponse.dart';

abstract class WatchListStates{}
class WatchListLoadingState extends WatchListStates{}
class WatchListSuccessState extends WatchListStates{}
class WatchListEmptyState extends WatchListStates{}
class WatchListErrorState extends WatchListStates{
  String errorMessage;
  WatchListErrorState({required this.errorMessage});
}
class WatchListInitialState extends WatchListStates{}