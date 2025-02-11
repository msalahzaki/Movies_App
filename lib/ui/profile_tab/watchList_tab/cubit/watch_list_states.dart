import 'package:movies_app/model/FavoriteResponse.dart';

abstract class WatchListStates{}
class WatchListLoadingState extends WatchListStates{}
class WatchListSuccessState extends WatchListStates{}
class WatchListEmptyState extends WatchListStates{}