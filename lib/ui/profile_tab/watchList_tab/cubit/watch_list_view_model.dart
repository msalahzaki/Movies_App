import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api_manger.dart';
import 'package:movies_app/auth/login/cubit/login_view_model.dart';
import 'package:movies_app/model/FavoriteResponse.dart';
import 'package:movies_app/ui/profile_tab/watchList_tab/cubit/watch_list_states.dart';

class WatchListViewModel extends Cubit<WatchListStates>{
  WatchListViewModel():super(WatchListLoadingState());
  List<FavoriteMovie>? favoriteMoviesList;
  LoginViewModel? loginViewModel ;

  void getFavoriteList({required String? token}) async{
    emit(WatchListLoadingState());
    var response =  await ApiManger.getAllFavoriteMovies(token: token??'');
    if(response.data!.isEmpty){
      emit(WatchListEmptyState());
    }else{
      favoriteMoviesList = response.data;
      emit(WatchListSuccessState());
    }
  }
}