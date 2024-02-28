import "package:flutter_bloc/flutter_bloc.dart";
import "package:user/feature/home/domain/repository/home_api_repository.dart";
import "package:user/feature/home/presentation/home_page_state.dart";

import "../data/model/movie.dart";
import "../data/model/movies_list.dart";

class HomeBloc extends Cubit<HomePageState> {
  HomeApiRepository repository;

  HomeBloc(super.initialState, this.repository);

  late List<Movie> nowPlayingMovies;

  void getMovieList() async {
    emit(HomePageLoadingState());
    try {
      MoviesList moviesList = await repository.getMovies();
      if (moviesList.movies.isNotEmpty) {
        nowPlayingMovies = moviesList.movies;
        emit(HomePageSuccessState(moviesList.movies));
      }
    } on Exception catch (ex, s) {
      print(s);
      emit(HomePageErrorState());
    }
  }
}
