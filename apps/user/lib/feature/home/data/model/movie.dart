import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  double id = -1;
  @JsonKey(defaultValue: false)
  final bool adult;
  @JsonKey(name: 'original_language', defaultValue: "")
  final String originalLanguage;
  @JsonKey(name: 'original_title', defaultValue: "")
  String originalTitle = "";
  @JsonKey(defaultValue: "")
  String overview;
  @JsonKey(defaultValue: 0.0)
  double popularity;
  @JsonKey(name: 'poster_path')
  String posterPath = "";
  @JsonKey(name: 'release_date')
  String releaseDate = "";
  String title = "";
  @JsonKey(name: "vote_average", defaultValue: 0.0)
  double averageRating;

  Movie(
      this.id,
      this.adult,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.averageRating);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
