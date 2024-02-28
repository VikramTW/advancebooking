import 'package:equatable/equatable.dart';

import '../data/model/movie.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInitialState extends HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageErrorState extends HomePageState {}

class HomePageSuccessState extends HomePageState {
  final List<Movie> movies;

  const HomePageSuccessState(this.movies);
}
