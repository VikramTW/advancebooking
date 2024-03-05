import 'package:common_widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:network/app_config.dart';

import '../../home/data/model/movie.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;

  const MovieDetails(this.movie, {super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState(movie);
}

class _MovieDetailsState extends State<MovieDetails> {
  final Movie movie;

  _MovieDetailsState(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(movie.title, context),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 480,
                      child: Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 1)),
                              width: 290,
                              height: 420,
                              child: Center(
                                child: Image.network(
                                    "${AppConfig.IMAGE_BASE_URL}"
                                    "${movie.posterPath}",
                                    height: 400,
                                    width: 300),
                              )))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(movie.title,
                            style: Theme.of(context).textTheme.displayLarge),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.deepOrange,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            movie.averageRating.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.displayMedium,
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text("Overview",
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Text(movie.overview,
                        style: Theme.of(context).textTheme.labelSmall),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                context.go("/seat-selection");
              },
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Center(
                    child: Text(
                  "Book Show",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
