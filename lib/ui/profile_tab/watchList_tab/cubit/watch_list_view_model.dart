import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manger.dart';
import 'package:movies_app/model/FavoriteResponse.dart';
import 'package:movies_app/ui/profile_tab/watchList_tab/cubit/watch_list_states.dart';

class WatchListViewModel extends Cubit<WatchListStates> {
  List<FavoriteMovie> favoriteMoviesList = [];

  WatchListViewModel() : super(WatchListInitialState());

  void getFavoriteList({required String token}) async {
    try {
      emit(WatchListLoadingState());

      var response = await ApiManger.getAllFavoriteMovies(token: token);

      if (response.data == null || response.data!.isEmpty) {
        favoriteMoviesList = [];
        emit(WatchListEmptyState());
      } else {
        favoriteMoviesList = response.data!;
        emit(WatchListSuccessState());
      }
    } catch (e) {
      emit(WatchListErrorState(errorMessage: e.toString()));
    }
  }
}
