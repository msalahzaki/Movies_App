import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/model/movie_details_model.dart';
import 'package:movies_app/ui/profile_tab/history_tab/cubit/history_tab_states.dart';

class HistoryTabViewModel extends Cubit<HistoryTabStates> {

  HistoryTabViewModel() : super(HistoryTabInitialState());
  List<Movie> historyList = [];

  Future<void> getAllMoviesFromHistory() async {
    try {
      emit(HistoryTabLoadingState());
      Box watchMovies = await Hive.openBox('Movies_History');
      List<Movie> movies = watchMovies.values
          .map((data) => Movie.fromJson(data))
          .toList();
      historyList = movies;
      if(historyList.isNotEmpty){
        emit(HistoryTabSuccessState());
      }else{
        emit(HistoryTabEmptyState());
      }
      await watchMovies.close();
    } catch (e) {
      emit(HistoryTabErrorState(errorMessage: e.toString()));
    }
  }
  Future<void> RemoveMoviesFromHistory(int ID) async {

      emit(HistoryTabLoadingState());
      Box watchMovies = await Hive.openBox('Movies_History');
       await watchMovies.delete(ID);
      await watchMovies.close();
      getAllMoviesFromHistory();

  }

}
