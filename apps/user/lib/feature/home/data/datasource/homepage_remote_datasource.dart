import "../apiservices/home_api_service.dart";
import "../model/movies_list.dart";

class HomePageRemoteDataSource {
  HomeApiService apiService;

  HomePageRemoteDataSource(this.apiService);

  Future<MoviesList> getMovieList() async {
    return apiService.getNowShowingMovieList();
  }
}
