import 'package:user/feature/home/data/datasource/homepage_remote_datasource.dart';

import '../../domain/repository/home_api_repository.dart';
import '../model/movies_list.dart';

class HomeRepositoryImpl extends HomeApiRepository {

  late final HomePageRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<MoviesList> getMovies() {
     return _remoteDataSource.getMovieList();
  }
}
