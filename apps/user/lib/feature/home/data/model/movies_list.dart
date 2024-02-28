import 'package:json_annotation/json_annotation.dart';

import 'movie.dart';

part 'movies_list.g.dart';

@JsonSerializable()
class MoviesList {
  int page;
  @JsonKey(name: 'total_pages')
  int totalPages;
  @JsonKey(name: 'total_results')
  int totalResults;
  @JsonKey(name: 'results')
  final List<Movie> movies;

  MoviesList(this.page, this.totalPages, this.totalResults, this.movies);

  factory MoviesList.fromJson(Map<String, dynamic> json) =>
      _$MoviesListFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesListToJson(this);
}
