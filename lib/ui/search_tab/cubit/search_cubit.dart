import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:movies_app/ui/search_tab/search_response.dart';
class SearchMovieCubit extends Cubit<SearchState> {
  SearchMovieCubit() : super(SearchInitial());

  Future<void> searchMovies(String q) async {
    if (q.isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
    final url = 'https://yts.mx/api/v2/list_movies.json?query_term=$q';
    try {
      final response = await http.get(Uri.parse(url));
      final responseBody = json.decode(response.body);
      final movies = responseBody['data']['movies'] ?? [];
      emit(SearchLoaded(movies));
    } catch (e) {
      emit(SearchError('Error fetching movies: $e'));
    }
  }
}