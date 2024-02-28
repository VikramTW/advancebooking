import 'package:flutter/material.dart';

import '../data/model/movie.dart';
import 'movie_tile.dart';

Widget movieHorizontalList(
    BuildContext context, String title, List<Movie> movies) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      SizedBox(
        height: 300,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            Movie? movie = movies[index];
            return MovieTile(movie);
          },
        ),
      ),
    ],
  );
}
