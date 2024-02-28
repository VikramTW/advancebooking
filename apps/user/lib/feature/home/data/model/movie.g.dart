// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      (json['id'] as num).toDouble(),
      json['adult'] as bool? ?? false,
      json['original_language'] as String? ?? '',
      json['original_title'] as String? ?? '',
      json['overview'] as String? ?? '',
      (json['popularity'] as num?)?.toDouble() ?? 0.0,
      json['poster_path'] as String,
      json['release_date'] as String,
      json['title'] as String,
      (json['vote_average'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'adult': instance.adult,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'vote_average': instance.averageRating,
    };
