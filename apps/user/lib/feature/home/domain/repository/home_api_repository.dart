import '../../data/model/movies_list.dart';

abstract class HomeApiRepository {
  Future<MoviesList> getMovies();
}
