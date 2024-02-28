import 'package:get_it/get_it.dart';
import 'package:network/client.dart';
import 'package:dio/dio.dart';
import 'package:user/feature/home/data/apiservices/home_api_service.dart';
import 'package:user/feature/home/data/datasource/homepage_remote_datasource.dart';
import 'package:user/feature/home/data/repository/home_repository_impl.dart';
import 'package:user/feature/home/presentation/home_page_state.dart';

import '../feature/home/domain/repository/home_api_repository.dart';
import '../feature/home/presentation/home_bloc.dart';

final getIt = GetIt.instance;

void setupLocator() {
  //getIt.registerSingleton<DioClient>(DioClient());
  // Alternatively you could write it if you don't like global variables
  //GetIt.I.registerSingleton<AppModel>(AppModel());
  //getIt.registerSingleton<Dio>(DioClient().getDio());
  HomeApiService apiService =
      getIt.registerSingleton<HomeApiService>(HomeApiService(DioClient().getDio()));
  HomePageRemoteDataSource remoteDataSource =
      getIt.registerSingleton<HomePageRemoteDataSource>(
          HomePageRemoteDataSource(apiService));
  HomeApiRepository repository = getIt.registerSingleton<HomeApiRepository>(
      HomeRepositoryImpl(remoteDataSource));
  getIt.registerFactory<HomeBloc>(
      () => HomeBloc(HomePageLoadingState(), repository));
}
