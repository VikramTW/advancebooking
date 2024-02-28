import "package:dio/dio.dart";
import "package:retrofit/retrofit.dart";

import "../model/movies_list.dart";

part 'home_api_service.g.dart';

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET("/movie/now_playing?language=en-US&page=1")
  Future<MoviesList> getNowShowingMovieList();
}
