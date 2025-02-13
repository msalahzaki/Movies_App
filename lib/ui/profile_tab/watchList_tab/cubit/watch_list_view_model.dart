import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manger.dart';
import 'package:movies_app/model/FavoriteResponse.dart';
import 'package:movies_app/ui/profile_tab/watchList_tab/cubit/watch_list_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchListViewModel extends Cubit<WatchListStates> {

  WatchListViewModel() : super(WatchListInitialState());

  List<FavoriteMove> favoriteMoviesList = [];
  String? userToken;

  Future<void> _fetchData({required String? token}) async {
    try {
      emit(WatchListLoadingState());

      var response = await ApiManger.getAllFavoriteMovies(token: token??'');

      if (response.data!.isEmpty) {
        emit(WatchListEmptyState());
      } else {
        favoriteMoviesList = response.data!;
        emit(WatchListSuccessState());
      }
    } catch (e) {
      emit(WatchListErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> _getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token =  prefs.getString('user_token');
    userToken =  token;
    emit(WatchListGetTokenState());
  }

  Future<void> getFavorites() async {
    await _getUserToken();
    if (userToken != null) {
      _fetchData(token: userToken);
    }
  }
}
